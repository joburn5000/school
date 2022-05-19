module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. *///select_adder.sv
	  
	  logic c_0, c_1, c_2;
	  
	  nibble_adder1 block1(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c_0));
	  select_block block2(.A(A[7:4]), .B(B[7:4]), .cin(c_0), .s(S[7:4]), .cout(c_1));
	  select_block block3(.A(A[11:8]), .B(B[11:8]), .cin(c_1), .s(S[11:8]), .cout(c_2));
	  select_block block4(.A(A[15:12]), .B(B[15:12]), .cin(c_2), .s(S[15:12]), .cout(cout));


endmodule


module select_block (
			input [3:0] 		 A, B,
			input					 cin,
			output logic [3:0] s,
			output logic 		 cout
);

	logic [3:0] op1, op2;
	logic out1, out2;

	nibble_adder1 NA1(.A(A), .B(B), .cin(h0), .S(op1), .cout(out1));
	nibble_adder1 NA2(.A(A), .B(B), .cin(h1), .S(op2), .cout(out2));
	mux2_1 M21(.in1(op1), .in2(op2), .select(cin), .out(s));
	assign cout = (out2 & cin) | (out1);


endmodule


module mux2_1(
				input [3:0]        in1, 
				input [3:0] 		 in2, 
				input       		 select,
				output logic [3:0] out
);

		assign out = select ? in2 : in1;

endmodule

module bit_adder1 (
					input x, y, z,
					output logic s,c);
	
	always_comb begin
		s = x^y^z;
		c = (x&y) | (y&z) | (z&x);
	end
	

endmodule

module nibble_adder1 (
					input	[3:0] 	A,
					input	[3:0] 	B,
					input       	cin,
					output logic [3:0] 	S,
					output logic  		cout);	
		
		logic c_0, c_1, c_2;
		
		bit_adder1 fa0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(c_0));
		bit_adder1 fa1(.x(A[1]), .y(B[1]), .z(c_0), .s(S[1]), .c(c_1));
		bit_adder1 fa2(.x(A[2]), .y(B[2]), .z(c_1), .s(S[2]), .c(c_2));
		bit_adder1 fa3(.x(A[3]), .y(B[3]), .z(c_2), .s(S[3]), .c(cout));

endmodule