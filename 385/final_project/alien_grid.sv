module alien_grid( input		logic	Reset,
						 input		logic [6:0] alien_hit,
						 input		logic hit,

						 output	logic [9:0][5:0]	alien_grid, 
						 output logic [5:0] count);
	

	
	always_ff @ (posedge Reset or posedge hit) begin
	
	if (Reset) begin
		alien_grid <= { 6'b111111,
							 6'b111111,
						 	 6'b111111,
							 6'b111111,
							 6'b111111,
							 6'b111111,
							 6'b111111,
							 6'b111111,
							 6'b111111,
							 6'b111111 };
		count = 0;
	end
	
	else if(hit) begin
			alien_grid[alien_hit[6:3]][alien_hit[2:0]] <= 1'b0;
			count = count + 1;
	end
	
	end


endmodule