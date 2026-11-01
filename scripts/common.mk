# Shared make rules. A lab Makefile sets ROOT (relative path to repo root) and a list of
# DESIGNS, then includes this file.  Convention: <name>.v holds module <name>, tb_<name>.v its testbench.
SHELL  := /bin/bash
LIB    := $(ROOT)/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
MODELS := $(ROOT)/lib/verilog_model
RES    := results
FLATTEN ?= 1

.PHONY: all clean
all: $(addprefix run-,$(DESIGNS)) $(addprefix synth-,$(SYNTH_ONLY))

$(RES):
	mkdir -p $(RES)

# RTL simulation (Icarus Verilog)
sim-%: | $(RES)
	iverilog -o $(RES)/$*_sim.out $*.v tb_$*.v
	vvp $(RES)/$*_sim.out | tee $(RES)/$*_sim.log

# Synthesis (Yosys + SKY130 typical liberty)
synth-%: | $(RES)
	yosys -q -l $(RES)/$*_synth.log -p "read_liberty -lib $(LIB); read_verilog $*.v; synth -top $*; dfflibmap -liberty $(LIB); opt; abc -liberty $(LIB); $(if $(FLATTEN),flatten;) clean; stat -liberty $(LIB); write_verilog -noattr $(RES)/$*_synth.v" 2>/dev/null
	@awk '/Printing statistics/{buf=""} {buf=buf $$0 ORS} END{printf "%s",buf}' $(RES)/$*_synth.log | grep -v '^$$' | grep -v -E 'ABC|Executing|Removing|Finished|Dumping|Warnings|End of script|Logfile|Yosys 0|Time spent' > $(RES)/$*_stats.txt || true

# Gate-level simulation of the netlist with the same testbench
gls-%: synth-%
	iverilog -DFUNCTIONAL -DUNIT_DELAY=\#0 -o $(RES)/$*_gls.out $(MODELS)/primitives.v $(MODELS)/sky130_fd_sc_hd.v $(RES)/$*_synth.v tb_$*.v
	vvp $(RES)/$*_gls.out | tee $(RES)/$*_gls.log

run-%: sim-% gls-% ;

clean:
	rm -rf $(RES)
