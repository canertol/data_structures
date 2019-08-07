module datapath
	( input wire [31:0] Instr, ReadData,
	  input wire PcSrc, RegWrite, ImmSrc, AluSrcB, shiftLR, RegSrc,
	  input wire [2:0] AluControl,
	  input wire [1:0] MemtoReg,
	  input wire clk, rst,
	  output wire [31:0] PC, 
	  output wire [31:0] WriteData, 
	  output wire [31:0] AluResult,
	  output wire CO, OVF, Z, N);
	  
wire [31:0] PcPlus4, PcPlus8, ExtImm, SrcB;
wire [31:0] RD1, RD2, Result, ShiftResult;
wire [3:0] 	RA2, Rd, Rn, Rm;

wire [31:0] Pc, ALUResult;
wire  [31:0] PcNext;
		


assign Rd = Instr[15:12];
assign Rn = Instr[19:16];
assign Rm = Instr[3:0];
assign WriteData = RD2;
	  
	  //next PC logic
	  mux_2to1  #(32) pcmux(PcPlus4, Result, PcNext, PcSrc);
	  simpleReg #(32) pcreg(clk, rst, PcNext, PC);
	  adder		#(32) pc4(PC, 32'b100, PcPlus4);
	  adder 		#(32) pc8(PcPlus4, 32'b100, PcPlus8);
	  
	  //register file 
	  mux_2to1		#(4) Ra2src(Rm, Rd, RA2, RegSrc);
	  registerFile #(32) regFile(clk, rst, RegWrite, Rn, RA2, Rd, Result, PcPlus8, RD1, RD2);
	  extendImm		#(32) extend(Instr[11:0], ImmSrc, ExtImm);
	  mux_2to1		#(32) sourceB(RD2, ExtImm, SrcB, AluSrcB);
	  shift			#(32) shifter(RD2, ExtImm, shiftLR, ShiftResult);
	  ALU				#(32) alu(RD1, SrcB, AluControl, AluResult, CO, OVF, Z, N);
	  mux_4to1		#(32) resultmux(ReadData, AluResult, ShiftResult, 32'b0, Result, MemtoReg);
	  
  

endmodule 