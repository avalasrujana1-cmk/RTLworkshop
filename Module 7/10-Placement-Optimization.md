# 10. Placement and Optimization

```tcl
run_placement
```

## Stages

1. **Global placement** – gives every cell an approximate position, minimizing estimated wire length (and watching density), without worrying about overlaps.
2. **Legalization (detailed placement)** – snaps cells to rows and sites, removes overlaps, and keeps them as close to the global result as possible.

## Optimization during placement

- **Buffering / repeaters:** long wires have high resistance and capacitance. The tool inserts buffers to restore the signal and reduce delay.
- **Cell sizing:** a cell on a critical path can be swapped for a stronger version.
- Estimates use wire length from the current placement to calculate parasitics.

## Congestion

If too many nets want to pass through one region, routing will be hard. Congestion-aware placement spreads cells apart in dense areas to leave routing resources, at the cost of slightly longer wires elsewhere.

## Output

```text
designs/picorv32a/runs/<tag>/results/placement/picorv32a.placement.def
```

## Viewing

Open it in Magic the same way as the floorplan (topic 8), replacing the DEF name. Cells should now fill the rows; there should be no overlaps.

> 📷 *Add screenshots: whole placement, and a zoomed region showing standard cells in rows.*
