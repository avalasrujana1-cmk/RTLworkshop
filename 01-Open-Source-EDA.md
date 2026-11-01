# 1. Open-Source EDA

## Why it matters

Chip design used to need three closed ingredients: commercial EDA tools, a foundry PDK under NDA, and a processor ISA under licence. Each one is now available in an open form, which lets students, start-ups and researchers go from RTL to GDSII without a licence.

## The three open pillars

| Pillar | Open option |
|---|---|
| Tools | Yosys, OpenROAD, Magic, Netgen, OpenSTA, KLayout, ngspice, Icarus Verilog |
| PDK | SkyWater SKY130 (130 nm) |
| ISA | RISC-V |

## Tool map

| Step | Open tool |
|---|---|
| RTL simulation | Icarus Verilog, Verilator |
| Synthesis | Yosys (with ABC) |
| Floorplan, placement, CTS, routing | OpenROAD |
| Layout viewing/editing, DRC, extraction | Magic, KLayout |
| LVS | Netgen |
| Static timing analysis | OpenSTA |
| Circuit simulation, characterization | ngspice |

## Take-away

Open tools are driven by scripts, so flows are reproducible: the same Tcl and config files give the same run on any machine. OpenLANE (topic 6) glues these tools together.
