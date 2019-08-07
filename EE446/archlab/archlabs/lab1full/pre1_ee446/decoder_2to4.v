/*
*
* Module of a 2 to 4 Decoder active low outputs. 
* This model uses behavioral modeling via the "case" statement.
*
*/

module decoder_2to4(a0, a1, Y0, Y1, Y2, Y3);
	
	input a0, a1;
	output reg Y0, Y1, Y2, Y3;
	
	always @(*)
	begin
	
		case({a1,a0})
			2'b00: 	{Y3, Y2, Y1, Y0} = 4'b1110;
			2'b01: 	{Y3, Y2, Y1, Y0} = 4'b1101;
			2'b10: 	{Y3, Y2, Y1, Y0} = 4'b1011;
			2'b11: 	{Y3, Y2, Y1, Y0} = 4'b0111;
			default: {Y3, Y2, Y1, Y0} = 4'bxxxx;
		endcase
	
	
	end
	
endmodule
