# Module 7 – Floorplanning, Library Cells and Placement

## Overview

After synthesis the design is a netlist: cells and connections, with no physical position. This module covers the first physical stages: **floorplanning** (how big the chip is, where the pins and power go) and **placement** (where every cell sits), and the library information those stages rely on.

## Objectives

- Define utilization factor and aspect ratio and compute them.
- Explain pre-placed cells, decoupling capacitors, power planning, pin placement and blockages.
- Run `run_floorplan` and `run_placement` in OpenLANE and inspect results in Magic.
- Explain library binding and placement optimization.
- Explain how a standard cell is characterized and what the timing parameters mean.

## Contents

| # | File | Topic |
|---|---|---|
| 1 | [01-Floorplanning.md](01-Floorplanning.md) | Floorplan overview, die and core |
| 2 | [02-Utilization-and-Aspect-Ratio.md](02-Utilization-and-Aspect-Ratio.md) | Two key numbers |
| 3 | [03-Preplaced-Cells.md](03-Preplaced-Cells.md) | Macros and IP blocks |
| 4 | [04-Decoupling-Capacitors.md](04-Decoupling-Capacitors.md) | Local charge storage |
| 5 | [05-Power-Planning.md](05-Power-Planning.md) | Power grid |
| 6 | [06-Pin-Placement-and-Blockages.md](06-Pin-Placement-and-Blockages.md) | I/O pins, keep-out regions |
| 7 | [07-Running-Floorplan.md](07-Running-Floorplan.md) | `run_floorplan` |
| 8 | [08-Viewing-Floorplan-in-Magic.md](08-Viewing-Floorplan-in-Magic.md) | Inspecting the DEF |
| 9 | [09-Library-Binding.md](09-Library-Binding.md) | Netlist cells ↔ physical cells |
| 10 | [10-Placement-Optimization.md](10-Placement-Optimization.md) | Global/detailed placement, congestion |
| 11 | [11-Library-Characterization.md](11-Library-Characterization.md) | How cell timing is produced |
| 12 | [12-Timing-Parameters.md](12-Timing-Parameters.md) | Delay and slew definitions |
| – | [Practical-Design.md](Practical-Design.md) | picorv32a floorplan and placement lab |

## Flow covered

```text
Synthesized netlist ─► Floorplan ─► Placement ─► (CTS, routing, signoff…)
                         │              │
              die/core, pins,     global + detailed placement,
              power, macros       optimization, congestion handling
```
