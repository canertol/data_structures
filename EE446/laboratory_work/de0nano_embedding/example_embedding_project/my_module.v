module my_module (x1, x0, y);
	input x1, x0;
	output	y;
	assign y = (x0 & ~x1) | (~x0 & x1);
endmodule
