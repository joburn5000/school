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
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ship ( input Reset, frame_clk, pcollide,
					input [7:0] keycode,
               output [9:0]  shipX, shipY, shipS,
					output logic create, destroy, 
					output [2:0] lives);
    
    logic [9:0] ship_X_Pos, ship_X_Motion, ship_Y_Pos, ship_Y_Motion, ship_Size;

	 
    parameter [9:0] ship_X_Center=320;  // Center position on the X axis
    parameter [9:0] ship_Y_Start=400;  // Center position on the Y axis
    parameter [9:0] ship_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] ship_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] ship_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] ship_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] ship_X_Step=1;      // Step size on the X axis
    parameter [9:0] ship_Y_Step=1;      // Step size on the Y axis

    assign ship_Size = 64;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 logic [7:0] timer;
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_ship
        if (Reset)  // Asynchronous Reset
        begin 
            ship_Y_Motion <= 10'd0; //Ball_Y_Step;
				ship_X_Motion <= 10'd0; //Ball_X_Step;
				ship_Y_Pos <= ship_Y_Start;
				ship_X_Pos <= ship_X_Center;
				lives = 3'd3;
				destroy = 0;
				timer = 0;
        end
        
        else 
        begin
				 if (pcollide) begin
					lives = lives - 3'd1;
					destroy = 1'b1;
					timer = timer + 8'd1;
					end
				else if(timer > 8'd60) begin
					destroy = 1'b0;
					timer = 0;
					end
				 /*if ( (ship_Y_Pos + ship_Size) >= ship_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					  ship_Y_Motion <= ;  // 2's complement.
					  
				 else if ( (ship_Y_Pos - ship_Size) <= ship_Y_Min )  // Ball is at the top edge, BOUNCE!
					  ship_Y_Motion <= ship_Y_Step;
					  */
				  if ( (ship_X_Pos + 32) >= ship_X_Max )  // Ball is at the Right edge, BOUNCE!
					  ship_X_Pos <= 604;  // 2's complement.
					  
				 else if ( (ship_X_Pos - 16) <= ship_X_Min )  // Ball is at the Left edge, BOUNCE!
					  ship_X_Pos <= 18;
					  
				 else 
				 begin
					  ship_Y_Motion <= ship_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 
				 case (keycode)
					8'h04 : begin
								
								if ((ship_X_Pos - 32) > ship_X_Min)
									ship_X_Pos <= (ship_X_Pos - ship_X_Step);

								/*ship_X_Motion <= -1;//A
								ship_Y_Motion<= 0;*/
							  end
					        
					8'h07 : begin
					
								if ((ship_X_Pos + ship_Size) < ship_X_Max)
									ship_X_Pos <= (ship_X_Pos + ship_X_Step);
									
					        /*ship_X_Motion <= 1;//D
							  ship_Y_Motion <= 0;*/
							  end

					/*		  
					8'h16 : begin

					        ship_Y_Motion <= 1;//S
							  ship_X_Motion <= 0;
							 end
							  
					8'h1A : begin
					        ship_Y_Motion <= -1;//W
							  ship_X_Motion <= 0;
							 end	 */
					8'd44 : begin //add missile stuff for space bar
								create = 1;
							  
					
					
							 end
					default: ;
			   endcase
				end
	/*
				 ship_Y_Pos <= (ship_Y_Pos + ship_Y_Motion);  // Update ball position
				 ship_X_Pos <= (ship_X_Pos + ship_X_Motion);
			*/
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign shipX = ship_X_Pos;
  
    assign shipY = ship_Y_Pos;
   
    assign shipS = ship_Size;
    

endmodule
