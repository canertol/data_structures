module adder_16bit (A, B, sum);
input [15:0] A, B;
output [15:0] sum;
assign sum = A + B;
endmodule