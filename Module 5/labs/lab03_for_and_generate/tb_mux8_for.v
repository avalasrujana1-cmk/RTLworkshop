`timescale 1ns/1ps
module tb_mux8_for;
    reg [7:0] d; reg [2:0] sel; wire y; integer i, j, errors;
    mux8_for dut (.d(d), .sel(sel), .y(y));
    initial begin
        $dumpfile("results/mux8_for.vcd"); $dumpvars(0, tb_mux8_for);
        errors = 0;
        for (i = 0; i < 8; i = i + 1)
            for (j = 0; j < 256; j = j + 1) begin
                sel = i; d = j; #2;
                if (y !== d[sel]) errors = errors + 1;
            end
        $display("mux8_for: 2048 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
