module control (	input Clk, Reset_Load_clear, Run,
						output logic shift_en, add_en, sub_en, load_BS, clear_A);
		
		
		// State Machine:
		
		// reset -> (if Reset_Load_clear becomes 1) -> clear -> load 	-> reset 
		//			-> (if Run becomes 1) -> add 	-> shift -> ... -> subtract -> shift -> hold -> (if Run becomes 0) -> reset
		
		
		enum logic [4:0] {
		
								clear, load, reset, hold, restart,
								add1, shift1,
								add2, shift2,
								add3, shift3,
								add4, shift4,
								add5, shift5,
								add6, shift6,
								add7, shift7,
								add8, shift8
								
								} curr_state, next_state;
		
	
		
		
		always_ff @ (posedge Clk or posedge ~Reset_Load_clear ) 
		begin
				if (~Reset_Load_clear)
					curr_state = load;					// This button resets A and loads B and S
				else
					curr_state = next_state;
		end
		
		
		always_comb
		begin		
			next_state = curr_state; 
			
			unique case (curr_state)
			
				clear  : next_state = add1;			 // Clears A
				load   : next_state = reset; 			 // Loads B and clear A
				
				reset  : begin
					if (~Reset_Load_clear) next_state = load;
					else if (~Run) next_state = add1;
				end
				add1 	 : next_state = shift1;			// Add states
				add2 	 : next_state = shift2;
				add3 	 : next_state = shift3;
				add4 	 : next_state = shift4;
				add5 	 : next_state = shift5;
				add6 	 : next_state = shift6;
				add7 	 : next_state = shift7;
				add8 	 : next_state = shift8;			// Subtract state
				
				shift1 :	next_state = add2;			// Shift states
				shift2 : next_state = add3;
				shift3 : next_state = add4;
				shift4 : next_state = add5;
				shift5 : next_state = add6;
				shift6 : next_state = add7;
				shift7 : next_state = add8;
				shift8 : next_state = restart;
				
				restart	 : if (Run) next_state = hold; // Hold state (necesarry so that the multiplication doesn't go on forever)
				hold		 : if (~Run) next_state = clear;
				
				
			endcase
		end
		
		always_comb
		begin
			case (curr_state)
				
				clear: 
				begin
						shift_en <= 1'b0;
						add_en 	<= 1'b0;
						sub_en 	<= 1'b0;
						load_BS 	<= 1'b0;
						clear_A 	<= 1'b1; // Clear A
				end
				
				
				load: 
				begin
						shift_en <= 1'b0;
						add_en 	<= 1'b0;
						sub_en 	<= 1'b0;
						load_BS 	<= 1'b1; // Load B
						clear_A 	<= 1'b0;
				end
				
				
				reset, hold, restart: 
				
				begin
						shift_en <= 1'b0; // All 0s
						add_en 	<= 1'b0;
						sub_en 	<= 1'b0;
						load_BS 	<= 1'b0;
						clear_A 	<= 1'b0;
				end
				
				
				add1, add2,
				add3, add4,
				add5, add6,
				add7: 
				
				begin
						shift_en <= 1'b0;
						add_en 	<= 1'b1; // Add enable
						sub_en 	<= 1'b0;
						load_BS 	<= 1'b0;
						clear_A 	<= 1'b0;
				end
				
				
				add8: 
				
				begin
						shift_en <= 1'b0;
						add_en 	<= 1'b1; // Add enable
						sub_en 	<= 1'b1; // Subtract enable
						load_BS 	<= 1'b0;
						clear_A 	<= 1'b0;
				end
				
				
				shift1, shift2,
				shift3, shift4,
				shift5, shift6,
				shift7, shift8: 
				
				begin
						shift_en <= 1'b1; // Shift enable
						add_en 	<= 1'b0;
						sub_en 	<= 1'b0;
						load_BS 	<= 1'b0;
						clear_A 	<= 1'b0;
				end
				
			endcase
		end
endmodule