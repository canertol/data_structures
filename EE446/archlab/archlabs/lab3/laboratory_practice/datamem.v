module datamem (a,wd,clk,we,rd);
input [31:0] a,wd;
input clk,we;
output [31:0] rd;
reg [31:0] data[63:0];
assign rd= data[a[31:0]];

always @(posedge clk)
	if(we) data[a[31:0]]<=wd;


endmodule