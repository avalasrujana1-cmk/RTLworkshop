`timescale 1ns/1ps
module tb_case_overlap;
    reg [1:0] sel; wire [1:0] y; integer i, errors; reg [1:0] e;
    case_overlap dut (.sel(sel), .y(y));
    initial begin
        $dumpfile("results/case_overlap.vcd"); $dumpvars(0, tb_case_overlap);
        errors = 0;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i; #5;
            e = (i == 0) ? 0 : (i == 1) ? 1 : 2;
            if (y !== e) errors = errors + 1;
        end
        $display("case_overlap: 4 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
