



//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Lab 5 Given Code - SLC-3 top-level (Physical RAM)
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//------------------------------------------------------------------------------


// @todo design the datapath
// @todo make mux module

module slc3(
	input logic [9:0] SW,
	input logic	Clk, Reset, Run, Continue,
	output logic [9:0] LED,
	input logic [15:0] Data_from_SRAM,
	output logic OE, WE,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic [15:0] ADDR,
	output logic [15:0] Data_to_SRAM
);



	

// An array of 4-bit wires to connect the hex_drivers efficiently to wherever we want
// For Lab 1, they will direclty be connected to the IR register through an always_comb circuit
// For Lab 2, they will be patched into the MEM2IO module so that Memory-mapped IO can take place



logic [3:0] hex_4[3:0]; 
logic [15:0] MAR, MDR, IR;
logic [15:0] regs[8], SR2_out, SR1_out, SR2_mux_out, MIO_mux_out;
logic [2:0] DR_mux_out, SR1_mux_out;




// TODO: check all my muxes have the right inputs for the select
// TODO: clean up

// TODO get switch values into IR

// This works thanks to http://stackoverflow.com/questions/1378159/verilog-can-we-have-an-array-of-custom-modules


// Internal connections
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic SR2MUX, ADDR1MUX, MARMUX;
logic BEN, MIO_EN, DRMUX, SR1MUX;
logic [1:0] PCMUX, ADDR2MUX, ALUK;
logic [15:0] MDR_In;


logic [15:0] PC;
logic [15:0] PCMUX_out;
logic [15:0] ALU;
logic [15:0] BUS;
logic [15:0] ALU_in;
logic [15:0] ADDR_sum;
logic [2:0]  CC, NZP;
logic [3:0] GATES;
logic [15:0] ADDR1MUX_out;
logic [15:0] ADDR2MUX_out;


// Connect MAR to ADDR, which is also connected as an input into MEM2IO
//	MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
//	input into MDR)

assign ADDR = MAR; 
assign MIO_EN = ~OE;
assign GATES = {GatePC, GateMDR, GateALU, GateMARMUX};

// Connect everything to the data path (you have to figure out this part)
//datapath d0 (.*);

// Our SRAM and I/O controller (note, this plugs into MDR/MAR)

/* todo:
reg BEN, CC, REG, LED

//LD_BEN
//LD_CC
//LD_REG
//LD_LED

*/

always_comb
begin
	if (BUS==16'h0)
		NZP = 3'b010;
	else if (BUS[15]==1'b1)
		NZP = 3'b100;
	else 
		NZP = 3'b001;
end


reg_file 	registers(.LD_reg(LD_REG), .Clk(Clk), .Reset(Reset), .Load_data(BUS), .DR(DR_mux_out), .SR1(SR1_mux_out), .SR2(IR[2:0]), .SR1_out(SR1_out), .SR2_out(SR2_out));
ALU_module 	ALU0 (.ALUK(ALUK), .A(SR1_out), .B(SR2_mux_out), .ALU_out(ALU));


reg_16 	MAR_reg 	(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), 	.D(BUS), 	 	.Data_Out(MAR));
reg_16 	MDR_reg 	(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), 	.D(MIO_mux_out), .Data_Out(MDR));
reg_16 	PC_reg 	(.Clk(Clk), .Reset(Reset), .Load(LD_PC),  	.D(PCMUX_out), .Data_Out(PC));
reg_16 	IR_reg 	(.Clk(Clk), .Reset(Reset), .Load(LD_IR), 	 	.D(BUS), 		.Data_Out(IR));
reg_3  	CC_reg	(.Clk(Clk), .Reset(Reset), .Load(LD_CC), 	 	.D(NZP),  		.Data_Out(CC));
reg_1  	BEN_reg	(.Clk(Clk), .Reset(Reset), .Load(LD_BEN), 	.D((IR[11] & CC[2]) | (IR[10] & CC[1]) | (IR[9] & CC[0])), .Data_Out(BEN));

//mux_2		ADDR1_mux (.A(SR1_out), .B(PC), .select(ADDR1MUX), .C(ADDR1MUX_out));
//mux_4		ADDR2_mux (.A({{5{IR[10]}}, IR[10:0]}), .B({{7{IR[8]}}, IR[8:0]}), .C({{10{IR[5]}}, IR[5:0]}), .D(16'b0), .select(ADDR2MUX), .E(ADDR2MUX_out));

mux_2		ADDR1_mux (.A(PC), .B(SR1_out), .select(ADDR1MUX), .C(ADDR1MUX_out));
mux_4		ADDR2_mux (.A(16'b0), .B({{10{IR[5]}}, IR[5:0]}), .C({{7{IR[8]}}, IR[8:0]}), .D({{5{IR[10]}}, IR[10:0]}), .select(ADDR2MUX), .E(ADDR2MUX_out));

assign ADDR_sum = ADDR1MUX_out + ADDR2MUX_out;

mux_2 	MEM_IO_mux 	(.A(MDR_In), 		.B(BUS), 							.select(MIO_EN), 	.C(MIO_mux_out));
mux_16 	gate_mux 	(.A(PC), 			.B(MDR), 		.C(ALU), 		.D(ADDR_sum), 	.select(GATES), .I(BUS));
mux_4 	PC_mux 		(.A(PC + 1'b1),	.B(PC + 1'b1), .C(ADDR_sum), 	.D(BUS), 		.select(PCMUX), .E(PCMUX_out)); // todo verify inputs are correct
//mux_2 	DR_mux 		(.A(3'b111), 		.B(IR[11:9]), 						.select(DRMUX), 	.C(DR_mux_out)); // TODO: 3 input instead of 16 todo is this bad?
mux_2_3 	DR_mux 		(.A(IR[11:9]), 	.B(3'b111), 						.select(DRMUX), 	.C(DR_mux_out)); // TODO: 3 input instead of 16 todo is this bad?
mux_2_3 	SR1_mux 		(.A(IR[11:9]), 	.B(IR[8:6]), 						.select(SR1MUX), 	.C(SR1_mux_out));
mux_2 	SR2_mux 		(.A(SR2_out), 		.B({{12{IR[4]}}, IR[3:0]}), 	.select(SR2MUX), 	.C(SR2_mux_out));










assign LED = IR[9:0];

/*
// Week q:
HexDriver hex_driver1(IR[15:12], HEX3);
HexDriver hex_driver0(IR[11:8], 	HEX2);
HexDriver hex_driver3(IR[7:4], 	HEX1);
HexDriver hex_driver2(IR[3:0], 	HEX0);
*/

HexDriver hex_drivers[3:0] (hex_4, {HEX3, HEX2, HEX1, HEX0});



Mem2IO memory_subsystem(
    .*, .Reset(Reset), .ADDR(ADDR), .Switches(SW),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]),
    .Data_from_CPU(MDR), .Data_to_CPU(MDR_In),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// State machine, you need to fill in the code here as well
ISDU state_controller(
	.*, .Reset(Reset), .Run(Run), .Continue(Continue),
	.Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
   .Mem_OE(OE), .Mem_WE(WE)
);

// SRAM WE register
//logic SRAM_WE_In, SRAM_WE;
//// SRAM WE synchronizer
//always_ff @(posedge Clk or posedge Reset_ah)
//begin
//	if (Reset_ah) SRAM_WE <= 1'b1; //resets to 1
//	else 
//		SRAM_WE <= SRAM_WE_In;
//end

	
endmodule
