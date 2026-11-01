`timescale 1ns/1ps
module tb_case_latch;
    reg [1:0] sel; reg a, b; wire y;
    case_latch dut (.sel(sel), .a(a), .b(b), .y(y));
    initial begin
        $dumpfile("results/case_latch.vcd"); $dumpvars(0, tb_case_latch);
        a = 1; b = 1; sel = 0; #10;
        sel = 1; #10;
        sel = 2; #10;  $display("sel=2 y=%b  (unspecified item: output keeps its old value)", y);
        a = 0; b = 0; #10; $display("sel=2 y=%b  (a and b both fell to 0, y still holds)", y);
        sel = 3; #10;  $display("sel=3 y=%b  (still holds)", y);
        sel = 0; #10;  $display("sel=0 y=%b  (mux active again, y follows a)", y);
        $finish;
    end
endmodule
