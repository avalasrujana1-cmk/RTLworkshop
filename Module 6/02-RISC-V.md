# 2. RISC-V

## What it is

RISC-V is an open instruction-set architecture (ISA). An ISA is the contract between software and hardware: the instructions a processor understands and their binary encoding. Because RISC-V is open, anyone can design a core that implements it without paying for the ISA.

## Key points

- **Modular:** a small base integer ISA (for example RV32I) plus optional extensions (M for multiply/divide, C for compressed instructions, and others).
- **Register-based load/store design:** 32 general-purpose registers in the base ISA.
- **Free to implement and extend.**

## picorv32a

`picorv32a` is a small, size-optimized RV32 core written in Verilog (PicoRV32 by Claire Wolf). It is the design used throughout the OpenLANE practical sessions because it is a realistic synthesizable CPU that still fits in a short flow run.

## Why it appears in a physical-design course

A real SoC block gives non-trivial things to look at: a register file, an ALU, an instruction decoder, thousands of flip-flops, and real timing paths.
