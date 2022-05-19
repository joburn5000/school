module HexDriver (	input				[3:0] In0,
							output logic	[7:0] Out0);
							
		// This module has hardcoded values that convert 4bit binary numbers from registers into hexadecimal
		always_comb
		begin
				unique case(In0)
						4'b0000	:	Out0 = 8'b01000000; // '0'
						4'b0001	:	Out0 = 8'b01111001; // '1'
						4'b0010	:	Out0 = 8'b00100100; // '2'
						4'b0011	:	Out0 = 8'b00110000; // '3'
						4'b0100	:	Out0 = 8'b00011001; // '4'
						4'b0101	:	Out0 = 8'b00010010; // '5'
						4'b0110	:	Out0 = 8'b00000010; // '6'
						4'b0111	:	Out0 = 8'b01111000; // '7'
						4'b1000	:	Out0 = 8'b00000000; // '8'
						4'b1001	:	Out0 = 8'b00010000; // '9'
						4'b1010	:	Out0 = 8'b00001000; // 'A'
						4'b1011	:	Out0 = 8'b00000011; // 'B'
						4'b1100	:	Out0 = 8'b01000110; // 'C'
						4'b1101	:	Out0 = 8'b00100001; // 'D'
						4'b1110	:	Out0 = 8'b00000110; // 'E'
						4'b1111	:	Out0 = 8'b00001110; // 'F'
						default	:	Out0 = 8'bX;
				endcase
		end
endmodule