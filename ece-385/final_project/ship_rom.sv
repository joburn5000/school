module ship_rom
(
	input 	[7:0] addr,
	output 	[15:0] data
);

	parameter[0:7][15:0] ROM = {
	
		16'b0000000110000000,	//0 
		16'b0000001111000000,	//1         
		16'b0000001001000000,	//2   
		16'b0000001111000000,	//3     
		16'b0011001111001100,	//4 
		16'b1111111111111111,	//5  
		16'b1001111111111001,	//6  
		16'b1101111111110011,   //7  
	
	};
	
	assign data = ROM[addr];

endmodule 