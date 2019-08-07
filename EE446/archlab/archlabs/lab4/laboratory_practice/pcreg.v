module pcreg (clk,a,b,enable);
input [15:0] a;
input clk,enable;
output [15:0] b;
reg [15:0] b;

initial begin
b=16'bx;
end


always @(posedge clk) begin
     if (enable==1) begin
			b<=a;
		end
  end 


endmodule