module uart_rx_completa
(
    input clk,
    input reset,
    input rx,
    output [7:0] q,
    output paridad
    );


wire [10:0] q_w;
wire enablemax_w;
wire enable_reg_w;
wire enablehalf_w;
wire flag_w;

assign paridad = q_w[9];
assign q = q_w[8:1];

shift_register_er u1
(
	.clk(clk),
	.reset(reset),
	.enable(flag_w),
	.d(rx),
	.q(q_w)
);
	 
uart_rx u2 
(
	.rx(rx),
	.clk(clk),
	.reset(reset),
	.enable_flag(flag_w),
	.enable_max(enablemax_w),
	.enable_half(enablehalf_w)
);	 

CounterWithFunction_RX counter_rx
(
	.clk(clk),
	.reset(reset),
	.enable_max(enablemax_w),
	.enable_half(enablehalf_w),
	.flag(flag_w) 
);
	 
	 
endmodule
