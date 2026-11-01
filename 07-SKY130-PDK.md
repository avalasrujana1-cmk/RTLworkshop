# 7. The SKY130 PDK

## What a PDK contains

A Process Design Kit holds everything a designer needs to target one fabrication process: device models, layout rules (DRC), extraction rules, standard-cell libraries, and tech files. SKY130 is the open 130 nm CMOS PDK released by Google and SkyWater.

## Standard-cell libraries

| Library | Intended use |
|---|---|
| `sky130_fd_sc_hd` | High density (used in this workshop) |
| `sky130_fd_sc_hdll` | High density, low leakage |
| `sky130_fd_sc_hs` | High speed |
| `sky130_fd_sc_ms` | Medium speed |
| `sky130_fd_sc_ls` | Low speed |
| `sky130_fd_sc_lp` | Low power |

Reading the name `sky130_fd_sc_hd__and2_1`: process `sky130`, foundry-defined `fd`, standard cell `sc`, library `hd`, cell `and2`, drive strength `1`.

## Corner names

`tt_025C_1v80` = typical process (tt), 25 °C, 1.80 V. The same library also ships in other process/voltage/temperature corners (ss, ff) for worst-case and best-case timing.

## Files you meet

| File | Content |
|---|---|
| `*.lib` (liberty) | Timing, power and area per cell |
| `*.lef` | Cell abstract: size, pin shapes, blockages |
| `*.gds` | Actual cell layout |
| `*.tech` | Magic technology file |
| `*.spice` | Transistor-level netlists for simulation |

## Layers

The process has a local interconnect layer (`li1`) and five metal layers (`met1`–`met5`), plus poly, diffusion and via layers. The router and the power grid use specific metals, and the choice of pin layers appears again in Module 7.
