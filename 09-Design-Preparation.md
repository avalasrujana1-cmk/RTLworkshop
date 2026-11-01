# 9. Design Preparation

Before running a stage, OpenLANE needs to set up the run: merge the technology and cell LEF files, load the configuration, and create the run folder.

## Start the interactive session

```bash
cd <path>/openlane_working_dir/openlane
docker run -it -v $(pwd):/openLANE_flow -v $PWD/pdks:$PWD/pdks \
           -e PDK_ROOT=$PWD/pdks -u $(id -u $USER):$(id -g $USER) \
           efabless/openlane:<version>
./flow.tcl -interactive
```

## Load the package and prepare the design

```tcl
package require openlane <version>
prep -design picorv32a
```

Useful options:

```tcl
prep -design picorv32a -tag run1                 # name the run folder
prep -design picorv32a -tag run1 -overwrite      # reuse the name
```

## What `prep` does

- Creates `designs/picorv32a/runs/<tag>/` with `logs`, `reports`, `results`, `tmp`.
- Merges the technology LEF and the standard-cell LEF into `tmp/merged.lef`, which later stages (and Magic) read.
- Reads the layered configuration and writes the final values to the run's `config.tcl`.

## Changing a variable

```tcl
set ::env(SYNTH_STRATEGY) "AREA 0"
echo $::env(SYNTH_STRATEGY)
```

Changed variables apply to stages you run after the change.

> 📷 *Add a screenshot of your `prep` output and the run folder listing.*
