module bit_adder (
					input x, y, z,
					output logic s,c);
	
	always_comb begin
		s = x^y^z;
		c = (x&y) | (y&z) | (z&x);
	end
	

endmodule

module nibble_lookahead_adder (
	input  [3:0] A, B,
	input         cin,
	output [3:0] S,
	output        cout,
	output 		P_out, G_out
);
	
	logic [3:0] P, G; 
	logic c_1, c_2, c_3;
	logic [2:0] dont_care;
	
	assign P = A^B;
	assign G = A&B;
	assign c_1 = (cin & P[0]) | G[0];
	assign c_2 = (cin & P[0] & P[1]) | (G[0] & P[1]) | G[1];
	assign c_3 = (cin & P[0] & P[1] & P[2]) | (G[0] & P[1] & P[2]) | (G[1] & P[2]) + G[2];
	
	bit_adder ba0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(dont_care[0]));
	bit_adder ba1(.x(A[1]), .y(B[1]), .z(c_1), .s(S[1]), .c(dont_care[1]));
	bit_adder ba2(.x(A[2]), .y(B[2]), .z(c_2), .s(S[2]), .c(dont_care[2]));
	bit_adder ba3(.x(A[3]), .y(B[3]), .z(c_3), .s(S[3]), .c(cout));
	
	assign P_out = P[0] & P[1] & P[2] & P[3];
	assign G_out = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

	
endmodule


module lookahead_adder ( // 9 bit lookahead adder
	input  [8:0] A, B,
	input         cin,
	output [8:0] S,
	output        cout
);
	
	
	logic c_1, G_0, G_4, P_0, P_4, c_8;
	logic [2:0] dont_care;
	assign c_1 = (cin & P_0) | G_0;
	
	nibble_lookahead_adder NLA0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(dont_care[0]), .P_out(P_0), .G_out(G_0));
	nibble_lookahead_adder NLA1(.A(A[7:4]), .B(B[7:4]), .cin(c_1), .S(S[7:4]), .cout(c_8), .P_out(P_4), .G_out(G_4));
	bit_adder BA0(.x(A[8]), .y(B[8]), .z(c_8), .s(S[8]), .c(cout));
	
	
endmodule