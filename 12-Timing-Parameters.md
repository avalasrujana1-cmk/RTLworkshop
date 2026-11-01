# 12. Timing Parameters

All delay numbers rely on agreed measurement points on the waveform.

## Thresholds

| Name | Typical value | Used for |
|---|---|---|
| Low slew threshold | 20 % of Vdd | Start of a transition |
| High slew threshold | 80 % of Vdd | End of a transition |
| Input delay threshold | 50 % of Vdd | Reference point on the input |
| Output delay threshold | 50 % of Vdd | Reference point on the output |

(Each library defines its own values; they are listed in the liberty file header, for example `slew_lower_threshold_pct_rise`.)

## Definitions

```text
Propagation delay = t(output crosses 50 %) − t(input crosses 50 %)
Transition (slew) = t(80 %) − t(20 %)  on the same signal
```

Rise and fall versions are measured separately.

## Rules of thumb

- A **large load** or a **slow input slew** gives a bigger delay.
- A **negative delay** can appear if the input slew is very slow and thresholds are poorly chosen: the output reaches its threshold before the input does. This means the thresholds or the measurement setup need to be checked.
- Clock-tree cells should have small, similar rise and fall times so the clock stays symmetric.

## Link to the flow

Static timing analysis (OpenSTA) reads these tables, adds wire parasitics, and calculates slack for every path.
