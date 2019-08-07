module demultiplexer1_3 #(parameter W=8)( din ,sel ,dout1,dout2,dout3 );

output [(W-1):0] dout1 ;
reg [(W-1):0] dout1 ;
output [(W-1):0] dout2 ;
reg [(W-1):0] dout2 ;
output [(W-1):0] dout3 ;
reg [(W-1):0] dout3 ;
input [(W-1):0] din ;
wire [(W-1):0] din ;
input [2:0] sel ;
wire [2:0] sel ;

always @ (*) begin
 case (sel)
  0 : dout3 = din;
  1 : dout3 = din;
  2 : dout2 = din;
  3 : dout1 = din;
  4 : dout3 = din;
  5 : dout3 = din;
  6 : dout3 = din;
  7 : dout3 = din;
 endcase
end

endmodule