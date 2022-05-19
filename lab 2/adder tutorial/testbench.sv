module testbench();

timeunit 10ns;

timeprecision 1ns;

logic [1:0] A,B;
logic c_in;
logic [1:0] S;
logic c_out;

adder2 adder0(.*);

initial begin: TEST_VECTORS
A = 2'b00;
B = 2'b00;
c_in = 0;

#2 A=2'b01;
B=2'b01;
c_in =1;

end

endmodule
