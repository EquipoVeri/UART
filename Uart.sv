module Uart(
    input [7:0] DataToTransmit,
	 input SerialDataRx,
    input reset,
    input Transmit,
    input clk,
	 input ClearInterrupt,
	 output RxInterrupt,
	 output clkdivide,
	 output ParityError,
	 output SerialOutputTx,
	 output [7:0] ReceivedData
);

wire[7:0] Q_w;
wire par_w;

assign ParityError = par_w;
assign ReceivedData = Q_w;
	 
uart_rx_completa Receive(
	.clk(clk),
	.reset(~reset),
	.rx(SerialDataRx),
	.q(Q_w),
	.paridad(par_w),
	.clk_dividido_out(clkdivide)
);

uart2 Trans(
	.In(DataToTransmit),
	.clk(clk),
	.rst(~reset),
	.enable(~Transmit),
	.Q(SerialOutputTx)
);

endmodule 