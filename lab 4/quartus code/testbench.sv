module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk, Reset_Load_clear, Run, shift_en, add_en, sub_en, load_BS, clear_A, shift_into_B, X, Xval;
logic [7:0] HEX1, HEX0, HEX3, HEX2, HEX5, HEX4;
logic [9:0] LED, SW;
logic [7:0] Aval, Bval, A, B, S, A_out, B_out, dont_care;
logic [8:0] add_val;
logic [15:0] expected, product;

multiplier multiplier0(.*);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION
	Clk = 0;
end

initial begin : TEST_VECTORS

// Load Value into B
# 2 SW = 8'h02;
# 4 Reset_Load_clear = 1;
# 4 Reset_Load_clear = 0;
# 4 Reset_Load_clear = 1;

// Load value into S
# 6 SW = 8'hFE;
# 2 Run = 1;
# 2 Run = 0;
# 2 Run = 1;

# 40 	expected = (8'h02*8'hFE);
		product = {Aval, Bval};

	if (product != expected) $display("Not equal!");
	else $display("Equal!");

	
end
endmodule