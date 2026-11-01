# 8. Viewing the Floorplan in Magic

Magic reads the merged LEF (cell shapes) and the DEF (positions).

```bash
cd designs/picorv32a/runs/<tag>/results/floorplan
magic -T <path>/pdks/sky130A/libs.tech/magic/sky130A.tech \
      lef read ../../tmp/merged.lef \
      def read picorv32a.floorplan.def &
```

## Moving around

| Key / action | Effect |
|---|---|
| `s` | Select the object under the cursor |
| `v` | Fit the view to the whole layout |
| `z` / `Shift+z` | Zoom in / out |
| Left+right click | Draw a box for zoom |
| `what` (in the console) | Print info about the selection |

## What to check

- Pins are on the die edges, at the layers you configured.
- Standard-cell rows are present in the core, with tap/well-tap cells inserted.
- The core area matches `FP_CORE_UTIL` and the aspect ratio.
- Selecting a cell and running `what` shows its master name (for example `sky130_fd_sc_hd__...`).

> 📷 *Add screenshots: whole floorplan, a zoomed pin, a zoomed cell row.*
