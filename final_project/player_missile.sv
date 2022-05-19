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


module  player_missile ( input [7:0] keycode, input collided, Create, Reset, frame_clk,
					input [9:0] ship_x,
               output [9:0]  pmX, pmY,
					output logic ready, exist);
    
    logic [9:0] pm_X_Pos, pm_X_Motion, pm_Y_Pos, pm_Y_Motion, pm_Size;
	 
    parameter [9:0] pm_X_Start=1;  // Center position on the X axis
    parameter [9:0] pm_Y_Start=448;  // Center position on the Y axis
    parameter [9:0] pm_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] pm_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] pm_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] pm_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] pm_X_Step=1;      // Step size on the X axis
    parameter [9:0] pm_Y_Step=1;      // Step size on the Y axis

    assign pm_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 
	 always_comb begin
		
	 end
	 
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_pm
        if (Reset)  // Asynchronous Reset
        begin 
            pm_Y_Motion <= 10'd0; //Ball_Y_Step;
				pm_X_Motion <= 10'd0; //Ball_X_Step;
				pm_Y_Pos <= pm_Y_Start;
				pm_X_Pos <=ship_x + 10'd16;
        end
        else if (collided) begin
				pm_Y_Pos <= pm_Y_Start;
				pm_X_Pos <=ship_x + 10'd8;
				pm_Y_Motion <= 0;
				ready = 1;
				exist = 0;
		  end
        else if (keycode == 8'd44 && exist == 0) begin
				pm_Y_Motion <= 10'd0; //Ball_Y_Step;
				pm_X_Motion <= 10'd0; //Ball_X_Step;
				pm_Y_Pos <= pm_Y_Start;
				pm_X_Pos <=ship_x + 10'd8;
				exist = 1;
		  end
		  else if(exist)
        begin 
				 ready = 0;
				 exist = 1;
				 if ( (pm_Y_Pos + pm_Size) >= pm_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					  pm_Y_Motion <= (~ (pm_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (pm_Y_Pos - pm_Size) <= pm_Y_Min ) begin  // Ball is at the top edge, BOUNCE!
					  pm_Y_Motion <= 0;
					  ready = 1;
					  exist = 0;
					  end
				 else if ( (pm_X_Pos + pm_Size) >= pm_X_Max )  // Ball is at the Right edge, BOUNCE!
					  pm_X_Motion <= (~ (pm_X_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (pm_X_Pos - pm_Size) <= pm_X_Min )  // Ball is at the Left edge, BOUNCE!
					  pm_X_Motion <= pm_X_Step;
					  
				 else 
				 begin
					if(!ready)
						pm_Y_Motion <= (~ (pm_Y_Step) + 1'd2);  // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 /*
				 case (keycode)
					8'h04 : begin
								
								if ((pm_X_Pos - pm_Size) > pm_X_Min)
									pm_X_Pos <= (pm_X_Pos - pm_X_Step);

								ship_X_Motion <= -1;//A
								ship_Y_Motion<= 0;
							  end
					        
					8'h07 : begin
					
								if ((pm_X_Pos + pm_Size) < pm_X_Max)
									pm_X_Pos <= (pm_X_Pos + pm_X_Step);
									
					        ship_X_Motion <= 1;//D
							  ship_Y_Motion <= 0;
							  end

							  
					8'h16 : begin

					        pm_Y_Motion <= 1;//S
							  pm_X_Motion <= 0;
							 end
							  
					8'h1A : begin
					        pm_Y_Motion <= -1;//W
							  pm_X_Motion <= 0;
							 end	 
					
					default: ;
			   endcase
				*/
				end
	
				 pm_Y_Pos <= (pm_Y_Pos + pm_Y_Motion);  // Update ball position
				 pm_X_Pos <= (pm_X_Pos + pm_X_Motion);
			
			
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
       
    assign pmX = pm_X_Pos;
  
    assign pmY = pm_Y_Pos;
   
    //assign pmS = pm_Size;
    

endmodule
