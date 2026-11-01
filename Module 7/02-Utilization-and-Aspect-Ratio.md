# 2. Utilization Factor and Aspect Ratio

```text
Utilization factor = (area occupied by the netlist) / (total core area)
Aspect ratio       = core height / core width
```

## Worked example

Netlist area (all standard cells, no macros) = 40 000 µm².

| Target utilization | Core area needed | Square core (AR = 1) side |
|---|---|---|
| 100 % | 40 000 µm² | 200 µm |
| 50 % | 80 000 µm² | 282.8 µm |
| 25 % | 160 000 µm² | 400 µm |

A utilization of 100 % leaves no room for buffers, clock tree cells or routing. A common starting value is 50 % or less; the free area is used by later optimization steps.

## Aspect ratio

- `AR = 1` is a square core.
- `AR = 0.5` is wide and short (height half the width).
- `AR = 2` is tall and narrow.

With 50 % utilization and `AR = 0.5` for the same netlist: core area 80 000 µm², so width × (0.5 · width) = 80 000 and width = 400 µm, height = 200 µm.

## In OpenLANE

```tcl
set ::env(FP_CORE_UTIL) 50
set ::env(FP_ASPECT_RATIO) 1
```

These take effect when `run_floorplan` runs.
