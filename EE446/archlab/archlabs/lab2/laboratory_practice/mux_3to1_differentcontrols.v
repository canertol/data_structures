module mux_3to1_differentcontrols #(parameter W=8)(D1,D2,D3,select,O);
input [(W-1):0] D1;
input [(W-1):0] D2;  
input [(W-1):0] D3;
input [2:0] select;
output [(W-1):0] O;
 
   // 00 -> a, 01 -> b, 10 -> c, 11 -> d
   assign O = select[2] ? (D1) : (select[1] ? D2 : D3); 
 
endmodule
