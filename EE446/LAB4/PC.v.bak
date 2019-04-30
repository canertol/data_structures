module PC #(parameter W=32)(CLK,NEXT,CURRENT,RST);
	input [W-1:0] NEXT;
	input CLK,RST;
	output reg [W-1:0] CURRENT;

	initial begin
	CURRENT = 0;
	end
	
	always @(posedge CLK)
		if(RST==0)
			CURRENT <= NEXT;
		else
			CURRENT <= 0;
		
endmodule