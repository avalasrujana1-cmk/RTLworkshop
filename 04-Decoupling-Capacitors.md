# 4. Decoupling Capacitors

## The problem

When a block switches, it draws a burst of current. The supply wires have resistance and inductance, so the voltage at the block dips. If the dip is bigger than the noise margin, a logic 1 can be read as a 0.

## The solution

Place **decoupling capacitors** (decaps) next to the switching block. A decap holds charge locally and supplies the burst, while the main supply recharges it between switching events.

```text
 Vdd ────┬──────────────┬─────
         │              │
       [ decap ]    [ switching
         │              block ]
 Gnd ────┴──────────────┴─────
```

## Notes

- Decaps are placed near macros and in areas of heavy switching.
- They use area, which is one reason utilization is kept below 100 %.
- They reduce **voltage droop** but do not replace a good power grid (topic 5).
