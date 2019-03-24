module SHIFT (in, control,out);
	input [6:0] control;
	input [31:0] in;
	output reg [31:0] out;
	
	always
	begin
		if(control[1:0]==2'b00)
		out = in << control[6:2] ;	
		
		else if (control[1:0]==2'b01)
		out = in >> control[6:2];
	end



endmodule