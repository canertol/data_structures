module adder 
#(parameter W = 32)
	(input wire [W-1:0] a, b,
	 output wire [W-1:0] y);
	 
	assign y = a+b;

endmodule 