// BAD STYLE: the IF has no ELSE, so y must remember its old value when sel = 0.
// Synthesis infers a latch.
module if_latch (input sel, input d, output reg y);
    always @(*) begin
        if (sel)
            y = d;
    end
endmodule
