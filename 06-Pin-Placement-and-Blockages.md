# 6. Pin Placement and Placement Blockages

## I/O pins

Pins sit on the boundary between the core and the die edge. Their positions matter because they set where wires enter the chip.

- Pins for related signals should be near each other and near the logic that uses them.
- Clock pins are usually larger or have special treatment, since the clock net is heavily loaded.
- Pin order is a trade-off between wire length and the package/board.

## Pin layers

Horizontal pins use one metal, vertical pins another. OpenLANE exposes this with variables such as:

```tcl
set ::env(FP_IO_HMETAL) 4
set ::env(FP_IO_VMETAL) 3
```

(layer numbers refer to the PDK's metal list; check the default values in your configuration.)

## Pin placement mode

```tcl
set ::env(FP_IO_MODE) <value>
```

selects how pins are distributed (for example equally spaced versus following connectivity). See the OpenLANE variable documentation for the exact meaning of each value in your version.

## Placement blockages

A **blockage** is an area where the placer must not put standard cells. They are used under pin regions, around macros, and in areas reserved for power or clock cells, so that the router keeps access and the area stays free for its intended use.
