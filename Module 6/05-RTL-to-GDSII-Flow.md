# 5. RTL-to-GDSII Flow

| # | Stage | What happens | Tool in OpenLANE |
|---|---|---|---|
| 1 | **Synthesis** | RTL → gate-level netlist mapped to standard cells | Yosys, ABC |
| 2 | **Floorplanning** | Die and core size, I/O pins, power grid, macro placement | OpenROAD |
| 3 | **Placement** | Global placement then legalization of every cell | OpenROAD |
| 4 | **CTS** | Build a balanced clock tree | OpenROAD (TritonCTS) |
| 5 | **Routing** | Connect all nets (global then detailed) | OpenROAD (FastRoute, TritonRoute) |
| 6 | **Signoff** | Extract parasitics, STA, DRC, LVS, antenna checks | OpenSTA, Magic, Netgen |
| 7 | **GDSII** | Final layout for the foundry | Magic / KLayout |

```text
RTL ─► Synthesis ─► Floorplan ─► Placement ─► CTS ─► Routing ─► Signoff ─► GDSII
```

## What each stage hands to the next

- Synthesis → netlist (`.v`)
- Floorplan → `.def` with die, core, pins, power grid
- Placement → `.def` with every cell location
- CTS → netlist + `.def` with clock buffers
- Routing → `.def` with all wires
- Signoff → GDSII plus DRC, LVS and timing reports

## Checks at signoff

- **DRC** – layout obeys foundry geometry rules.
- **LVS** – layout connectivity matches the netlist.
- **STA** – setup and hold timing is met.
- **Antenna** – no net collects too much charge during fabrication.
