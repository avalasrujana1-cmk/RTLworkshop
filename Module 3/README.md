# 🔧 Gate-Level Cleanup: Combinational & Sequential Optimization in Yosys

### Week 3 Lab Journal

Once RTL has been mapped to a gate-level netlist, the job isn't finished — a synthesis tool still has to comb through that netlist and squeeze out anything wasteful. This journal walks through how **Yosys** performs that cleanup pass, targeting the **SKY130** open-source PDK for every example below.

<p>
  <img src="https://img.shields.io/badge/Tool-Icarus%20Verilog-blue?style=flat-square" alt="Icarus Verilog">
  <img src="https://img.shields.io/badge/Tool-GTKWave-orange?style=flat-square" alt="GTKWave">
  <img src="https://img.shields.io/badge/Tool-Yosys-2ea44f?style=flat-square" alt="Yosys">
  <img src="https://img.shields.io/badge/PDK-SKY130-red?style=flat-square" alt="SKY130">
  <img src="https://img.shields.io/badge/Language-Verilog-9cf?style=flat-square" alt="Verilog">
</p>

**Jump to:** [Background](#-background) · [Exercises](#-exercises) · [Summary Table](#-summary-table) · [What I Learned](#-what-i-learned) · [Author](#-author)

---

## 📚 Background

<details>
<summary><b>Why "synthesis" doesn't stop at mapping</b></summary>
<br>

Turning RTL into gates is a mechanical first pass. The more interesting work happens afterward, when the tool looks at that raw netlist and asks: *does every piece of this actually need to exist?* Anything answering "no" gets trimmed, merged, or rewritten — with one hard rule: the circuit's observable behavior can never change.

</details>

<details>
<summary><b>Phase 1 — Combinational cleanup</b></summary>
<br>

Combinational logic gives the optimizer the most room to move, since there's no state to worry about — only a truth table to preserve. Yosys is free to rewrite the underlying Boolean expression in any equivalent form, which means redundant terms, unreachable branches, and clumsy gate choices all get swept away.

**Payoff:** fewer gates, tighter expressions, less area, shorter critical path, lower power draw.

</details>

<img src="images/combinational_opt_example.png" alt="Combinational optimization example" width="700">

<details>
<summary><b>Phase 2 — Sequential cleanup</b></summary>
<br>

Flip-flops raise the stakes: their state-transition behavior has to match the original description exactly, cycle for cycle. Even so, Yosys can still prune flip-flops that don't influence any output, push known constants through register chains, and clear out logic nothing can ever reach.

**Common moves:** drop dead flip-flops · forward-propagate constants · strip unreachable paths · tighten register placement.

**Reference design — `dff_const1.v`**

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

Even though `q` legitimately flips between two states depending on `reset`, the netlist Yosys produces is already leaner than a literal, gate-per-line translation of this RTL.

</details>

<details>
<summary><b>Constant folding</b></summary>
<br>

When a signal's value can be determined ahead of time, there's no point building hardware to compute it at runtime. Yosys folds the constant into every place that signal fans out to, then removes whatever logic is left with nothing meaningful to do.

**Why it matters:** less routing, smaller cell count, more timing slack, lower power.

</details>

<img src="images/constant_folding.png" alt="Constant folding before and after" width="700">

<details>
<summary><b>Trimming dead outputs</b></summary>
<br>

A wire or register that never reaches a real primary output is dead weight. Yosys removes it entirely rather than paying for hardware nobody reads. Exercise 7 (the counter) demonstrates this in a very concrete way.

</details>

<details>
<summary><b>FSM state reduction</b></summary>
<br>

State machines frequently contain states that behave identically to one another, or that can never actually be reached. Yosys merges the duplicates and discards the unreachable ones, which shrinks both the state register and the next-state logic.

**Techniques:** equivalent-state merging · minimal state encoding · simplified transition logic.

</details>

<details>
<summary><b>Fan-out cloning</b></summary>
<br>

This one runs in the opposite direction: instead of removing hardware, cloning **duplicates** a gate that's driving too many downstream loads. Spreading the fan-out across copies shortens the delay on whichever path was bottlenecked.

</details>

<details>
<summary><b>Retiming registers</b></summary>
<br>

<img src="images/retiming_diagram.png" alt="Retiming diagram" width="700">

Retiming slides flip-flops across neighboring combinational logic without touching what the circuit computes overall. The point is to even out delay between pipeline stages so the design can be clocked faster. Unlike the other techniques here, retiming only ever repositions **registers** — it doesn't touch combinational structure directly.

</details>

<details>
<summary><b>Cheat sheet: Yosys optimization passes</b></summary>
<br>

| Pass | What it does |
|---|---|
| Constant folding | Replaces known-constant signals with literals |
| Dead-logic elimination | Removes logic with no path to any output |
| Boolean minimization | Simplifies logic expressions |
| Unused-wire pruning | Drops signals nothing references |
| Unused-cell pruning | Drops cells nothing references |
| Expression collapsing | Merges equivalent sub-expressions |
| Resource sharing | Reuses hardware across similar operations |

</details>

---

## 🧪 Exercises

<details open>
<summary><b>Ex. 1 · Two-input AND → <code>and2</code></b> <sub>(opt_check)</sub></summary>
<br>

```verilog
module opt_check (input a, input b, output y);
assign y = a & b;
endmodule
```

```bash
yosys
read_verilog opt_check.v
synth -top opt_check
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img src="images/opt_check.png" alt="opt_check schematic - single and2 cell" width="700">

> **Outcome:** collapses to a single SKY130 `and2` standard cell.

</details>

<details>
<summary><b>Ex. 2 · Two-input OR → <code>or2</code></b> <sub>(opt_check2)</sub></summary>
<br>

```verilog
module opt_check2 (input a, input b, output y);
assign y = a | b;
endmodule
```

```bash
yosys
read_verilog opt_check2.v
synth -top opt_check2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

> **Outcome:** collapses to a single SKY130 `or2` standard cell.

</details>

<details>
<summary><b>Ex. 3 · Three-input AND → <code>and3</code></b> <sub>(opt_check3)</sub></summary>
<br>

```verilog
module opt_check3 (input a, input b, input c, output y);
assign y = a & b & c;
endmodule
```

```bash
yosys
read_verilog opt_check3.v
synth -top opt_check3
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

> **Outcome:** a single SKY130 `and3` cell — Yosys doesn't chain two `and2`s together here.

</details>

<details>
<summary><b>Ex. 4 · Async reset that still matters</b> <sub>(dff_const1)</sub></summary>
<br>

`dff_const1` and `dff_const2` (Exercises 4–5) both drive `q` toward a fixed-looking value, but they differ in *how much* that value truly depends on `reset` — and that difference changes what Yosys is allowed to optimize away.

```bash
vim dff_const1.v
```

```bash
iverilog -o dff_const1.out dff_const1.v tb_dff_const1.v
gtkwave tb_dff_const1.vcd
```

```bash
yosys
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const1.v
synth -top dff_const1
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

</details>

<details>
<summary><b>Ex. 5 · Output is constant regardless of reset</b> <sub>(dff_const2)</sub></summary>
<br>

`dff_const2` pushes the idea further — `q` resolves to `1'b1` on *both* branches of the conditional, meaning `reset` has zero actual influence on the output.

```bash
iverilog -o dff_const2.out dff_const2.v tb_dff_const2_.v
gtkwave tb_dff_const2_.vcd
```

```bash
yosys
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const2.v
synth -top dff_const2
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img src="images/dff_const2.png" alt="dff_const2 schematic" width="700">

> **Outcome:** since the output doesn't depend on reset, Yosys strips the reset logic that Exercise 4 still required. The resulting schematic is visibly smaller.

</details>

<details>
<summary><b>Ex. 6 · Synchronous-reset flip-flop</b> <sub>(dff_const3)</sub></summary>
<br>

```verilog
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

Notice `reset` appears only *inside* the always block's body, not in the sensitivity list — a synchronous reset, unlike the asynchronous resets in Exercises 4–5.

```bash
iverilog -o dff_const3.out dff_const3.v dff_const3_tb.v
gtkwave dff_const3.vcd
```

```bash
yosys
read_verilog dff_const3.v
synth -top dff_const3
show
```

<img src="images/dff_const3.png" alt="dff_const3 synthesized netlist" width="700">

</details>

<details>
<summary><b>Ex. 7 · 3-bit counter, only 1 bit wired out</b> <sub>(counter_opt)</sub></summary>
<br>

Only the least-significant bit of a 3-bit counter ever reaches an output — a clean test case for dead-output elimination.

```verilog
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

```bash
yosys
read_verilog counter_opt.v
synth -top counter_opt
show
```

<img src="images/counter_opt_schematic.png" alt="counter_opt schematic" width="700">

`count[1]` and `count[2]` never drive anything observable, so Yosys never bothers instantiating flip-flops for them:

```bash
write_verilog -noattr counter_opt_net.v
gvim counter_opt_net.v
```

<img src="images/counter_opt_netlist.png" alt="counter_opt netlist listing" width="700">

<img src="images/counter_opt_cellcount.png" alt="counter_opt final gate/cell count" width="700">

> **Outcome:** the RTL declares 3 bits of state, but only **1** flip-flop actually gets built.

</details>

---

## 📋 Summary Table

| # | Exercise | Concept tested | Result |
|:-:|---|---|---|
| 1 | opt_check | 2-input AND | Maps to `and2` |
| 2 | opt_check2 | 2-input OR | Maps to `or2` |
| 3 | opt_check3 | 3-input AND | Single `and3`, no chaining |
| 4 | dff_const1 | Constant folding | Output depends on reset → reset logic kept |
| 5 | dff_const2 | Constant folding | Output independent of reset → reset logic dropped |
| 6 | dff_const3 | Sync vs. async reset | Reset lives only inside the clocked block |
| 7 | counter_opt | Dead-output pruning | 3 bits declared → only 1 flip-flop synthesized |

---

## 💡 What I Learned

- Combinational and sequential optimization operate under different constraints — sequential logic has to preserve exact register behavior, combinational logic just has to preserve the truth table.
- The `dff_const1` vs. `dff_const2` pair made constant folding concrete: one keeps its reset path, the other doesn't need it at all.
- Dead logic and unreferenced outputs are pruned automatically — `counter_opt` is a clean example, going from 3 declared bits down to 1 real flip-flop.
- Synchronous reset (`dff_const3`) synthesizes differently from asynchronous reset (`dff_const1`/`dff_const2`), even though the RTL looks superficially similar.
- Basic gate-level constructs (AND, OR, 3-input AND) mapped directly onto their SKY130 standard-cell counterparts.
- FSM state reduction, fan-out cloning, and retiming are important concepts covered here even without a hands-on exercise for each.
- Every result above came from actually running the synthesis flow and inspecting the netlist/schematic/waveform output — not assumed from the RTL alone.

> The bigger picture: Yosys isn't a one-for-one RTL-to-gates translator. It actively folds constants, deletes dead logic, and removes unnecessary registers — all while provably preserving the circuit's original behavior. That balancing act between **area, timing, and power** is what synthesis optimization is actually for.

---

## 👤 Author

**Avala Srujana**
BTECH-ECE
