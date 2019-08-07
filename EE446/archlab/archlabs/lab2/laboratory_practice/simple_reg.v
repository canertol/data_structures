module simple_reg #(parameter W=8)(D,reset,clk,out);
    input [(W-1):0] D;                 
    input reset,clk;
    output [(W-1):0] out;
    reg [(W-1):0] out;
	 
	 always @(posedge clk)
		if (reset)
			out=0;
		else
			out=D;
endmodule