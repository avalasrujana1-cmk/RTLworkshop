`timescale 1ns/1ps
module tb_if_complete;
    reg sel, a, b; wire y; integer i, errors;
    if_complete dut (.sel(sel), .a(a), .b(b), .y(y));
    initial begin
        $dumpfile("results/if_complete.vcd"); $dumpvars(0, tb_if_complete);
        errors = 0;
        for (i = 0; i < 8; i = i + 1) begin
            {sel, a, b} = i; #5;
            if (y !== (sel ? a : b)) errors = errors + 1;
        end
        $display("if_complete: 8 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
