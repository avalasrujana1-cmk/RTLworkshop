// IF / ELSE IF chain: the first true condition wins (priority logic), final ELSE keeps it complete.
module if_priority (input [2:0] req, output reg [1:0] grant);
    always @(*) begin
        if      (req[2]) grant = 2'd3;
        else if (req[1]) grant = 2'd2;
        else if (req[0]) grant = 2'd1;
        else             grant = 2'd0;
    end
endmodule
