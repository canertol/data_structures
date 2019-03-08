 module register #(parameter W = 8) (
	clk,
	in, out,
	load, clr, inc
);
 	input clk;
	input [W-1:0] in;
	output reg [W-1:0] out;
	input load, clr, inc;

	initial
	begin
		out = {W{1'b0}};
	end

	always @(posedge clk)
	begin
		if (load)
			out <= in;
		else if (clr)
			out <= {W{1'b0}};
		else if (inc)
			out <= out + {{W-1{1'b0}}, 1'b1};
	end
endmodule
