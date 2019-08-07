module simple_reg_we #(parameter W=8)(D,reset,clk,enable,out);
    input [(W-1):0] D;                 
    input reset,clk,enable;
    output [(W-1):0] out;
    reg [(W-1):0] out;

	 initial begin
	 out=0;
	 end
	 
	 always @(posedge clk) begin
		if (reset==1)
			out=0;
		else if (enable==1 & reset==0)
			out=D;
		else
			out=out;
		end
endmodule