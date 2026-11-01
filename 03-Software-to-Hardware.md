# 3. From Software to Hardware

An application written in C does not run on hardware directly. It passes through several translation steps before the RTL of the processor executes it.

```text
C program ─► compiler ─► assembly ─► assembler ─► machine code (binary)
                                                       │
                                                       ▼
                                         RTL of the processor (implements the ISA)
                                                       │
                                                  synthesis ─► layout
```

## Steps

1. **C code** – the application.
2. **Compiler** – translates C into assembly for the target ISA, e.g. with the RISC-V GCC toolchain.
3. **Assembler** – turns assembly into binary machine code.
4. **Hardware** – an RTL description of a core fetches, decodes and executes those binary instructions.

## Example commands (RISC-V toolchain)

```bash
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o prog.o prog.c
riscv64-unknown-elf-objdump -d prog.o       # view the generated assembly
```

Changing `-O1` to `-Ofast` changes how many instructions the same C code produces. This shows that software choices affect what the hardware executes.

## Checking the hardware

The same binary can be run in a software ISA simulator (for example Spike) and on the RTL simulation of the core. If both give the same results, the RTL implements the ISA correctly for that program.

> 📷 *Optional: add a screenshot of your `objdump` output here.*
