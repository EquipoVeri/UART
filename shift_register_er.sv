module shift_register_er(
    input clk,
    input reset,
    input enable,
    input d,
    output reg [10:0] q
    );


always @(posedge reset, posedge clk)
	begin
		if (reset)
			q <= 0;
		else
			if (enable)
				q <= {d,q[10:1]};
	end
	

endmodule
