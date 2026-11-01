# Module 6 – OpenLANE and the SKY130 PDK

## Overview

Modules 1–5 stopped at the gate-level netlist. This module starts the physical-design side: what an SoC is, why open-source EDA and RISC-V make a free RTL-to-GDSII flow possible, how the OpenLANE flow is organised, and how to run the first stage, synthesis, on the `picorv32a` RISC-V core.

## Objectives

- Explain why open-source EDA, open PDKs and open ISAs matter.
- Trace a C program down to hardware (compiler → assembly → binary → RTL).
- Describe the RTL-to-GDSII stages and the tool behind each one.
- Understand the SKY130 PDK and its standard-cell libraries.
- Prepare a design in OpenLANE and run synthesis.
- Read the synthesis reports.

## Contents

| # | File | Topic |
|---|---|---|
| 1 | [01-Open-Source-EDA.md](01-Open-Source-EDA.md) | Why open-source EDA, tool landscape |
| 2 | [02-RISC-V.md](02-RISC-V.md) | RISC-V ISA and the picorv32a core |
| 3 | [03-Software-to-Hardware.md](03-Software-to-Hardware.md) | From C code to a hardware implementation |
| 4 | [04-SoC-and-OpenLANE.md](04-SoC-and-OpenLANE.md) | SoC building blocks, why OpenLANE |
| 5 | [05-RTL-to-GDSII-Flow.md](05-RTL-to-GDSII-Flow.md) | The ASIC flow stage by stage |
| 6 | [06-OpenLANE.md](06-OpenLANE.md) | OpenLANE architecture and modes |
| 7 | [07-SKY130-PDK.md](07-SKY130-PDK.md) | The SKY130 PDK and its cell libraries |
| 8 | [08-OpenLANE-Directory-Structure.md](08-OpenLANE-Directory-Structure.md) | Where everything lives |
| 9 | [09-Design-Preparation.md](09-Design-Preparation.md) | `prep -design` and configuration |
| 10 | [10-Synthesis.md](10-Synthesis.md) | `run_synthesis` and its knobs |
| 11 | [11-Synthesis-Results.md](11-Synthesis-Results.md) | Reading reports, flop ratio |
| – | [Important-OpenLANE-Commands.md](Important-OpenLANE-Commands.md) | Command cheat sheet |
| – | [Practical-Design.md](Practical-Design.md) | picorv32a lab walkthrough |
| – | [Key-Learnings.md](Key-Learnings.md) | Summary |

## Flow covered in this module

```text
RTL (picorv32a) ─► prep ─► synthesis (Yosys + ABC) ─► netlist + reports
                                   │
                  floorplan, placement, CTS, routing ─► Module 7 and beyond
```

> **Note on results.** OpenLANE needs Docker and the full SKY130 PDK, so the numbers in your own run (cell count, area, flop ratio, slack) go into the tables marked *Your result*. Command output depends on the OpenLANE version, so check it against the one you installed.
