// BAD STYLE: case is incomplete (sel = 2'b10 and 2'b11 unspecified) and has no default -> latch on y.
module case_latch (input [1:0] sel, input a, input b, output reg y);
    always @(*) begin
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
        endcase
    end
endmodule
