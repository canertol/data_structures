module registerfile(clk,we3,ra1,ra2,wa3,wd3,r15,rd1,rd2,r2,r3,r4,r5,r7);
input clk,we3;
input [2:0] ra1,ra2,wa3;
input [7:0] wd3,r15;
output [7:0] rd1,rd2;
output [7:0] r2,r3,r4,r5,r7;
reg [7:0] regs[14:0];

initial begin
regs[2]=0;
regs[3]=0;
regs[4]=0;
regs[5]=0;
regs[7]=0;
end

assign rd1=regs[ra1];
assign rd2=regs[ra2];
assign r2=regs[2];
assign r3=regs[3];
assign r4=regs[4];
assign r5=regs[5];
assign r7=regs[7];

always @(posedge clk)
	if(we3) regs[wa3]<= wd3;



endmodule
