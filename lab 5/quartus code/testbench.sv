module testbench();

timeunit 10ns;

timeprecision 1ns;


logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;

slc3_testtop slc3_testtop(.*);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION
	Clk = 0;
end

initial begin: TEST_VECTORS
	Continue 	= 1'b0;
	Run 			= 1'b0;

	#2 
	
	Continue = 1'b1;
   Run 			= 1'b1;
		
	
<<<<<<< HEAD
	// Load inital memory	
	#2 SW = 10'd20;
	
	#2 Run = 0;
	#2 Run = 1;
	
	#50 Continue = 0;
	#2 Continue = 1;
	
	#50 Continue = 0;
=======
	// Basic I/O Test 1	
	#2 SW = 10'h5A;
	
	#2 Run = 0;
	#2 Run = 1;
	// change switch values to see if hex display is correct
	//#10 SW = 10'b0000011111;
	#70 SW = 10'h3;

	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
>>>>>>> e6c91f8e089f482f7fd41798f3214769357f980c
	#2 Continue = 1;
	#10 SW = 10'h2;
	
<<<<<<< HEAD
	#50 Continue = 0;
=======
	#300 Continue = 0;
	#2 Continue = 1;

	#300 Continue = 0;
>>>>>>> e6c91f8e089f482f7fd41798f3214769357f980c
	#2 Continue = 1;

	#300 Continue = 0;
	#2 Continue = 1;

	#300 Continue = 0;
	#2 Continue = 1;	
	
<<<<<<< HEAD
	#10 SW = 10'h4;
	
	#50 Continue = 0;
	#2 Continue = 1;
	
=======
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#900 SW = 10'h2;
>>>>>>> e6c91f8e089f482f7fd41798f3214769357f980c

	#50000 Continue = 0;
	#2 Continue = 1;
	
	#2 SW = 10'h3;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	

	#300 Continue = 0;
	#2 Continue = 1;

	#300 Continue = 0;
	#2 Continue = 1;

	#300 Continue = 0;
	#2 Continue = 1;	
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
	
	#300 Continue = 0;
	#2 Continue = 1;
//	#200	SW = 10'd2;
//	#2 	Continue = 0;
//	#2		Continue = 1;
//	
//	#100	SW = 10'd2;
//	#2 	Continue = 0;
//	#2		Continue = 1;
	
	/*
	#12 Continue = 0;
	#2	Continue = 1;
	#12 Continue = 0;
	#2	Continue = 1;
	
	#12 Continue = 0;
	#2	Continue = 1;
		#12 Continue = 0;
	#2	Continue = 1;
	
	#40 Continue = 0;
	#2	Continue = 1;
	
		#12 Continue = 0;
	#2	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#2 SW = 10'd2;	// value for A in #20 xor
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#2 SW = 10'd5;		// value for B in #20 xor
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#2 SW = 10'd9;	// value for A in #20 MULT
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#2 SW = 10'd34;	// value for B in #20 MULT
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	#20 	Continue = 0;
	#2 	Continue = 1;
	
	
	#20 	Continue = 0;
	#2 	Continue = 1;
	*/
	// reset program
	/*
	#12 Continue = 0;
		Run = 0;
	#2	
	   Run = 1;
	*/
	
/*	
	// Basic I/O Test 2
	#10 Reset = 1;
   #10 Continue = 0;
		Run = 0;
	   S = 16'h0006;
	// see if the hex displays values after continue is hit
   #100 Continue = 1;
	// hit continue
   #10 Continue = 0;
	#10 Continue = 1;
	// reset program
 	#100	Reset = 0;
	   Run = 1;

		

	// Self-Modifying Code Test
	#10 Reset = 1;
	#10 Continue = 1;
		Run = 0;
		S = 16'h000B;
	// see if the hex display increment by 1 each time continue is hit
	#100 Continue = 0;
	#10 Continue = 1;
	#100 Continue = 0;
	#10 Continue = 1;
	#100 Continue = 0;
	#10 Continue = 1;
	// reset program
	#100 Reset = 0;
	   Run = 1;

		
	
	
	// XOR Test
	#10 Reset = 1;
   #10 Continue = 1;
		Run = 0;
		S = 16'h0014;
	// XOR xEEEE and x1111, and the result should be xFFFF
	// enter xEEEE
	#100 S = 16'hEEEE;
	   Continue = 0;
	#10 Continue = 1;
	// enter x1111
	#100 S = 16'h1111;
	   Continue = 0;
	#10 Continue = 1;
	// reset program
	#200 Reset = 0;
	   Run = 1;
	
	
	
	// Multiplication Test
	#10 Reset = 1;
	#10 Continue = 1;
		Run = 0;
		S = 16'h0031;
	// x2020 multiplies x0005, and the result should be xA0A0
	// enter x0005
	#200 S = 16'h0005;
	   Continue = 0;
	#10 Continue = 1;
	// enter x2020
	#150 S = 16'h2020;
	   Continue = 0;
	#10 Continue = 1;
	// reset program
	#1000 Reset = 0;
	   Run = 1;
		
		
		
	// Sort Test
	#10 Reset = 1;
	#10 Continue = 1;
		S = 16'h005A;
		Run = 0;
	// choose "sort" command
	#100 S = 16'h0002;
	   Continue = 0;
	#10 Continue = 1;
	#21000 S = 16'h0003;
	   Continue = 0;
	// after sort, index 0 should be x0001
	#10 Continue = 1;
	// index 1 should be x0003
	#300 Continue = 0;
	#10 Continue = 1;
	// index 2 should be x0007
	#200 Continue = 0;
	#10 Continue = 1;
	// index 3 should be x000D
	#200 Continue = 0;
	#10 Continue = 1;
	// index 4 should be x001B
	#200 Continue = 0;
	#10 Continue = 1;
	// index 5 should be x001F
	#200 Continue = 0;
	#10 Continue = 1;
	// index 6 should be x0046
	#200 Continue = 0;
	#10 Continue = 1;
	// index 7 should be x0047
	#200 Continue = 0;
	#10 Continue = 1;
	// index 8 should be x004E
	#200 Continue = 0;
	#10 Continue = 1;
	// index 9 should be x006B
	#200 Continue = 0;
	#10 Continue = 1;
	// index 10 should be x008C
	#200 Continue = 0;
	#10 Continue = 1;
	// index 11 should be x00B8
	#200 Continue = 0;
	#10 Continue = 1;
	// index 12 should be x00DB
	#200 Continue = 0;
	#10 Continue = 1;
	// index 13 should be x00EF
	#200 Continue = 0;
	#10 Continue = 1;
	// index 14 should be x00F8
	#200 Continue = 0;
	#10 Continue = 1;
	// index 15 should be x00FA
	#200 Continue = 0;
	#10 Continue = 1;
	// reset program
	#250 Reset = 0;
	   Run = 1;
		
		
		
	// "Act Once" Test
	#10 Reset = 1;
	#10 Continue = 1;
		S = 16'h002A;
		Run = 0;
	// Hex should count up by 1 each time, starting from 0
	#150 Continue = 0;
	#10 Continue = 1;
	#100 Continue = 0;
	#10 Continue = 1;
	#100 Continue = 0;
	#10 Continue = 1;
	// reset program
	#100 Reset = 0;
	   Run = 1;
*/
	end
	 
endmodule