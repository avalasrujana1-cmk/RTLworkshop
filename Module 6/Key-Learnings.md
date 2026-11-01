# Key Learnings – Module 6

- Open tools, an open PDK and an open ISA together make a complete, free RTL-to-GDSII flow.
- Software reaches hardware through compiler → assembler → binary → RTL that implements the ISA.
- The ASIC flow is synthesis → floorplan → placement → CTS → routing → signoff → GDSII.
- OpenLANE wraps Yosys, OpenROAD, Magic and Netgen behind Tcl and configuration files.
- `sky130_fd_sc_hd` is the high-density cell library; `tt_025C_1v80` is its typical corner.
- `prep` creates the run folder and merged LEF; each `run_*` command adds one stage.
- The synthesis report gives cell count, flip-flop count (flop ratio) and area.
- Slack is the main timing metric: positive meets timing, negative fails.
