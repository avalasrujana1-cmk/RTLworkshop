# 4. SoC Design and Why OpenLANE

## What is an SoC?

A System-on-Chip puts the processor and the blocks around it on one die:

- CPU core(s) (e.g. a RISC-V core)
- On-chip memory (SRAM)
- Peripherals (UART, GPIO, timers, SPI)
- Analog IP (PLL, DAC/ADC)
- Interconnect (bus)

Many of those blocks are **IP**: reusable designs that are either written in-house or obtained from a vendor or the open-source community.

## What is needed to build one?

| Ingredient | Role |
|---|---|
| RTL / IP | The design itself |
| EDA tools | Convert RTL into layout |
| PDK | Foundry rules, cell libraries, device models |

## Why OpenLANE

Running each tool by hand and passing files between them is slow and error-prone. **OpenLANE** is an automated flow: it runs synthesis, floorplanning, placement, clock-tree synthesis, routing and signoff checks from one configuration, using open tools and the SKY130 PDK. The aim is a result with **no human in the loop** for a clean design, while still allowing step-by-step runs for learning and debugging.
