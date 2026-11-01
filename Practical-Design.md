# Practical: Floorplan and Placement of picorv32a

## Goal

Run floorplan and placement on `picorv32a`, inspect them in Magic, and record the core size.

## Steps

1. Start OpenLANE and prepare the design:
   ```tcl
   package require openlane <version>
   prep -design picorv32a
   run_synthesis
   ```
2. Check and set floorplan variables:
   ```tcl
   echo $::env(FP_CORE_UTIL)
   echo $::env(FP_ASPECT_RATIO)
   ```
3. Run the floorplan:
   ```tcl
   run_floorplan
   ```
4. Read `DIEAREA` from `results/floorplan/picorv32a.floorplan.def`, convert to µm (divide by 1000), and compute the area.
5. Open the floorplan in Magic (topic 8) and inspect pins, rows and tap cells.
6. Run placement:
   ```tcl
   run_placement
   ```
7. Open `results/placement/picorv32a.placement.def` in Magic and check that cells are legalized in rows.

## Screenshots to add

- 📷 `run_floorplan` output
- 📷 `DIEAREA` line in the DEF
- 📷 Floorplan in Magic
- 📷 `run_placement` output
- 📷 Placement in Magic (full view and zoomed)

## Results table (fill from your run)

| Item | Value |
|---|---|
| `FP_CORE_UTIL` | |
| `FP_ASPECT_RATIO` | |
| Die width × height (µm) | |
| Die area (µm²) | |
| Placement completed without errors | |

## Questions

- Does the die area match what you expect from the synthesized netlist area and the utilization?
- What changes in the floorplan when you change `FP_IO_MODE`?
- Where do you see the effect of congestion-aware placement?
