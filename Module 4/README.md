# 🚀 Module 4 – Blocking vs Non-Blocking Assignments and Synthesis-Simulation Mismatch

## 📖 Introduction

Blocking (`=`) and non-blocking (`<=`) assignments are fundamental concepts in Verilog HDL that determine how statements execute within procedural blocks. Proper use of these assignment operators is essential for designing reliable and synthesizable digital circuits. This module demonstrates the implementation of multiplexers, the behavior of blocking assignments, and common synthesis-simulation mismatch scenarios. The designs are simulated using Icarus Verilog, analyzed using GTKWave, synthesized using Yosys, and mapped to the SKY130 standard-cell library.

---

# 🎯 Objectives

- To understand the difference between blocking (`=`) and non-blocking (`<=`) assignments in Verilog HDL.
- To study the causes of synthesis-simulation mismatch.
- To design and simulate multiplexer circuits using Verilog.
- To analyze the behavior of blocking assignments through RTL simulation.
- To verify circuit functionality using Icarus Verilog and GTKWave.
- To synthesize RTL designs using the Yosys synthesis tool.
- To map synthesized circuits to the SKY130 standard-cell library.
- To compare RTL simulation results with synthesized hardware.

---

# 🛠️ Tools and Technologies Used

| Tool / Technology | Purpose |
|-------------------|---------|
| Verilog HDL | RTL Design |
| Icarus Verilog | Verilog Compiler and Simulator |
| GTKWave | Waveform Viewer |
| Yosys | RTL Synthesis Tool |
| SKY130 Standard Cell Library | Technology Mapping |
| Linux Terminal | Command Execution |
| gVim | Viewing and Editing Verilog Files |

---

# 📚 Table of Contents


1. RTL Simulation of a 2×1 Multiplexer
2. Technology Mapping of the Multiplexer
3. Functional Verification Using Simulation Waveform
4. Analysis of an Incorrect Multiplexer Design
5. Verification of Bad Multiplexer Behavior
6. Simulation of Blocking Assignment Behavior
7. Synthesis of Blocking Assignment Circuit
8. Blocking Assignment Using Past Value
9. Overall Result
10. Conclusion

---

# 1️⃣ RTL Simulation of a 2×1 Multiplexer

## 📖 Overview

A 2×1 multiplexer was implemented using the Verilog ternary operator to understand combinational logic design. The RTL design was simulated using Icarus Verilog, and the output waveform was verified using GTKWave. The experiment demonstrates how the output changes based on the select signal and validates the functional correctness of the multiplexer before synthesis.



### ⚙️ Simulation Commands
```bash
iverilog -o mux ternary_operator_mux.v tb_ternary_operator_mux.v

gtkwave ternary_operator_mux.vcd
```


### 📷 Output Waveform
<img width="958" height="930" alt="2x1 mux 1st image" src="https://github.com/user-attachments/assets/a4ddaf60-f4fc-4c1f-b23d-b1f25bbe9fba" />




### ✅ Observation

The RTL simulation confirmed the correct functionality of the 2×1 multiplexer.

---

# 2️⃣ Technology Mapping of the Multiplexer

## 📖  Overview

The multiplexer design was synthesized using Yosys and mapped to the SKY130 standard-cell library. During synthesis, the RTL description was optimized and converted into a technology-specific multiplexer cell, reducing hardware complexity while preserving functionality.

### ⚙️ Synthesis Commands
```bash
yosys

read_verilog mux_generate.v

synth -top mux_generate

abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

show
```


### 📷 Synthesized Circuit
<img width="958" height="930" alt="mux diag image2" src="https://github.com/user-attachments/assets/ab5e482f-c11c-4cc5-9bf7-3a2e49f7025e" />




### ✅ Observation

The multiplexer was successfully mapped to the SKY130 standard-cell library.

---

# 3️⃣ Functional Verification Using Simulation Waveform

## 📖  Overview

The simulation waveform verifies that the multiplexer output correctly follows the selected input. Different input combinations were applied to validate the functionality of the design under various conditions before synthesis.

### ⚙️ Simulation Commands
```bash
iverilog -o mux mux_generate.v tb_mux_generate.v

gtkwave mux_generate.vcd
```


### 📷 Output Waveform
<img width="958" height="930" alt="wave ternary mux 3rd" src="https://github.com/user-attachments/assets/b3df3f5c-d5f3-4b77-94a4-4a4f93c43933" />




### ✅ Observation

The waveform confirmed correct multiplexer operation for all input combinations.

---

# 4️⃣ Analysis of an Incorrect Multiplexer Design

## 📖  Overview

This experiment demonstrates an improperly coded multiplexer that leads to synthesis-simulation mismatch. Incomplete assignments inside the always block may infer latches during synthesis, resulting in hardware behavior different from RTL simulation.



