module COND_LOGIC(input  clk, reset,
				input [3:0] Cond,
				input [3:0] ALUFlags,
				input [1:0] FlagW,
				input PCS, RegW, MemW, NoWrite,
				output reg  RegWrite,
				output MemWrite,PCSrc
				);
				
	 reg [3:0] Flags;
	 reg CondEx;
	 
	always
		begin
			if (NoWrite==0)
				RegWrite = RegW ; 
			else
				RegWrite = 0;
		end

assign MemWrite = MemW ;
assign PCSrc = PCS ;

endmodule