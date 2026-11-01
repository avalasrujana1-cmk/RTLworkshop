# Practical: Synthesizing picorv32a

## Goal

Prepare `picorv32a` in OpenLANE, run synthesis, and record the main statistics.

## Steps

1. Start the OpenLANE container and `./flow.tcl -interactive` (see topic 9).
2. Load the package and prepare the design:
   ```tcl
   package require openlane <version>
   prep -design picorv32a
   ```
3. Run synthesis:
   ```tcl
   run_synthesis
   ```
4. Open the run folder and inspect:
   ```bash
   ls designs/picorv32a/runs/<tag>/results/synthesis
   less designs/picorv32a/runs/<tag>/reports/synthesis/*stat.rpt
   ```
5. Calculate the flop ratio and copy your numbers into the table in topic 11.

## Screenshots to add

- 📷 `prep -design picorv32a` output
- 📷 `run_synthesis` finishing without errors
- 📷 Synthesis statistics report
- 📷 Contents of `results/synthesis`

## Questions to answer in your notes

- Which cell type is used most often in the netlist?
- What is the flop ratio, and what does it say about the design?
- What happens to cell count and area when you switch `SYNTH_STRATEGY` between area- and delay-oriented values?
