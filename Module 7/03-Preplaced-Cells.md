# 3. Pre-placed Cells

## Definition

Some blocks are too big or too special to be placed automatically with the standard cells: memories, analog IP, a PLL, large multipliers, clock-gating cells. They are placed **by hand first**, and the tool treats them as fixed obstacles.

## Why

- They are reused: designed once, instantiated in many chips.
- Their position often affects timing and power distribution.
- They are treated as **black boxes** by the logic flow: the netlist only needs their ports, and the physical view comes from the LEF/GDS.

## Rules

- Place them so they do not cut the standard-cell area into awkward pieces. The edges and corners are usual.
- Keep their pins close to the logic they talk to.
- Mark them **fixed** so placement does not move them.

## Surrounding cells

Automatic placement fills the remaining space around the macros. Decoupling capacitors (topic 4) are put close to them.
