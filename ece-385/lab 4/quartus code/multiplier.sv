module multiplier( 	input [9:0] SW,
							input Clk, Reset_Load_clear, Run,
							output logic Xval,
							output logic [7:0] HEX1, HEX0, HEX3, HEX2, HEX4, HEX5,
							output logic [7:0] Aval, Bval,
							output logic [9:0] LED);
	
	
	
	logic shift_en, add_en, sub_en, load_BS, clear_A, shift_into_B;
	logic [7:0] S, A_out, B_out; 
	logic [8:0] add_val, inverted_S, A_sum, negative_S;
	logic [10:0] dont_care;
	
	
	// control states
	control run (.*);
	
	
	
	// add states
	
	// define S and negative S
	assign S = SW[7:0];
	assign inverted_S = {S[7]^1,S^8'b11111111}; // @ todo check
	lookahead_adder negative (.A(inverted_S), .B(1), .cin(0), .S(negative_S), .cout(dont_care[1]));
	
	
	// chooses to add 0, S, or negative S
	always_comb begin
		if (~add_en | ~B_out[0]) 	// add 0 because add enable is 0 or the multiplicant is 0
			add_val = 0;
		else if(sub_en)
			add_val = negative_S; 	// subtract S
		else
			add_val = {S[7], S}; 	// add S
	end
	
	// adds value to add
	lookahead_adder add(.A({Xval, A_out}), .B(add_val), .cin(0), .S({Xval,A_sum}), .cout(dont_care[2]));
	
	
	
	
	// shift states
	reg_8 X_reg (.Clk(Clk), .Reset(load_BS | clear_A), .Shift_In(0), .Load(add_en), .Shift_En(0), .D({dont_care[10:4], A_sum[8]}), .Shift_Out(dont_care[3]), .Data_Out(Xval));
	reg_8 B_reg (.Clk(Clk), .Reset(0), .Shift_In(shift_into_B), .Load(load_BS), .Shift_En(shift_en), .D(SW[7:0]), .Shift_Out(dont_care[3]), .Data_Out(B_out));
	reg_8 A_reg (.Clk(Clk), .Reset(load_BS | clear_A), .Shift_In(Xval), .Load(add_en), .Shift_En(shift_en), .D(A_sum[7:0]), .Shift_Out(shift_into_B), .Data_Out(A_out));
	
		HexDriver 		AHex0 (
								.In0(SW[3:0]),
								.Out0(HEX0) );
								
		HexDriver		AHex1 (
								.In0(SW[7:4]),
								.Out0(HEX1) );
								
		HexDriver		BHex0 (
								.In0(Bval[3:0]),
								.Out0(HEX2) );
								
		HexDriver		BHex1 (
								.In0(Bval[7:4]),
								.Out0(HEX3) );
		
		HexDriver		BHex2 (
								.In0(Aval[3:0]),
								.Out0(HEX4) );
								
		HexDriver		BHex3 (
								.In0(Aval[7:4]),
								.Out0(HEX5) );
								
		
		assign LED[1:0] = SW[9:8];
		assign LED[9] = Xval;
		assign LED[8:2] = 7'h00;

	
	always_comb begin
		Aval = A_out;
		Bval = B_out;
	end
	
endmodule