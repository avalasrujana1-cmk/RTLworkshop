// 8:1 mux written with a FOR loop inside an always block.
module mux8_for (input [7:0] d, input [2:0] sel, output reg y);
    integer k;
    always @(*) begin
        y = 1'b0;
        for (k = 0; k < 8; k = k + 1)
            if (sel == k)
                y = d[k];
    end
endmodule
