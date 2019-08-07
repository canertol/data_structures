module extend (a,immsrc,extimm);
input [23:0] a;
input [1:0] immsrc;
output [31:0] extimm;
reg [31:0] extimm;
always @(*)
	begin
		case(immsrc)
		0: extimm= {24'b0,a[7:0]};
		1: extimm= {20'b0,a[11:0]};
		2: extimm= {{6{a[23]}},a[23:0],2'b00};
		default: extimm= 32'bx;
		endcase

	end

endmodule