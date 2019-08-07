module and_bit (a,b,clk,C);
input a,clk;
input [15:0]b;
output reg [15:0]C;
always@(posedge clk)
begin
 C[15]= (a & b[15]);
 C[14]= (a & b[14]);
 C[13]= (a & b[13]);
 C[12]= (a & b[12]);
 C[11]= (a & b[11]);
 C[10]= (a & b[10]);
 C[9]= (a & b[9]);
 C[8]= (a & b[8]);
 C[7]= (a & b[7]);
 C[6]= (a & b[6]);
 C[5]= (a & b[5]);
 C[4]= (a & b[4]);
 C[3]= (a & b[3]);
 C[2]= (a & b[2]);
 C[1]= (a & b[1]);
 C[0]= (a & b[0]);
end
endmodule