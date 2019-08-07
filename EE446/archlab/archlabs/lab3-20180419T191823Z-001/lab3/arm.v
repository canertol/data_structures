module arm
	( input wire clk, rst,
	  input wire [31:0] ReadData, Instr,
	  output wire [31:0] WriteData, AluResult, PC,
	  output wire [3:0] Flags,
	  output wire WriteEnable);
	  
	  
	  wire CO, OVF, Z, N;
	  wire PcSrc, shiftLR, RegWrite, ImmSrc, ALUSrcB, RegSrc;
	  wire [1:0] MemtoReg;
	  wire [2:0] AluControl;
	  
	  
	  controller c1(  clk,rst,
							Instr,
							CO, N, Z, OVF,
							WriteEnable,
							PcSrc, shiftLR,
							RegWrite,
							ImmSrc,
							MemtoReg,
							ALUSrcB, RegSrc,
							AluControl,
							Flags);
	  
	  
	  datapath  d1( Instr, ReadData,
						 PcSrc, RegWrite, ImmSrc, ALUSrcB, shiftLR, RegSrc,
						 AluControl,
						 MemtoReg,
						 clk, rst,
						 PC, WriteData, AluResult,
						 CO, OVF, Z, N);

endmodule 