# 9. Library Binding

The synthesized netlist is a list of **logical** instances, for example an `and2` or a flip-flop. Placement needs **physical** information: width, height and pin positions. Library binding connects the two.

```text
Netlist instance  ──►  Library cell
(sky130_fd_sc_hd__and2_1)   ├─ LEF: size, pin shapes, blockages
                            ├─ Liberty: delay, power, capacitance
                            └─ GDS: layout (used at the end)
```

## Why it matters

- Different drive strengths of one function (for example `and2_0`, `and2_2`, `and2_4`) have different size and speed. The tool uses these as options when optimizing.
- Cell height is constant in a library (all cells fit the same row height), which makes row-based placement possible.
- Timing during placement uses liberty tables together with estimated wire load.

## Tools

The merged LEF created by `prep` contains the technology and cell abstracts. Magic and the placer both read it.
