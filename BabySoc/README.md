# VSDBabySoC

## What it is

VSDBabySoC is a small SoC used in the workshop to tie the flow together. It combines three blocks:

| Block | Role |
|---|---|
| **RVMYTH** | A simple RISC-V CPU core |
| **PLL** | Generates the internal clock from a reference clock |
| **DAC** | 10-bit digital-to-analog converter driven by the CPU's output |

```text
 REF clock ─► PLL ─► CLK ─► RVMYTH ─► 10-bit value ─► DAC ─► analog OUT
                                 ▲
                              reset
```

## Pre-synthesis simulation

The project repository (VSDBabySoC) provides a Makefile for the simulation flow. Typical usage:

```bash
git clone https://github.com/manili/VSDBabySoC.git
cd VSDBabySoC
make pre_synth_sim          # compile with Icarus Verilog and run
gtkwave output/pre_synth_sim/pre_synth_sim.vcd
```

> Target names and output folders depend on the repository version, so check its README if a command fails.

## Signals to look at in GTKWave

| Signal | What to check |
|---|---|
| `CLK` | Clock produced by the PLL model |
| `reset` | Released after startup |
| `RV_TO_DAC` | 10-bit value the CPU sends to the DAC |
| `OUT` | DAC output, shown as an analog waveform |

## Gate-level simulation

After synthesizing the digital part with Yosys (the same flow as Modules 2–5), the netlist is simulated with the same testbench, and the waveform is compared with the pre-synthesis one. Matching output confirms that synthesis preserved the behaviour.

## Screenshots to add

- 📷 Pre-synthesis waveform (GTKWave) with `CLK`, `reset`, `RV_TO_DAC`, `OUT`
- 📷 Post-synthesis (gate-level) waveform
- 📷 Block diagram / `show` output of the synthesized design

## Results (fill from your run)

| Check | Result |
|---|---|
| Pre-synthesis simulation runs | |
| Gate-level simulation runs | |
| Waveforms match | |
