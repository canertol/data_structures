module mux_2to1 #(parameter W=8)(D1,D2,select,O);
output [(W-1):0]O;
input [(W-1):0]D1;
input [(W-1):0]D2;
input select;
assign O=(select)?D1:D2;
endmodule