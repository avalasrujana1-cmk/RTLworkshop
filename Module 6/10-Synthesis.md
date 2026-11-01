# 10. Synthesis in OpenLANE

```tcl
run_synthesis
```

Yosys reads the RTL, optimizes it, maps flip-flops and combinational logic to the SKY130 library using ABC, and writes a gate-level netlist. OpenSTA then runs a first timing report on that netlist.

## Variables that steer synthesis

| Variable | Effect |
|---|---|
| `SYNTH_STRATEGY` | Picks area or delay oriented ABC scripts (for example `AREA 0`, `DELAY 0`) |
| `SYNTH_BUFFERING` | Allow buffer insertion on high-fanout nets |
| `SYNTH_SIZING` | Allow cell up/down-sizing |
| `SYNTH_MAX_FANOUT` | Fanout limit used while buffering |
| `SYNTH_NO_FLAT` | Keep the hierarchy instead of flattening |

A delay-oriented strategy tends to give a faster but larger netlist; an area-oriented one does the opposite.

## Outputs

| Output | Typical path (under the run folder) |
|---|---|
| Gate-level netlist | `results/synthesis/picorv32a.synthesis.v` |
| Cell statistics | `reports/synthesis/…stat.rpt` |
| Timing report | `reports/synthesis/…sta…rpt` |

## Relation to Module 2–5

It is the same Yosys synthesis step you ran by hand (`read_liberty`, `synth`, `abc -liberty`), now wrapped in scripts, with design-level settings in `config.tcl`.
