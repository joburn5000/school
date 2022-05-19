module ALU_module (
				input [1:0] ALUK,
				input [15:0] A, B,
				output logic [15:0] ALU_out);

				
always_comb
begin
ALU_out = 16'hxxxx;
case(ALUK)
	2'b00 : ALU_out = A + B; 			// 00: ADD
	2'b01 : ALU_out = A & B;			// 01: AND
	2'b10 : ALU_out = A ^ 16'hFFFF;	// 10: NOT
	2'b11 : ALU_out = A;					// 11: pass input to output
endcase
end

endmodule

