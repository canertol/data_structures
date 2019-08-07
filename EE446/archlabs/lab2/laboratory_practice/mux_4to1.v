module mux_4to1 #(parameter W=8)(D1,D2,D3,D4,select,O);
input [(W-1):0] D1;
input [(W-1):0] D2;  
input [(W-1):0] D3;
input [(W-1):0] D4;
input [1:0] select;
output [(W-1):0] O;
 
   // 00 -> d1, 01 -> d2, 10 -> d3, 11 -> d4
   assign O = select[1] ? (select[0] ? D4 : D3) : (select[0] ? D2 : D1); 
 
endmodule
