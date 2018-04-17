module uart_rx(
    input rx,
    input clk,
    input reset,
	 input enable_flag,
    output enable_max,
	 output enable_half
);



enum logic [3:0] {IDLE, START, B0, B1, B2, B3, B4, B5, B6, B7, PARITY, STOP} state;

always_ff@(posedge clk, negedge reset)
	begin
		if (reset == 1'b0) 
			state <= IDLE;
		else 
		case (state)
				IDLE: 
					if (~rx)  // Inicio con la cero en rx
						state <= START;
				START:
					if(enable_flag)
						state <= B0;
				B0:
					if(enable_flag)
						state <= B1;
				B1:
					if(enable_flag)
						state <= B2;
				B2:
					if(enable_flag)
						state <= B3;
				B3:
					if(enable_flag)
						state <= B4;
				B4:
					if(enable_flag)
						state <= B5;
				B5:
					if(enable_flag)
						state <= B6;
				B6:
					if(enable_flag)
						state <= B7;
				B7:
					if(enable_flag)
						state <= PARITY;
				PARITY:
					if(enable_flag)
						state <= STOP;
				STOP:
					if(enable_flag)
						state <= IDLE;
				
				default:		
					state <= IDLE;
			endcase
	end



always_comb begin
	enable_half = 1'b0;
	enable_max = 1'b0;
	case(state)
		IDLE: 
			begin
				enable_half = 1'b0;
				enable_max = 1'b0;
			end
		START:
			begin
				enable_half = 1'b1;
				enable_max = 1'b0;
			end
		B0:
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B1:
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B2:	
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B3:	
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B4:
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B5:	
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B6:
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		B7:	
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		PARITY:
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		STOP:	
			begin
				enable_half = 1'b0;
				enable_max = 1'b1;
			end
		default: 
			begin
				enable_half = 1'b0;
				enable_max = 1'b0;
			end
		endcase

end


endmodule
