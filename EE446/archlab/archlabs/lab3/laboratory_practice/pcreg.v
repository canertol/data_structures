module pcreg (clk,a,b);
input [31:0] a;
input clk;
output [31:0] b;
reg [31:0] b;

initial begin
b=0;
end


always @(posedge clk)
	b<=a;

endmodule