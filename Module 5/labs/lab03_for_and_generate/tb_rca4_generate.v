`timescale 1ns/1ps
module tb_rca4_generate;
    reg [3:0] a, b; reg cin; wire [3:0] sum; wire cout; integer i, j, k, errors; reg [4:0] e;
    rca4_generate dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    initial begin
        $dumpfile("results/rca4_generate.vcd"); $dumpvars(0, tb_rca4_generate);
        errors = 0;
        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                for (k = 0; k < 2; k = k + 1) begin
                    a = i; b = j; cin = k; #2;
                    e = i + j + k;
                    if ({cout, sum} !== e) errors = errors + 1;
                end
        $display("rca4_generate: 512 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
