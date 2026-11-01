# 7. Running the Floorplan

```tcl
prep -design picorv32a
run_floorplan
```

## Variables you will likely look at

| Variable | Meaning |
|---|---|
| `FP_CORE_UTIL` | Target core utilization (%) |
| `FP_ASPECT_RATIO` | Core height / width |
| `FP_CORE_MARGIN` / margins | Distance between die edge and core |
| `FP_IO_MODE` | Pin placement mode |
| `FP_IO_HMETAL`, `FP_IO_VMETAL` | Metal layers used for horizontal/vertical pins |

Print the active values:

```tcl
echo $::env(FP_CORE_UTIL)
```

Change one and re-run floorplan:

```tcl
set ::env(FP_IO_MODE) 2
run_floorplan
```

## Output

The floorplan is written as a DEF file:

```text
designs/picorv32a/runs/<tag>/results/floorplan/picorv32a.floorplan.def
```

## Reading the die size from the DEF

```text
UNITS DISTANCE MICRONS 1000 ;
DIEAREA ( 0 0 ) ( X Y ) ;
```

DEF coordinates are in database units. With `1000` units per micron:

```text
die width  (µm) = X / 1000
die height (µm) = Y / 1000
die area   (µm²) = width × height
```

> 📷 *Add a screenshot of `run_floorplan` finishing and of the `DIEAREA` line from your DEF.*

| Your result | Value |
|---|---|
| `FP_CORE_UTIL` used | |
| `DIEAREA` | |
| Die area (µm²) | |
