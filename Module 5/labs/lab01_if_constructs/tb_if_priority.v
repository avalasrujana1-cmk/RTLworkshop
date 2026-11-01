`timescale 1ns/1ps
module tb_if_priority;
    reg [2:0] req; wire [1:0] grant; integer i, errors; reg [1:0] e;
    if_priority dut (.req(req), .grant(grant));
    initial begin
        $dumpfile("results/if_priority.vcd"); $dumpvars(0, tb_if_priority);
        errors = 0;
        for (i = 0; i < 8; i = i + 1) begin
            req = i; #5;
            e = req[2] ? 3 : req[1] ? 2 : req[0] ? 1 : 0;
            if (grant !== e) errors = errors + 1;
        end
        $display("if_priority: 8 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
