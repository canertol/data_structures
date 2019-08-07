module extendImm
	#(parameter W=32)
	( input wire [11:0] Instr,
	  input wire ImmSrc,
	  output reg [W-1:0] ExtImm);
	 
	 always @(*)
	 begin
		if(ImmSrc == 0) //Imm12
			ExtImm = {20'b0, Instr[11:0]};
		else
			ExtImm = {27'b0, Instr[11:7]};
	 
	 end
endmodule 