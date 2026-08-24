 # 🔍 Module-3 Introduction to Combinational And Sequential Optimization
 ## Objectives
 
To understand the concept of logic optimization in digital circuits.
To study combinational and sequential logic optimization techniques.
To perform synthesis using the Yosys synthesis tool.
To map Verilog designs to the SKY130 standard-cell library.
To simulate Verilog designs using Icarus Verilog (Icarus Verilog).
To verify circuit behavior using GTKWave.
To analyze optimized gate-level netlists generated after synthesis.
## Tools And Technologies
HDL: Verilog
Simulator: Icarus Verilog
Waveform Viewer: GTKWave
Synthesis Tool: Yosys
PDK: SKY130
Operating System: Linux(Ubuntu)
# 📚 Table of Contents

1. Introduction to Logic Optimizations
2. Sequential Logic Optimizations
3. AND Gate Optimization (opt_check)
4. OR Gate Optimization (opt_check2)
5. Three-Input AND Gate Optimization (opt_check3)
6. Verilog Code for D Flip-Flop Constant Propagation
7. Simulation Waveform – dff_const1
8. Simulation Waveform – dff_const2
9. D Flip-Flop Netlist Before Optimization
10. Sequential Logic Optimization Result
11. D Flip-Flop Constraint Simulation
12. Synthesized D Flip-Flop Circuit
13. Counter Optimization
14. Counter Optimization Result
15. Optimized Counter Circuit
16. Optimized Counter Netlist
17. Overall Result
18. Conclusion

## 1.Introduction to Logic Optimizations
Logic optimization reduces the hardware area, power consumption, and delay while preserving the original functionality of the design. In this module, combinational and sequential optimization techniques are studied using the SKY130 standard-cell library and Yosys synthesis tool.
<img width="1277" height="595" alt="Screenshot (69)" src="https://github.com/user-attachments/assets/534b0d39-3317-4dba-80d2-2f2a0190e454" />

### Result
The concept of constant propagation was studied to understand how synthesis tools simplify logic by replacing constant inputs.

## 2. 🔄 Sequential Logic Optimizations
Sequential logic optimization improves sequential circuits by optimizing registers and logic without changing circuit behavior. Techniques such as sequential constant propagation, retiming, and state optimization were introduced.
<img width="1096" height="581" alt="Screenshot (70)" src="https://github.com/user-attachments/assets/cb6ca621-a87f-4a50-b89f-942325ff151f" />


### Result
The different sequential optimization techniques were studied to understand how they improve circuit performance and efficiency.

## 3. ⚙️ AND Gate Optimization (opt_check)
```Verilog
module opt_check (
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule
```
### Yosys Commands
```bash
yosys
read_verilog opt_check.v
synth -top opt_check
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="958" height="930" alt="opt check and gate mod3 start 1st" src="https://github.com/user-attachments/assets/fff7b4a0-edc0-4608-a821-edf0b32ebd47" />

### Result
The AND gate was successfully synthesized and mapped to the SKY130 and2 standard cell.
## 4. ⚙️ OR Gate Optimization (opt_check2)
```Verilog 
module opt_check2 (
    input a,
    input b,
    output y
);

assign y = a | b;

endmodule
```
### Yosys Commands
```bash
yosys
read_verilog opt_check2.v
synth -top opt_check2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="958" height="930" alt="norgate mod3 2nd" src="https://github.com/user-attachments/assets/fe49600c-e152-4be2-8f05-9f0a6bdbdcd3" />


### Result
The OR gate was synthesized successfully and mapped to the SKY130 or2 standard cell.

