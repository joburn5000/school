module reg_file(input LD_reg, Clk, Reset,
					input [15:0] Load_data,
					input [2:0] DR, SR1, SR2,
					output logic [15:0] SR1_out, SR2_out);


logic [7:0][15:0] R;

always_ff @ (posedge Clk) begin
		if(Reset) begin
			 R[0] 	<=	16'h0000;
			 R[1] 	<=	16'h0000;
			 R[2] 	<=	16'h0000;
			 R[3] 	<=	16'h0000;
			 R[4] 	<=	16'h0000;
			 R[5] 	<=	16'h0000;
			 R[6] 	<=	16'h0000;
			 R[7] 	<=	16'h0000;
		end
		else if(LD_reg) begin
			case (DR)
				3'b000	:	R[0] <= Load_data;
				3'b001	:	R[1] <= Load_data;
				3'b010	:	R[2] <= Load_data;
				3'b011	:	R[3] <= Load_data;
				3'b100	:	R[4] <= Load_data;
				3'b101	:	R[5] <= Load_data;
				3'b110	:	R[6] <= Load_data;
				3'b111	:	R[7] <= Load_data;
				default: ;
			endcase
		end
	end

	always_comb begin
		case (SR1)
			3'b000	:	SR1_out = R[0];
			3'b001	:	SR1_out = R[1];
			3'b010	:	SR1_out = R[2];
			3'b011	:	SR1_out = R[3];
			3'b100	:	SR1_out = R[4];
			3'b101	:	SR1_out = R[5];
			3'b110	:	SR1_out = R[6];
			3'b111	:	SR1_out = R[7];
			default: ;
		endcase

		case (SR2)
			3'b000	:	SR2_out = R[0];
			3'b001	:	SR2_out = R[1];
			3'b010	:	SR2_out = R[2];
			3'b011	:	SR2_out = R[3];
			3'b100	:	SR2_out = R[4];
			3'b101	:	SR2_out = R[5];
			3'b110	:	SR2_out = R[6];
			3'b111	:	SR2_out = R[7];
			default: ;
		endcase
	end
/*
reg_16 register0 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[0]),  .D(Load_data), .Data_Out(R[0]));
reg_16 register1 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[1]),  .D(Load_data), .Data_Out(R[1]));
reg_16 register2 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[2]),  .D(Load_data), .Data_Out(R[2]));
reg_16 register3 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[3]),  .D(Load_data), .Data_Out(R[3]));
reg_16 register4 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[4]),  .D(Load_data), .Data_Out(R[4]));
reg_16 register5 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[5]),  .D(Load_data), .Data_Out(R[5]));
reg_16 register6 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[6]),  .D(Load_data), .Data_Out(R[6]));
reg_16 register7 (.Clk(Clk), .Reset(Reset), .Load(LD_reg & LD_particular_reg[7]),  .D(Load_data), .Data_Out(R[7]));


assign SR1_out = R[SR1];
assign SR2_out = R[SR2];
*/


endmodule

