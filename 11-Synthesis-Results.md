# 11. Synthesis Results

## Reading the statistics report

The `stat` report lists every cell type used, the total number of cells and the chip area. Three numbers are worth recording.

| Quantity | Where |
|---|---|
| Total cell count | "Number of cells" |
| Flip-flop count | cells named `sky130_fd_sc_hd__dfxtp_*`, `dfrtp_*` and similar |
| Chip area | "Chip area for module" |

## Flop ratio

```text
flop ratio = (number of flip-flops) / (total number of cells)
```

It tells you how register-heavy the design is. A CPU with a large register file gives a clearly higher ratio than a purely combinational block.

## Your result (fill in from your run)

| Metric | Value |
|---|---|
| Design | picorv32a |
| Strategy used | |
| Total cells | |
| Flip-flops | |
| Flop ratio | |
| Chip area (µm²) | |
| Worst slack (ns) | |

> 📷 *Add a screenshot of `yosys_2.stat.rpt` (or the equivalent) and the synthesis summary.*

## Timing: slack in one paragraph

Slack = required time − arrival time. Positive slack means the path meets timing, negative means it fails. The worst negative slack (WNS) is the number to watch, and the total negative slack (TNS) adds up all failing endpoints. Floorplan, placement and CTS all change slack, so re-check it after each stage.
