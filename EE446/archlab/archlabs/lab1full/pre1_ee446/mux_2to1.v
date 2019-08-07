module mux_2to1
	#(parameter WIDTH = 8)
	(in0, in1, out, sel);
	
	input [WIDTH-1:0] in0, in1;
	input sel;
	output reg [WIDTH-1:0] out;
	
	always @(*)
	begin
	
		if(sel == 1'b0)
			out = in0;
		else
			out = in1;
	
	end
	
endmodule
