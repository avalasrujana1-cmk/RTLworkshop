// 4-bit ripple-carry adder: full adders replicated with generate-for, carry chained through c[].
module rca4_fa (input a, input b, input cin, output s, output cout);
    assign s    = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module rca4_generate (input [3:0] a, input [3:0] b, input cin, output [3:0] sum, output cout);
    wire [4:0] c;
    assign c[0] = cin;
    genvar g;
    generate
        for (g = 0; g < 4; g = g + 1) begin : stage
            rca4_fa fa (.a(a[g]), .b(b[g]), .cin(c[g]), .s(sum[g]), .cout(c[g+1]));
        end
    endgenerate
    assign cout = c[4];
endmodule
