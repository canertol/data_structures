module CONTROLLER(input  clk, reset,
						input  [31:0] Inst,
						input  [3:0] ALUFlags,
						output  [1:0] RegSrc,
						output  RegWrite,
						output  [1:0] ImmSrc,
						output  ALUSrc,
						output  [1:0] ALUControl,
						output  MemWrite, MemtoReg,
						output  PCSrc, Shift);
						
   wire[1:0] FlagW;
	wire PCS, RegW, MemW;
		 
	DEC decoder(Inst[27:26], Inst[25:20], Inst[15:12],
					ImmSrc, RegSrc, NoWrite, Shift,
					MemtoReg, ALUSrc, RegW, MemW, PCS, 
					ALUControl, FlagW);

	COND_LOGIC conditional_logic(clk, reset, Inst[31:28], ALUFlags,
										  FlagW, PCS, RegW, MemW, NoWrite,
										  RegWrite, MemWrite, PCSrc);
			
endmodule