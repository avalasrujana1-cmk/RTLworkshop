# 8. OpenLANE Directory Structure

```text
openlane_working_dir/
├── pdks/                      PDK installed here (e.g. sky130A)
└── openlane/
    ├── flow.tcl               main entry point
    ├── configuration/         default variable files (e.g. general.tcl)
    ├── scripts/               Tcl/Python helpers for each stage
    ├── designs/
    │   └── picorv32a/
    │       ├── src/           RTL source files
    │       ├── config.tcl     design-specific configuration
    │       └── runs/
    │           └── <tag>/
    │               ├── config.tcl   snapshot of variables used
    │               ├── logs/        per-stage logs
    │               ├── reports/     per-stage reports
    │               ├── results/     netlists, DEF, GDS per stage
    │               └── tmp/         intermediate files (merged LEF here)
    └── ...
```

## What to look at after each stage

| Stage | Look in |
|---|---|
| Synthesis | `results/synthesis`, `reports/synthesis` |
| Floorplan | `results/floorplan` |
| Placement | `results/placement` |
| Anything that failed | `logs/<stage>` |

> The exact tree differs a little between OpenLANE releases, so run `ls` on your own installation and adjust.
