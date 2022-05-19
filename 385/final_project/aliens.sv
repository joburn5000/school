//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                               --
//-------------------------------------------------------------------------


module  aliens ( input Reset, frame_clk,
               output [9:0]  alienX, alienY,
					output [7:0] animation_offset);

logic [7:0] counter;
logic direction;
logic [11:0] subpos;
logic [9:0] alienYpos;


always_ff @ (posedge frame_clk or posedge Reset) begin

	subpos = subpos;

	if(Reset) begin
		direction <= 1'b1;
		subpos <= 12'd0;
		counter <= 8'd0;
		alienY <= 10'd0;
	end

	else begin
		counter = counter + 8'd1;
		if(counter >= 8'd120)
			counter = 8'd0;
		if(direction)
			subpos = subpos + 12'h001; // move right
		else
			subpos = subpos - 12'h001; // move left
			
		if(subpos[11:2] >= 10'd32) begin // bounce to left
			subpos[11:2] = 10'd32;
			direction = 1'b0;
			alienY += 10'd32;
		end
		if(subpos[11:2] == 10'd0) begin // bounce to right
			direction = 1'b1;
			alienY += 10'd32;
		end
	end
		
end

assign alienX = subpos[11:2];
//assign alienY = alienYpos;

always_comb begin

	if(counter < 8'd60)
		animation_offset = 8'd8;
	else
		animation_offset = 8'd0;
		
end

endmodule				
	 
