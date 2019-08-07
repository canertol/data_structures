module constantValueGenerator
	#(parameter WIDTH = 8, constant = 0)
		(out);
	output reg [WIDTH-1:0] out;
	
	always @(*)
	begin
	
	out = constant;
	
	end
	
endmodule