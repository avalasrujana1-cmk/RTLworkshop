# 5. Power Planning

## Why

If the whole chip were fed from a single point, cells far from it would see a lower supply (IR drop), and when many cells switch at once the ground rail can rise locally (**ground bounce**). Both reduce noise margin.

## Power distribution network (PDN)

Instead of one connection, the design uses a **grid** of power and ground straps on the upper metal layers, with many connections down to the standard-cell rails.

- Horizontal straps on one metal layer, vertical straps on another.
- Spacing, width and pitch are set to keep IR drop within limits.
- Standard cells take power from rails on the lowest metals.

## In the OpenLANE flow

The grid is built by:

```tcl
gen_pdn
```

In the OpenLANE version used for this workshop, this command is run after clock-tree synthesis and before routing; in newer releases it may be part of the floorplan stage. Check your version's flow description.

## Checks

After the grid is built, IR drop and electromigration are checked at signoff.
