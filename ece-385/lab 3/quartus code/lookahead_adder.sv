module nibble_lookahead_adder (
	input  [3:0] A, B,
	input         cin,
	output [3:0] S,
	output        cout,
	output 		P_out, G_out
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	
	//comb_ff
	
	logic [3:0] P, G; 
	logic c_0, c_1, c_2, c_3;

	logic [2:0] dont_care;
	
	assign P = A^B;
	assign G = A&B;
	assign c_0 = cin;
	assign c_1 = (cin & P[0]) | G[0];
	assign c_2 = (cin & P[0] & P[1]) | (G[0] & P[1]) | G[1];
	assign c_3 = (cin & P[0] & P[1] & P[2]) | (G[0] & P[1] & P[2]) | (G[1] & P[2]) + G[2];
	
	bit_adder ba0(.x(A[0]), .y(B[0]), .z(c_0), .s(S[0]), .c(dont_care[0]));
	bit_adder ba1(.x(A[1]), .y(B[1]), .z(c_1), .s(S[1]), .c(dont_care[1]));
	bit_adder ba2(.x(A[2]), .y(B[2]), .z(c_2), .s(S[2]), .c(dont_care[2]));
	bit_adder ba3(.x(A[3]), .y(B[3]), .z(c_3), .s(S[3]), .c(cout));
	
	assign P_out = P[0] & P[1] & P[2] & P[3];
	assign G_out = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

	
endmodule


module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	
	//comb_ff
	
	logic c_0, c_1, c_2, c_3, G_0, G_4, G_8, G_12, P_0, P_4, P_8, P_12;
	
	logic [2:0] dont_care;
	
	assign c_0 = cin;
	nibble_lookahead_adder NLA0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(dont_care[0]), .P_out(P_0), .G_out(G_0));
	
	assign c_1 = (cin & P_0) | G_0;
	nibble_lookahead_adder NLA1(.A(A[7:4]), .B(B[7:4]), .cin(c_1), .S(S[7:4]), .cout(dont_care[1]), .P_out(P_4), .G_out(G_4));
	
	assign c_2 = (cin & P_0 & P_4) | (G_0 & P_4) | G_4;
	nibble_lookahead_adder NLA2(.A(A[11:8]), .B(B[11:8]), .cin(c_2), .S(S[11:8]), .cout(dont_care[2]), .P_out(P_8), .G_out(G_8));
	
	assign c_3 = (cin & P_0 & P_4 & P_8) | (G_0 & P_4 & P_8) | (G_4 & P_8) + G_8;
	nibble_lookahead_adder NLA3(.A(A[15:12]), .B(B[15:12]), .cin(c_3), .S(S[15:12]), .cout(cout), .P_out(P_12), .G_out(G_12));
	
endmodule





