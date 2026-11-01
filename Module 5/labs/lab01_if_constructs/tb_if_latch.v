`timescale 1ns/1ps
module tb_if_latch;
    reg sel, d; wire y;
    if_latch dut (.sel(sel), .d(d), .y(y));
    initial begin
        $dumpfile("results/if_latch.vcd"); $dumpvars(0, tb_if_latch);
        sel = 0; d = 0; #10;
        sel = 1; d = 1; #10;      // transparent: y follows d
        d = 0;          #10;
        d = 1;          #10;
        sel = 0;        #10;      // latch closes, y holds 1
        d = 0;          #10;      // d changes, y must NOT change
        d = 1; #5; d = 0; #5;
        $display("if_latch: after sel=0, y=%b (held value from the last transparent phase)", y);
        $finish;
    end
endmodule
