`timescale 1ns/1ps
module tb_demux8_generate;
    reg din; reg [2:0] sel; wire [7:0] dout; integer i, errors; reg [7:0] e;
    demux8_generate dut (.din(din), .sel(sel), .dout(dout));
    initial begin
        $dumpfile("results/demux8_generate.vcd"); $dumpvars(0, tb_demux8_generate);
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            {din, sel} = i[3:0]; #2;
            e = din ? (8'b1 << sel) : 8'b0;
            if (dout !== e) errors = errors + 1;
        end
        $display("demux8_generate: 16 vectors, errors = %0d -> %s", errors, errors ? "FAIL" : "PASS");
        $finish;
    end
endmodule
