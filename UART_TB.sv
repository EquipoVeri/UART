timeunit 10ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module UART_TB;

bit clk = 0;
bit reset;
logic [7:0] DataToTransmit;
bit SerialDataRx;
bit Transmit;
bit ClearInterrupt;
bit RxInterrupt;
bit clkdivide;
bit ParityError;
bit SerialOutputTx;
logic [7:0] ReceivedData;

Uart
DUV
(	
	 .DataToTransmit(DataToTransmit),
	 .SerialDataRx(SerialDataRx),
    .reset(reset),
    .Transmit(Transmit),
    .clk(clk),
	 .ClearInterrupt(ClearInterrupt),
	 .RxInterrupt(RxInterrupt),
	 .clkdivide(clkdivide),
	 .ParityError(ParityError),
	 .SerialOutputTx(SerialOutputTx),
	 .ReceivedData(ReceivedData)
);


/*********************************************************/
initial // Clock generator
  begin
    forever #1 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 1;
	#0 Transmit = 0;
	#0 SerialDataRx = 1;

end

/*********************************************************/

initial begin 
	#5 reset = 0;
	//#5 SerialDataRx = 0; //start
	#0 SerialDataRx = 0;
	#5208 SerialDataRx = 0;
	#5208 SerialDataRx = 1;
	#5208 SerialDataRx = 1;
	#5208 SerialDataRx = 1;
	#5208 SerialDataRx = 0;
	#5208 SerialDataRx = 0;
	#5208 SerialDataRx = 1;
	#5208 SerialDataRx = 1;//paridad
	#5208 SerialDataRx = 1;

end

/*********************************************************/
endmodule 