module Constant_Value_Generator #(parameter W = 10, V = 10'b1111111111 ) (bus_in);

	output wire [(W-1):0] bus_in;
	
	assign bus_in = V;

endmodule