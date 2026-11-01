`timescale 1ns/1ps
module tb_case_full;
    reg [1:0] sel; reg [3:0] d; wire y; integer i, j, errors;
    case_full dut (.sel(sel), .d(d), .y(y));
    initial begin
        $dumpfile("results/case_full.vcd"); $dumpvars(0, tb_case_full);
        errors = 0;
        for (i = 0; i < 4; i = i + 1)
            for (j = 0; j < 16; j = j + 1) begin
                sel = i; d = j; #5;
                if (y !== d[sel]) errors = errors + 1;
            end
        $display("case_full: 64 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
