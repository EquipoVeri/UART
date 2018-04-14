	module uart_rx_completa(
    input clk,
    input reset,
    input rx,
    output [7:0] q,
    output paridad, clk_dividido_out
    );


wire clk_dividido_w, enable_w;
wire [10:0]q_w;

assign paridad = q_w[1];
assign clk_dividido_out= clk_dividido_w;
assign q = q_w[9:2];

shift_register_er u1 (.clk(clk_dividido_w),.reset(reset),.enable(enable_w),.d(rx),.q(q_w));
	 
uart_rx   			u2 ( .rx(rx),.clk_2br(clk_dividido_w),.reset(reset),.enable(enable_w) );	 


frecuency_divider u3 ( .clk(clk),.reset(reset),.clk_dividido(clk_dividido_w));
	 
	 
	 
	 
	 
endmodule
