// Wildcard items with casez: items are checked top-down, so the FIRST matching item wins
// (a priority structure). Compare with a parallel case in the lab notes.
module case_overlap (input [1:0] sel, output reg [1:0] y);
    always @(*) begin
        casez (sel)
            2'b00:   y = 2'd0;
            2'b01:   y = 2'd1;
            2'b1?:   y = 2'd2;   // matches 10 and 11
            default: y = 2'd3;
        endcase
    end
endmodule
