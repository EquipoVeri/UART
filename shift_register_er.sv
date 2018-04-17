module shift_register_er
#(
	parameter WORD_LENGTH = 11
)
(
    input clk,
    input reset,
    input enable,
    input d,
    output [WORD_LENGTH-1:0] q
);


always_ff @(posedge reset, posedge clk)
	begin
		if (reset)
			q <= 0;
		else
			if (enable)
				q <= {d,q[WORD_LENGTH-1:1]};
	end
	

endmodule
