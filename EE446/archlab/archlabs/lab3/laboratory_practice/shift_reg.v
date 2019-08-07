module shift_reg #(parameter W=8)(S,D,reset,psload,lrshift,clk,out,outlastbit,outfirstbit);
    input [(W-1):0] D;	 
    input S,reset,clk,psload,lrshift;
    output reg [(W-1):0] out;
	 output  outlastbit;
	 output  outfirstbit;
assign outlastbit=out[7];
assign outfirstbit=out[0];
	 
	 always @(posedge clk) begin
		if (reset)
			out=0;
		else if (psload)
			out=D;
		else if (lrshift) begin
			out <= (out >> 1);
			out[W-1] <= S;
			end
		else if (lrshift == 0) begin
			out <= out<< 1;
			out[0] <= S;
			end
		end
endmodule
