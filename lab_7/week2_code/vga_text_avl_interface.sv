

/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/

`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [8]; // Registers
//put other local variables here

	logic pixel_clk, blank, sync; //output
	logic [9:0] DrawX, DrawY; //output
	logic [7:0] avl_data;
	logic [11:0] position;
	logic [10:0] addr;

//Declare submodules..e.g. VGA controller, ROMS, etc

logic	[31:0] readout_buffer;
logic [31:0] mem_readout, buffer_readout;
logic mem_write, mem_read;
logic [31:0] out;

assign mem_write = AVL_WRITE & ~AVL_ADDR[11] & AVL_CS;
assign mem_read = AVL_READ & AVL_CS & ~AVL_ADDR[11];

ram ram1 (.address_a(position[11:2]), .address_b(AVL_ADDR[9:0]), .byteena_b(AVL_BYTE_EN), .clock(CLK), 
			.rden_a(1), .rden_b(AVL_READ), .data_a(0), .data_b(AVL_WRITEDATA), .wren_a(0), 
			.wren_b(AVL_WRITE & AVL_CS), .q_a(out), .q_b(AVL_READDATA));

		//check clk and reset *
vga_controller vga(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixel_clk), 
							.blank(blank), .sync(sync), .DrawX(DrawX), .DrawY(DrawY));
		// check AVL_ADDR
		// check if rom1234 is the way
font_rom rom1(.addr(addr), .data(avl_data));
	
   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
/*always_ff @(posedge CLK) begin
	if (RESET) begin
		for (int i=0; i<8; i++)
			LOCAL_REG[i] <= 32'b0;
	end
	else if (AVL_CS) begin
		
		if (AVL_WRITE)  begin
			if(AVL_BYTE_EN == 4'b1111)
				LOCAL_REG[AVL_ADDR[2:0]] = AVL_WRITEDATA;
			else if (AVL_BYTE_EN == 4'b1100)
				LOCAL_REG[AVL_ADDR[2:0]][31:16] <= AVL_WRITEDATA[31:16];
				
			else if (AVL_BYTE_EN == 4'b0011)
				LOCAL_REG[AVL_ADDR[2:0]][15:0] <= AVL_WRITEDATA[15:0];
				
			else if (AVL_BYTE_EN == 4'b1000)
				LOCAL_REG[AVL_ADDR[2:0]][31:24] <= AVL_WRITEDATA[31:24];
				
			else if (AVL_BYTE_EN == 4'b0100)
				LOCAL_REG[AVL_ADDR[2:0]][23:16] <= AVL_WRITEDATA[23:16];
				
			else if (AVL_BYTE_EN == 4'b0010)
				LOCAL_REG[AVL_ADDR[2:0]][15:8] <= AVL_WRITEDATA[15:8];
				
			else if (AVL_BYTE_EN == 4'b0001)
				LOCAL_REG[AVL_ADDR[2:0]][7:0] <= AVL_WRITEDATA[7:0];
		end
		else if (AVL_READ) begin
			// read
			buffer_readout <= LOCAL_REG[AVL_ADDR[2:0]];
		end
	end
end

always_comb begin
	if (AVL_CS & AVL_READ) begin
		if (mem_read)
			AVL_READDATA <= mem_readout; // avalon
		else
			AVL_READDATA <= buffer_readout; // vram
	end
	else 
		AVL_READDATA <= 32'hX;
end	
*/

//handle drawing (may either be combinational or sequential - or both)

logic[9:0] row, col;
logic[9:0] reg_;
logic[31:0] reg_val;
logic[7:0] character, reg_byte;
logic avl_bit;
//logic [11:0] background, foreground;
logic [3:0] r,g,b;
logic [31:0] CONTROL_REG;

always_ff @(posedge CLK) begin
	if(AVL_ADDR == 600) begin
		CONTROL_REG <= AVL_WRITEDATA;
	end

end

always_comb
begin
	row = DrawY[9:4];
	col = DrawX[9:3];
	position = col + row*80;
	reg_val = out;
	case(position[1:0])
		2'b00 : character <= reg_val[7:0];
		2'b01 : character <= reg_val[15:8];
		2'b10 : character <= reg_val[23:16];
		2'b11 : character <= reg_val[31:24];
	endcase
	
	addr[10:4] = character;
	addr[3:0] = DrawY[3:0];
	avl_bit = avl_data[7-DrawX[2:0]];
end

always_ff @(posedge pixel_clk)
begin
	// CHECK POLARITY
	if (character[7] ^ avl_bit) begin
		{r,g,b} <= {CONTROL_REG[24:21], CONTROL_REG[20:17], CONTROL_REG[16:13]};
	end
	else begin
		{r,g,b} <= {CONTROL_REG[12:9], CONTROL_REG[8:5], CONTROL_REG[4:1]};
	end
	if (blank)
	begin
		red <= r;
		blue <= b;
		green <= g;
	end
	else
	begin
		red <= 4'b0;
		blue <= 4'b0;
		green <= 4'b0;
	end
end


endmodule
