module PC #(parameter W=32)(CLK,NEXT,CURRENT);
	input [W-1:0] NEXT;
	input CLK;
	output reg [W-1:0] CURRENT;

	initial begin
	CURRENT = 0;
	end
	
	always @(posedge CLK)
		CURRENT <= NEXT;
endmodule