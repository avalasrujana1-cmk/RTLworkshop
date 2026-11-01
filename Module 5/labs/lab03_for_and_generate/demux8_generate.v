// 1:8 demux built with a generate-for loop (hardware replication, not iteration in time).
module demux8_generate (input din, input [2:0] sel, output [7:0] dout);
    genvar g;
    generate
        for (g = 0; g < 8; g = g + 1) begin : lane
            assign dout[g] = (sel == g) ? din : 1'b0;
        end
    endgenerate
endmodule
