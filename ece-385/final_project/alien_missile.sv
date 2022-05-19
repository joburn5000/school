module alien_missile(
	input    logic          destroy,
	input		logic				Reset,
	input		logic	[9:0]		ship_X,				
	input		logic [9:0][5:0] 	alien_grid,	
	input		logic				frame_clk,			
	input		logic [9:0]		alien_offset,		
	input    logic [9:0]    alienY,
	input		logic [3:0]		state,
	
	
	output	logic				exists,				
	output 	logic	[9:0]		missileX,			
	output	logic	[9:0]		missileY				
	);

	logic [7:0] missile_timer;		
	logic [5:0] alien_column;
	logic [3:0] column_index;
	
	always_comb begin
	
		column_index = ship_X[9:6];
		alien_column = alien_grid[column_index];

	end
	
	
	always_ff @ (posedge frame_clk or posedge Reset) 
	begin
	
		if(Reset) begin
			missile_timer = 0;
			exists = 0;
		end
		
		else if(state != 4'd1) begin
			missile_timer = 8'd0;
			exists = 1'b0;
		end
		else if(destroy) begin
			exists = 0;
			missileX = 0;
			missileY = 0;
		end
		else begin
		
			missileX = missileX;
			
			if(missile_timer < 8'd120 && !exists) begin
				missile_timer = missile_timer + 8'd1;
			end
			
			else if(missile_timer >= 8'd120 && !exists) begin
			
				missileX = {column_index, 6'b0} + alien_offset + 10'd16;
				missile_timer = 8'd0;
			
				if(alien_column[5]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd224;
				end
				
				else if(alien_column[4]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd192;
				end
				
				else if(alien_column[3]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd160;
				end
				
				else if(alien_column[2]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd128;
				end
				
				else if(alien_column[1]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd96;
				end
				
				else if(alien_column[0]) begin
					exists = 1'b1;
					missileY = /*alienY*/ + 10'd64;
				end
			end
			else if (missileY >= 480) begin
				
				exists = 0;
				
			end
			
			else if(exists) begin
				
				missileY = missileY + 10'd3;
				
			end
			
		end
				
	end

endmodule