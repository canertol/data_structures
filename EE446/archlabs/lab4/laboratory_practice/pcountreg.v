module pcountreg (reset,clk,a,b,enable);
input [7:0] a;
input clk,enable,reset;
output [7:0] b;
reg [7:0] b;

initial begin
b=8'b00000000;
end


always @(posedge clk or posedge reset) begin
		if (reset==1)begin
		b<=8'b00000000;
		
		end
     else if (enable==1) begin
			b<=a;
		end
  end 


endmodule