## 5. ⚙️ Three-Input AND Gate Optimization (opt_check3)
```Verilog
module opt_check3 (
    input a,
    input b,
    input c,
    output y
);

assign y = a & b & c;

endmodule
```
### Yosys Commands
```bash
yosys
read_verilog opt_check3.v
synth -top opt_check3
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="958" height="930" alt="3ip and gate 3rd image module3" src="https://github.com/user-attachments/assets/bfac1861-30c3-4f2e-b5b9-0041b9954059" />

### Result
The three-input AND gate was successfully synthesized and mapped to the SKY130 and3 standard cell.

## 6. Verilog Code for D Flip-Flop Constant Propagation
Description
This Verilog code demonstrates sequential constant propagation using two D Flip-Flop designs (dff_const1 and dff_const2). The output is assigned constant values to observe optimization during synthesis.
```verilog
// dff_const1.v
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
    if(reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end
endmodule
```
```verilog
// dff_const2.v
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
    if(reset)
        q <= 1'b1;
    else
        q <= 1'b1;
end
endmodule
```
### Commands
```bash
vim dff_const1.v
vim dff_const2.v
```
Output
<img width="958" height="930" alt="code 4th image" src="https://github.com/user-attachments/assets/f9222591-7c82-484d-a1a6-489039067849" />


## 7. Simulation Waveform – dff_const1
Description
Simulation waveform showing the behavior of dff_const1. The output changes according to the reset signal.
### Code
```verilog
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
    if(reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end
endmodule
```

### Commands
```bash
iverilog -o dff_const1.out dff_const1.v tb_dff_const1.v
gtkwave tb_dff_const1.vcd
```
Output
<img width="958" height="930" alt="wave 5th" src="https://github.com/user-attachments/assets/54c5497a-2444-4b3b-be37-2906dd7e0ea6" />


## 8. Simulation Waveform – dff_const2
Description
Simulation waveform of dff_const2 showing constant output after optimization.
### Code
```verilog
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
    if(reset)
        q <= 1'b1;
    else
        q <= 1'b1;
end
endmodule
```

### Commands
```bash
iverilog -o dff_const2.out dff_const2.v tb_dff_const2_.v
gtkwave tb_dff_const2_.vcd
```
Output
<img width="958" height="930" alt="6th" src="https://github.com/user-attachments/assets/81fa31f8-9500-41a5-b01c-2d2de2b22f1e" />


## 9. D Flip-Flop Netlist Before Optimization
Description
The synthesized netlist before applying sequential optimization.
### Commands
```bash
yosys
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const1.v
synth -top dff_const1
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
Output
<img width="958" height="930" alt="dff const1 7th" src="https://github.com/user-attachments/assets/28083af0-94a2-4c36-85f4-853ff4a617db" />



## 10. Sequential Logic Optimization Result
Description
The optimized circuit after sequential constant propagation. Redundant logic is removed by the synthesis tool.
### Commands
```bash
yosys
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const2.v
synth -top dff_const2
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
Output
<img width="958" height="930" alt="seq optimization 8th" src="https://github.com/user-attachments/assets/ec7fe013-f9d5-4ab3-ac20-436c7639a72a" />



## 11. D Flip-Flop Constraint Simulation
Information
This experiment demonstrates the simulation of a D Flip-Flop with constant propagation. The waveform verifies the behavior of the flip-flop during reset and clock transitions.
### Code
```
module dff_const3(input clk, input reset, output reg q);

always @(posedge clk)
begin
    if(reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end

endmodule
```
### Commands
```bash
iverilog -o dff_const3.out dff_const3.v dff_const3_tb.v

gtkwave dff_const3.vcd
```
Output
<img width="958" height="930" alt="dffconst3 9th" src="https://github.com/user-attachments/assets/564760ac-8465-4be7-8a5c-6b452d4f041b" />


## 12. Synthesized D Flip-Flop Circuit
Information
The D Flip-Flop design is synthesized using Yosys. The generated circuit is mapped to SKY130 standard cells.
### Commands
```bash
yosys

read_verilog dff_const3.v

synth -top dff_const3

show
```
Output
<img width="958" height="930" alt="2ff is there set and reset 10th image" src="https://github.com/user-attachments/assets/fbcd222c-c976-47e5-8ee4-94cc75efc218" />


## 13. Counter Optimization
Information
This experiment demonstrates optimization by removing unused outputs from a counter circuit.
### Code
```
module counter_opt(input clk, input reset, output q);

reg [2:0] count;

assign q = count[0];

always @(posedge clk, posedge reset)
begin
    if(reset)
        count <= 3'b000;
    else
        count <= count + 1;
end

endmodule
```
### Commands
```bash
yosys

read_verilog counter_opt.v

synth -top counter_opt


show
```


## 14. Counter Optimization Result
Information
The synthesized counter retains only the required logic after optimization.
### Commands
```bash
yosys

read_verilog counter_opt.v

synth -top counter_opt

show
```
Output
<img width="958" height="930" alt="unused op optimization 11 image" src="https://github.com/user-attachments/assets/53b8fc3f-3a6a-4937-a479-a029e2507987" />



## 15. Optimized Counter Circuit
Information
The optimized gate-level implementation contains only the necessary flip-flops and logic.
### Commands
```bash
write_verilog -noattr counter_opt_net.v

gvim counter_opt_net.v
```
Output
<img width="958" height="930" alt="counter dff 3bit but 1flop there 12th image" src="https://github.com/user-attachments/assets/6d05c5ac-b53f-4dd9-87b2-4980300107a1" />



## 16. Optimized Counter Netlist
Information
The generated netlist shows the optimized hardware after synthesis.
### Commands
```bash
write_verilog -noattr counter_opt_net.v

gvim counter_opt_net.v
```

Output
<img width="958" height="930" alt="opt2 counter 13thimage" src="https://github.com/user-attachments/assets/bfc5cf2c-211c-41fe-b7f9-374725b41489" />


#🎯 Overall Result

The logic optimization experiments were successfully implemented using Verilog HDL, Yosys, Icarus Verilog, GTKWave, and the SKY130 Standard Cell Library. Both combinational and sequential optimization techniques were verified through simulation and synthesis. The optimized circuits reduced hardware complexity while maintaining the original functionality.

# 📝 Conclusion

This module provided practical knowledge of logic optimization, RTL simulation, technology mapping, and gate-level synthesis. Different optimization techniques such as constant propagation, logic simplification, and counter optimization were successfully demonstrated. The synthesized netlists confirmed that redundant hardware was removed without affecting circuit behavior, achieving efficient digital circuit implementation.

## 👤 Author

**Avala srujana**  
B.Tech – Electronics & Communication Engineering  
Anurag University  
[RTL Workshop Repository](https://github.com/madapaamrutha-svg/RTL_Workshop)
