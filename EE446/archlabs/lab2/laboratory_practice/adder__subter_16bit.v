module adder__subter_16bit (op,A, B, out);
input [7:0] A, B;
input op;
output reg [7:0] out;
always @(*)
	case(op)
	0:out=A+B;
	1:out=A-B;
endcase
endmodule