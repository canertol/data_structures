module shift
	#(parameter W =32)
	( input wire [W-1:0] RD2, ExtImm,
	  input wire shiftLR,
	  output reg [W-1:0] shiftResult);
	  
	 always @(*)
	 begin
		case(shiftLR)
			1'b0: shiftResult =  RD2 << ExtImm;//shift left
			1'b1: shiftResult =  RD2 >> ExtImm;//shift right
			default: shiftResult = RD2;
		endcase
	 end
endmodule 