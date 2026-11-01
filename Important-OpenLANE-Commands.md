# Important OpenLANE Commands

| Command | Purpose |
|---|---|
| `./flow.tcl -interactive` | Open the interactive shell |
| `package require openlane <version>` | Load the OpenLANE Tcl package |
| `prep -design <name>` | Prepare a design and create a run |
| `prep -design <name> -tag <t> -overwrite` | Name the run and replace an existing one |
| `run_synthesis` | Synthesis |
| `run_floorplan` | Floorplan (Module 7) |
| `run_placement` | Placement (Module 7) |
| `run_cts` | Clock tree synthesis |
| `gen_pdn` | Generate the power distribution network |
| `run_routing` | Routing |
| `run_magic` | Generate GDS |
| `run_magic_spice_export` | Extract SPICE for LVS |
| `run_magic_drc` | DRC check |
| `run_lvs` | LVS check |
| `set ::env(VAR) value` | Change a configuration variable |
| `echo $::env(VAR)` | Print a variable |
