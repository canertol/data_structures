module demultiplexer1_2 #(parameter W=8)( din ,sel ,dout1,dout2 );

output [7:0] dout1 ;
reg [7:0] dout1 ;
output [7:0] dout2 ;
reg [7:0] dout2 ;
input [(W-1):0] din ;
wire [(W-1):0] din ;
input  sel ;
wire  sel ;

always @ (*) begin
 case (sel)
  0 : dout1 = din;
  1 : dout2 = din;
  default : dout1 = din;
 endcase
end

endmodule