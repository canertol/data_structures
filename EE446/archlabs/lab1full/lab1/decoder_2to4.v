module decoder_2to4 (i1,i2,o1,o2,o3,o4);
input wire i1,i2;
output wire o1,o2,o3,o4;
assign o1= (~i1) & (~i2);
assign o2= (~i1) & i2;
assign o3= i1 & (~ i2);
assign o4= i1 & i2;

endmodule

