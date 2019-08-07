module registerfile(clk,we3,ra1,ra2,wa3,wd3,r15,rd1,rd2,r2,r3,r4,r5,r7,rdstore);
input clk,we3;
input [2:0] ra1,ra2,wa3;
input [7:0] wd3,r15;
output [7:0] rd1,rd2;
output [7:0] r2,r3,r4,r5,r7,rdstore;
reg [7:0] regs[7:0];   // r6 is LR and r7 is PC

initial begin
regs[1]=0;
regs[2]=0;
regs[3]=0;
regs[4]=0;
regs[5]=0;
regs[7]=0;
end

assign rd1=regs[ra1];
assign rd2=regs[ra2];
assign rdstore=regs[wa3];
assign r2=regs[2]; //for demonstration
assign r3=regs[3]; //for demonstration
assign r4=regs[4]; //for demonstration
assign r5=regs[5]; //for demonstration
assign r7=regs[7]; //for demonstration

always @(posedge clk)
	if(we3) regs[wa3]<= wd3;



endmodule
