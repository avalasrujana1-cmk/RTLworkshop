# RTL Design Workshop – Verilog, Yosys and SKY130

> Hands-on RTL design flow: Verilog RTL → simulation → synthesis → gate-level simulation → optimization → OpenLANE physical design.

## About

This repository documents the work done in the RTL Design Workshop (VSD-IAT) using open-source tools. It follows one design flow from the first Verilog module to a placed and floorplanned SoC block.

## Tools

| Tool | Purpose |
|---|---|
| Verilog HDL | RTL design |
| Icarus Verilog | RTL and gate-level simulation |
| GTKWave | Waveform viewing |
| Yosys | Logic synthesis |
| SKY130 PDK (`sky130_fd_sc_hd`) | Standard-cell library |
| OpenLANE, OpenROAD, Magic | RTL-to-GDSII flow, floorplan and placement |
| Ubuntu Linux, Git & GitHub | Environment and version control |

## Modules

| Module | Topic |
|---|---|
| [Module 0](Module%200) | Workshop introduction, lab and tool setup |
| [Module 1](Module%201) | Verilog RTL design, simulation, GTKWave, Yosys synthesis |
| [Module 2](Module%202) | Timing libraries, hierarchical vs flat synthesis, flip-flop styles |
| [Module 3](Module%203) | Combinational and sequential logic optimization |
| [Module 4](Module%204) | Blocking vs non-blocking assignments, GLS and simulation–synthesis mismatch |
| [Module 5](Module%205) | RTL optimization: IF, CASE, latches, FOR loops, generate |
| [Module 6](Module%206) | OpenLANE and SKY130: RISC-V, SoC, RTL-to-GDSII flow, synthesis |
| [Module 7](Module%207) | Floorplanning, library cells, placement, characterization |
| [BabySoc](BabySoc) | VSDBabySoC pre-synthesis and gate-level simulation |

## Design flow

```text
Verilog RTL
    │
Testbench ──► RTL simulation (Icarus Verilog) ──► Waveforms (GTKWave)
    │
Yosys synthesis (SKY130 liberty)
    │
Gate-level netlist ──► Gate-level simulation (compare with RTL)
    │
RTL optimization
    │
OpenLANE: floorplan → placement → CTS → routing → signoff
    │
GDSII
```

## Reproducing the Module 5 labs

```bash
bash scripts/setup.sh                      # downloads liberty + cell models into lib/
cd "Module 5/labs/lab03_for_and_generate"
make all                                   # simulate, synthesize, gate-level simulate
```

Requires `iverilog`, `yosys`, `make` (and `gtkwave` to view waveforms).

## Learning outcomes

- Write synthesizable Verilog and self-checking testbenches.
- Read standard-cell timing libraries and the Yosys statistics report.
- Recognise and avoid latch inference and simulation–synthesis mismatch.
- Follow the RTL-to-GDSII flow in OpenLANE through floorplan and placement.

## Future scope

FSM design, pipelining, arithmetic units, processor design, full ASIC flow through signoff.

## Author

**Name:** Avala Srujana
**Course:** RTL Design Workshop
**Platform:** VSD-IAT
