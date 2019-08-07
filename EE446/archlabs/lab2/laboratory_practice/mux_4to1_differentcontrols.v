module mux_4to1_differentcontrols #(parameter W=8)(D1,D2,D3,D4,select,O);
input [(W-1):0] D1;
input [(W-1):0] D2;  
input [(W-1):0] D3;
input [(W-1):0] D4;
input [3:0] select;
output [(W-1):0] O;
 
   // 00 -> a, 01 -> b, 10 -> c, 11 -> d
   assign O = select[3] ? (D1) : (select[2] ? D2 : (select[1] ? D3 : D4)); 
 
endmodule
