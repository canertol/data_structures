module singlearm_conditional_controller (Cond,ALUFlags,FlagW,PCS,RegW,MemW,PCSrc,RegWrite,MemWrite,NoWrite);
input [3:0]Cond;
input [3:0]ALUFlags;
input [1:0]FlagW;
input PCS,RegW,MemW,NoWrite;

output PCSrc,RegWrite,MemWrite;
reg RegWrite;

always @(*)begin
if (NoWrite==0) RegWrite = RegW ; //& (NoWrite==0)
else begin
RegWrite=0;
end
end



assign MemWrite = MemW ;
assign PCSrc = PCS ;

endmodule