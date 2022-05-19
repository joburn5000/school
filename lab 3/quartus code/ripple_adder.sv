module bit_adder (
					input x, y, z,
					output logic s,c);
	
	always_comb begin
		s = x^y^z;
		c = (x&y) | (y&z) | (z&x);
	end
	

endmodule

module nibble_adder (
					input	[3:0] 	A,
					input	[3:0] 	B,
					input       	cin,
					output logic [3:0] 	S,
					output logic  		cout);	
		
		logic c_0, c_1, c_2;
		
		bit_adder fa0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(c_0));
		bit_adder fa1(.x(A[1]), .y(B[1]), .z(c_0), .s(S[1]), .c(c_1));
		bit_adder fa2(.x(A[2]), .y(B[2]), .z(c_1), .s(S[2]), .c(c_2));
		bit_adder fa3(.x(A[3]), .y(B[3]), .z(c_2), .s(S[3]), .c(cout));

endmodule



module ripple_adder (
					input  logic[15:0] A, 
					input  logic[15:0] B,
					input  logic       cin,
					output logic[15:0] S,
					output logic       cout);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
		logic c_0, c_1, c_2;
		
		nibble_adder ra0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c_0));
		nibble_adder ra1(.A(A[7:4]), .B(B[7:4]), .cin(c_0), .S(S[7:4]), .cout(c_1));
		nibble_adder ra2(.A(A[11:8]), .B(B[11:8]), .cin(c_1), .S(S[11:8]), .cout(c_2));
		nibble_adder ra3(.A(A[15:12]), .B(B[15:12]), .cin(c_2), .S(S[15:12]), .cout(cout));
     
endmodule
