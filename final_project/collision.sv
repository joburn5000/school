module collision(
	input Reset, frame_clk,
	input logic [9:0] pmissileX, pmissileY, amissileX, amissileY, alienY, ship_X, alienX,
	input [9:0][5:0] grid,
	output logic [6:0] alien_hit,
	output logic playercollide, aliencollide
);

	logic [9:0] pmissile_normalized;
	logic [9:0] ship_Xmax;
	logic [9:0] row1;
	logic [9:0] row2;
	logic [9:0] row3;
	logic [9:0] row4;
	logic [9:0] row5;
	logic [9:0] row6;
	
	always_comb begin
	
		pmissile_normalized = pmissileX - alienX;
		ship_Xmax = ship_X + 10'd64;
		row1 = 10'd63;
		row2 = 10'd95;
		row3 = 10'd127;
		row4 = 10'd159;
		row5 = 10'd191;
		row6 = 10'd223;
	
	end
	
	always_ff @(posedge frame_clk or posedge Reset) begin
	
		if(Reset) begin
			playercollide = 0;
			aliencollide = 0;
		end
		
		else begin
		
			if(playercollide)
				playercollide = 0;
				
			if(aliencollide)
				aliencollide = 0;
				
			if(amissileY >= 10'd452 && amissileY < 10'd480 && amissileX >= ship_X && amissileX <= ship_Xmax)
				playercollide = 1;
				
			if(pmissileY[9:5] == row1[9:5] && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row1[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row1[7:5] - 3'd1 };
			end
			
			if(pmissileY[9:5] == row2[9:5] && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row2[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row2[7:5] - 3'd1 };
			end
			
			if(pmissileY[9:5] == row3[9:5] && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row3[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row3[7:5] - 3'd1 };
			end
			
			if(pmissileY[9:5] == row4[9:5] && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row4[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row4[7:5] - 3'd1 };
			end
			
			if(pmissileY[9:5] == row5[9:5] && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row5[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row5[7:5] - 3'd1 };
			end
			
			if(pmissileY[9:5] == row6[9:5]  && pmissile_normalized[5] == 1'b0 &&
			grid[pmissile_normalized[9:6]][row6[7:5] - 3'd1]) begin
				aliencollide = 1;
				alien_hit = { pmissile_normalized[9:6], row6[7:5] - 3'd1 };
			end
			
		end
	
	end


endmodule