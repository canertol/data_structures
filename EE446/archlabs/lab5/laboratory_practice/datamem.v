 module datamem(a,wd,clk,we,ri);
 input [7:0] wd;
 input[7:0] a;
 input clk,we;
 output [15:0] ri;
 reg [15:0] data[63:0];
 
 initial begin
 data[0]<=16'b1100101000000011;
 data[1]<=16'b1100101000000011;
 data[2]<=16'b0000001001001000;
 data[3]<=16'b0000000010101000;
 
 end
 
 always @(posedge clk)begin
  if(we) data[a[7:0]]<=wd;
 end
 
 assign ri=data[a[7:0]];
 endmodule
 