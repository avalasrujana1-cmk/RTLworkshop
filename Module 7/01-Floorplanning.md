# 1. Floorplanning

## Goal

Decide the **shape and size of the chip**, where the fixed objects go, and prepare the area for automatic placement.

## Terms

| Term | Meaning |
|---|---|
| **Die** | The whole silicon rectangle, including the I/O ring |
| **Core** | The inner area where standard cells are placed |
| **Pin / port** | Connection between the core logic and the outside |
| **Macro / pre-placed cell** | A large block with a fixed position |

## What a floorplan decides

- Core area, from the netlist area and the target utilization
- Core shape (aspect ratio)
- Positions of pre-placed macros
- Power grid structure
- I/O pin positions
- Regions where cells must not be placed (blockages)

## Good vs bad floorplan

A poor floorplan costs area, gives long wires, and makes timing and routing hard. Signs of a good floorplan: connected blocks sit close together, macros are along the edges so they do not split the placement area, pins sit near the logic they connect to, and the power grid is regular.
