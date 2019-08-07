module demultiplexer1_4 #(parameter W=8)( din ,sel ,dout1,dout2,dout3,dout4 );

output [(W-1):0] dout1 ;
reg [(W-1):0] dout1 ;
output [(W-1):0] dout2 ;
reg [(W-1):0] dout2 ;
output [(W-1):0] dout3 ;
reg [(W-1):0] dout3 ;
output [(W-1):0] dout4 ;
reg [(W-1):0] dout4 ;
input [(W-1):0] din ;
wire [(W-1):0] din ;
input [1:0] sel ;
wire [1:0] sel ;

always @ (din or sel) begin
 case (sel)
  0 : dout1 = din;
  1 : dout2 = din;
  2 : dout3 = din;
  3 : dout4 = din;
 endcase
end

endmodule