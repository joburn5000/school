module statemachine
(
		input logic 			frame_clk,
		input logic [59:0] 	grid,
		input logic [2:0]		lives,
		input logic [7:0] 	keycode,
		input logic 			Reset,
		
		output logic [3:0]	state
);

	always_ff @ (posedge frame_clk or posedge Reset) begin
	
		if(Reset) begin
			state <= 4'b0;
		end
		
		else begin
		
			if(state == 4'b0 && keycode == 8'd44)
				state <= 4'd1;
			
			else if(state == 4'd1 && grid == 60'd0)
				state <= 4'd2;
				
			else if(state == 4'd1 && lives == 3'd0)
				state <= 4'd3;
					
			else
				state <= state;
		
		end
	
	end

endmodule 