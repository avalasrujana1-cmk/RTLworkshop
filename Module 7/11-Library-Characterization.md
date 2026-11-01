# 11. Library Characterization

The liberty file tells the tools how fast a cell is and how much power it uses. Those numbers come from **characterization**: simulating each cell at transistor level under many conditions.

## Workflow

1. **Cell design:** transistor-level netlist of the cell (for example an inverter) with its layout.
2. **Extraction:** produce a SPICE netlist with parasitics from the layout.
3. **Set up the simulation:**
   - Transistor model files from the PDK
   - Supply voltage and temperature (corner)
   - Input stimulus (a pulse with known rise/fall times)
   - Output load capacitance
4. **Simulate** (for example with ngspice) and record the output waveform.
5. **Measure** delay and transition time at defined thresholds (topic 12).
6. **Repeat** for many input slews and output loads, and store the results as tables in the liberty file.

## Output

A table, per timing arc:

```text
                    output load →
 input slew   C1      C2      C3  ...
     ↓
   S1       d11     d12     d13
   S2       d21     d22     d23
```

The timing tools interpolate in these tables, so each cell can be used with any load and slew.
