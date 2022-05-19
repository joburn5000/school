module mux_2(
	input select,
	input [15:0] 	A, B,
	output logic [15:0] 	C
	);
	
always_comb
begin
C = 16'hxxxx;
case (select)
	1'b0	: C = A;
	1'b1	: C = B;
endcase
end
endmodule

module mux_2_3(
	input select,
	input [2:0] 	A, B,
	output logic [2:0] 	C
	);
	
always_comb
begin
C = 3'hx;
case (select)
	1'b0	: C = A;
	1'b1	: C = B;
endcase
end
endmodule


module mux_4(
	input [1:0] select,
	input [15:0] 	A, B, C, D,
	output logic [15:0] 	E
	);
	
always_comb
begin
E = 16'hxxxx;
case (select)
	2'b00	: E = A;
	2'b01	: E = B; 
	2'b10	: E = C;
	2'b11	: E = D;
endcase
end
endmodule

module mux_16(
	input [3:0] select,
	input [15:0] 	A, B, C, D,
	output logic [15:0] 	I
	);
	
always_comb
begin
case (select)
	4'b1000	: I = A;
	4'b0100	: I = B;
	4'b0010	: I = C;
	4'b0001	: I = D;
	default	: I = 16'bx;
endcase
end
endmodule
