module datareg (clk,a,b,enable);
input [7:0] a;
input clk,enable;
output [7:0] b;
reg [7:0] b;

initial begin
b=0;
end


always @(posedge clk) begin
     if (enable==1) begin
			b<=a;
		end
  end 


endmodule