### ⚙️ Simulation Commands
```bash
iverilog -o bad_mux bad_mux.v tb_bad_mux.v

gtkwave bad_mux.vcd
```


### 📷 Output
<img width="958" height="930" alt="bad mux 4th image" src="https://github.com/user-attachments/assets/8bbf014c-9a57-41c5-90ba-aebf14aadb27" />




### ✅ Observation

The incorrect coding style produced unexpected output behavior during simulation.

---

# 5️⃣ Verification of Bad Multiplexer Behavior

## 📖 Overview

The waveform illustrates the behavior of the incorrectly implemented multiplexer. Missing assignments cause previous output values to be retained, resulting in latch inference and mismatch between simulation and synthesized hardware.

### ⚙️ Simulation Commands
```bash
iverilog -o bad_mux bad_mux.v tb_bad_mux.v

gtkwave bad_mux.vcd
```


### 📷 Output Waveform
<img width="958" height="930" alt="bad mux 5th" src="https://github.com/user-attachments/assets/858948b8-86c5-4915-b4de-6b1564d53740" />



### ✅ Observation

The waveform demonstrated synthesis-simulation mismatch caused by improper RTL coding.

---

# 6️⃣ Simulation of Blocking Assignment Behavior

## 📖  Overview

Blocking assignments execute statements sequentially within an always block. This experiment illustrates their behavior during simulation and explains why they are mainly recommended for combinational logic. Incorrect usage in sequential circuits may produce unexpected results.



### ⚙️ Simulation Commands
```bash
iverilog -o blocking blocking_caveat.v tb_blocking_caveat.v

gtkwave blocking_caveat.vcd
```

### 📷 Output Waveform
<img width="958" height="930" alt="blockin caveat 6th" src="https://github.com/user-attachments/assets/ebc6762c-0679-49f4-9346-b01a3aa67573" />




### ✅ Observation

The simulation demonstrated the sequential execution behavior of blocking assignments.

---

# 7️⃣ Synthesis of Blocking Assignment Circuit

## 📖Overview

The blocking assignment circuit was synthesized using Yosys to compare RTL simulation with the generated hardware. The synthesized circuit illustrates how the Verilog description is interpreted and mapped to the SKY130 standard-cell library.

### ⚙️ Synthesis Commands
```bash
yosys

read_verilog blocking_caveat.v

synth -top blocking_caveat

abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

show
```


### 📷 Technology-Mapped Circuit
<img width="958" height="930" alt="blocking cavaet 7th" src="https://github.com/user-attachments/assets/ba29e4c8-a690-4fc4-b0d9-2dd8e1efc9a8" />



### ✅ Observation

The synthesized hardware accurately represented the intended circuit implementation.

---
## 8️⃣ Blocking Assignment Using Past Value

This experiment demonstrates how blocking assignments (=) use the updated value immediately within the same procedural block. The simulation illustrates how the output depends on the sequence of statements and the previously assigned values. This helps in understanding the behavior of blocking assignments and why they can sometimes lead to unexpected results if used in sequential logic. Therefore, blocking assignments are generally recommended for combinational logic, while non-blocking assignments (<=) are preferred for sequential circuits.

### ⚙️ Commands
```bash
iverilog -o blocking_past blocking_caveat.v tb_blocking_caveat.v

gtkwave blocking_caveat.vcd
```
🖼️ Output
<img width="958" height="930" alt="blocking caveat looks past value 8th" src="https://github.com/user-attachments/assets/a44b2749-ce64-4ec0-b89d-d9136ed310e7" />

✅ Result
The waveform shows that blocking assignments execute sequentially and immediately update variable values within the same procedural block. This demonstrates how statement ordering influences simulation behavior and highlights the importance of using blocking assignments appropriately.

# 🎯 Overall Result

The experiments successfully demonstrated the implementation of multiplexers, blocking assignments, and synthesis-simulation mismatch scenarios. RTL simulation, waveform analysis, and hardware synthesis verified the importance of writing synthesizable Verilog code. The generated circuits were successfully mapped to the SKY130 standard-cell library.

---

# 📌 Conclusion

This module provided a comprehensive understanding of blocking and non-blocking assignments, multiplexer implementation, and synthesis-simulation mismatch. Through simulation, synthesis, and technology mapping, the experiments emphasized the importance of proper RTL coding practices for generating reliable and optimized digital hardware. The complete RTL-to-GDS front-end flow using Icarus Verilog, GTKWave, Yosys, and SKY130 was successfully demonstrated.

## 👤 Author

**Avala Srujana**  
B.Tech – Electronics & Communication Engineering  
Anurag University  
[RTL Workshop Repository](https://github.com/madapaamrutha-svg/RTL_Workshop)
