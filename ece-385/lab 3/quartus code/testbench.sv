module testbench();

timeunit 10ns;

timeprecision 1ns;

logic 			Clk = 0;
logic				Reset_Clear, Run_Accumulate;
logic [9:0] 	SW;

	
logic [9:0] 	LED;
logic [6:0] 	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

logic 			cout;
logic	[15:0]	s;


adder2 tp(.*);


always begin: CLOCK_GENERATION

#1 Clk = ~Clk;
end



initial begin : TEST_VECTORS

#2 Clk = 0;

#2 SW = 10'h8;

#6 Reset_Clear = 0;
#6 Reset_Clear = 1;


#2	Run_Accumulate = 1;

#10 Run_Accumulate = 0; // put 8+8 into B

#10 Run_Accumulate = 1;

#10 Run_Accumulate = 0; // put 16+8 into B

#10 Run_Accumulate = 1;

#10 Run_Accumulate = 0; // put 24+8 into B

#10 Run_Accumulate = 1;


#10 cout = tp.adderla.cout;
	 s = tp.adderla.S;
	 
if (s != 32) begin
	$display("Not equal!");
	
end
else $display("Equal!");
	



end

endmodule