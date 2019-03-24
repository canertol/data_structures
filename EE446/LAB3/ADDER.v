module ADDER #(parameter W = 8)	(input  [W-1:0] a, b,
											 output  [W-1:0] y);
												
	assign y = a + b;
			
endmodule