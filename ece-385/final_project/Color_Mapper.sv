//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( 
input [5:0] count,
input [7:0] animation,

input [3:0] state,



input        [9:0] DrawX, DrawY, alienX, alienY, shipX, amisX, amisY, pmisX, pmisY,

input amis_exist, pmis_exist,

input [9:0][5:0] grid,

                       output logic [7:0]  Red1, Green1, Blue1 );
							  
							  
							  
  logic [7:0] Red, Green, Blue;
	 logic [7:0] alien_slice, alien_addr, number_addr, number_slice, number_addr2, number_slice2;
	 logic current_alien_pixel;
	 
	 logic [15:0] ship_slice;
	 logic [7:0]  ship_addr;
	 logic current_ship_pixel;
	 logic current_number_pixel;
	 
	 logic [9:0] alien_x_normalized;
	 logic [9:0] ship_x_normalized;
	 
	 assign alien_x_normalized = DrawX - alienX;
	 assign ship_x_normalized = DrawX - shipX;
	 
	 aliens_rom ROM_enemy(.addr(alien_addr), .data(alien_slice));
	 ship_rom ROM_player(.addr(ship_addr), .data(ship_slice));
	 number_rom ROM_number(.address(number_addr), .data(number_slice));
	 number_rom ROM_number2(.address(number_addr), .data(number_slice2));

    
    assign Red1 = Red;
    assign Green1 = Green;
    assign Blue1 = Blue;
    

    always_comb
    begin
	 
		if(DrawY < 10'd96)
			alien_addr = { 5'b0, DrawY[4:2]} + animation;
		else if(DrawY >= 10'd96 && DrawY < 10'd160)
			alien_addr = { 5'b0, DrawY[4:2]} + animation + 8'd16;
		else
			alien_addr = { 5'b0, DrawY[4:2]} + animation + 8'd32;
			
		
		ship_addr = 	{5'b0, DrawY[4:2]};

					
		current_ship_pixel = 1'b0;
	 	current_alien_pixel = 1'b0;
		current_number_pixel = 1'b0;
			
				if(count >= 0 && count <= 9) 
					number_addr = { 5'b0, DrawY[2:0]} + 0;
				
				else if(count >= 10 && count <= 19) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd16;					
				
				else if(count >= 20 && count <= 29) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd32;										
				
				else if(count >= 30 && count <= 39) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd48;										
				
				else if(count >= 40 && count <= 49) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd64;										
				
				else if(count >= 50 && count <= 59) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd80;										
				
				else if(count >= 60) 
					number_addr = { 5'b0, DrawY[2:0]} + 8'd96;										
				
				else 
					number_addr = 0;
				
				if(count % 10 == 0) 
					number_addr2 = { 5'b0, DrawY[2:0]};
				
				else if(count % 10 == 1) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd16;					
				
				else if(count % 10 == 2) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd32;										
				
				else if(count % 10 == 3) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd48;										
				
				else if(count % 10 == 4) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd64;										
				
				else if(count % 10 == 5) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd80;										
				
				else if(count % 10 == 6) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd96;										
				
				else if(count % 10 == 7) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd112;										
				
				else if(count % 10 == 8) 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd128;										
				
				else 
					number_addr2 = { 5'b0, DrawY[2:0]} + 8'd144;										
				
		if(state == 4'd0) begin
			Red = 8'd0;
			Green = 8'd255;
			Blue = 8'd0;
		end
		if(state == 4'd2) begin
			Red = 8'd255;
			Green = 8'd215;
			Blue = 8'd0;
		end
		else if(state == 4'd3) begin
			Red = 8'd255;
			Green = 8'd0;
			Blue = 8'd0;
		end
		
		//print the game logic
		else if(state == 4'd1) 
		begin
		 
			//Draw the enemies
			if (alien_x_normalized[5] == 1'b0 &&  DrawY < 10'd224 && 
			DrawY >= 10'd32 && DrawX >= alienX && grid[alien_x_normalized[9:6]][DrawY[7:5] - 3'd1]) begin				
					current_alien_pixel = alien_slice[alien_x_normalized[4:2]];
					
					if(current_alien_pixel) begin
						Red = 8'hff;
						Green = 8'hff;
						Blue = 8'hff;
					end
					
					else begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
					
			end
			
			//draw enemy missile
			else if(amis_exist && DrawX[9:2] == amisX[9:2] && DrawY[9:2] == amisY[9:2]) begin
			
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			
			end
			
			//draw player missile
			else if(pmis_exist && DrawX[9:2] == pmisX[9:2] && DrawY[9:2] == pmisY[9:2]) begin
			
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
			
			end
			
			//draw the ship
			else if(DrawY >= 10'd448 && DrawX >= shipX && DrawX < shipX + 10'd64 ) begin
			
				current_ship_pixel = ship_slice[ship_x_normalized[5:2]];
				
				if(current_ship_pixel) begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
				end
				
				else begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
			
			end
			
			else begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
			end
		end
		
	
	  else begin
		Red = 8'd0;
			Green = 8'd255;
			Blue = 8'd0;
	  end
 end 
    
endmodule