module frecuency_divider(
    input clk,
    input reset,
    output reg clk_dividido
    );

parameter [11:0] yy = 5208; // duración de medio ciclo del reloj para el baud_rate de 19,200(yy-1)


	
reg [11:0] CuentaCada20ns;
wire iguales;

always @ (posedge reset, posedge clk) 
	begin
		if (reset) 
				begin
				CuentaCada20ns <= 0; // Se inicializan los Flip_Flops
				clk_dividido<= 0;
				end
		else if (iguales)
			begin
				CuentaCada20ns <= 0; // Si llega al valor deseado se vuelve a iniciar
				clk_dividido <= ~clk_dividido;
			end
		else CuentaCada20ns <= CuentaCada20ns + 1'b1;
	end


	assign iguales = (CuentaCada20ns==yy)? 1'b1:1'b0;
endmodule
