# 6. OpenLANE

## Architecture

OpenLANE is a Tcl-driven flow that wraps open-source tools. Its core is built from **OpenROAD** (physical stages), **Yosys** (synthesis), **Magic** (layout, DRC, GDS) and **Netgen** (LVS), together with scripts, configuration files and design exploration utilities.

## Two ways to run

| Mode | Command | Use |
|---|---|---|
| **Autonomous** | `./flow.tcl -design <name>` | Whole flow in one go |
| **Interactive** | `./flow.tcl -interactive` | One stage at a time, change variables between stages |

This module uses interactive mode so every stage can be inspected.

## Configuration

Settings are Tcl variables (`set ::env(NAME) value`). They are read in layers, and a later layer overrides an earlier one:

1. OpenLANE defaults
2. The design's `config.tcl`
3. PDK/standard-cell-library specific settings
4. Values you type in the interactive session

## Design exploration

OpenLANE can sweep over configuration variables and report which combination gives the best area, timing or violation count. It is useful for finding good strategy settings for a design.

## Other features

- Cell-type exclusion ("don't use" lists)
- Optional scan insertion (DFT) and ECO-style fix-ups
- A final summary report with metrics from each stage
