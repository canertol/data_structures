module shift_reg_fordivid #(parameter W=8)(enable,S,D,reset,psload,lrshift,clk,out,outbit);
    input [(W-1):0] D;	 
    input S,reset,clk,psload,lrshift,enable;
    output reg [(W-1):0] out;
//    reg [(W-1):0] out;
	 output reg outbit;
	 always @(posedge clk) begin
		if (reset) begin
			out=0;
			end
		else if (psload==1 & enable==1) begin
			out=D;
			outbit=out[7];
			end
		else if (lrshift==1 & enable==1) begin
			out <= (out >> 1);
			out[(W-1)] <= S;
			outbit=out[7];
			end
		else if (lrshift == 0 & enable==1) begin
			out <= out<< 1;
			out[0] <= S;
			outbit=out[7];
			end
		end
endmodule