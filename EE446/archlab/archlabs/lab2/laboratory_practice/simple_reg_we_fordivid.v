module simple_reg_we_fordivid #(parameter W=8)(D,reset,clk,enable,out,outbit);
    input [(W-1):0] D;                 
    input reset,clk,enable;
    output [(W-1):0] out;
    reg [(W-1):0] out;
	output reg outbit;
	 initial begin
	 out=0;
	 end
	 
	 always @(posedge clk) begin
		if (reset==1)
			out=0;
		else if (enable==1 & reset==0) begin
			out=D;
			outbit=out[7];
			end
		else begin
			out=out;
			outbit=out[7];
			end
		end
endmodule