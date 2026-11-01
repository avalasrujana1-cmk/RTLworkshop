// GOOD STYLE: every branch assigns y, so the logic is a 2:1 mux (no memory).
module if_complete (input sel, input a, input b, output reg y);
    always @(*) begin
        if (sel) y = a;
        else     y = b;
    end
endmodule
