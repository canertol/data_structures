 module datamem(a,wd,clk,we,ri); //name is datamem but it also holds insturctions
 input [7:0] wd;                    
 input[7:0] a;
 input clk,we;
 output [15:0] ri;
 reg [15:0] data[63:0]; // 2^6 entries
 
 initial begin
 data[0]<=16'b1000101100001010; // branch w.link to subr.1
 data[1]<=16'b1000101100010101; // branch w.link to subr.2
 data[2]<=16'b1000101100011000; // branch w.link to subr.3
 data[3]<=16'b1100001000000000; //finish

 
 data[10]<=16'b1100001000000001; // 16bit instruction or 8 bit data
 data[11]<=16'b1100001100000100; 
 data[12]<=16'b1100010000000011;
 data[13]<=16'b1100010100000011;
 data[14]<=16'b1100011100000011;
 data[15]<=16'b0000001001001100; //add array numbers and store them
 data[16]<=16'b0000001001010000;
 data[17]<=16'b0000001001010100;
 data[18]<=16'b0000001001011100; // end
 data[19]<=16'b1000101100000001; // branch link return
 
 data[21]<=16'b1100001000101010; //2s complement begin
 data[22]<=16'b0000101000101000; // end
 data[23]<=16'b1000101100000010; // branch link return

 data[24]<=16'b1100001000000000; //determine odd/even and shift begin
 data[25]<=16'b1100001100000000;
 data[26]<=16'b1100001000000111;
 data[27]<=16'b1100001100000111;
 data[28]<=16'b0101001001000000;
 data[29]<=16'b0101001001000000;
 data[30]<=16'b0101001001000000;
 data[31]<=16'b0101001001000000;
 data[32]<=16'b0101001001000000;
 data[33]<=16'b0101001001000000;
 data[34]<=16'b0101001001000000;
 data[35]<=16'b1100001000000111;
 data[36]<=16'b1001100000101100; // b if zero
 
 data[37]<=16'b0110001001000000;
 data[38]<=16'b0101001001000000;
 data[39]<=16'b0101001001000000;
 data[40]<=16'b0101001001000000;
 data[41]<=16'b0101001001000000;
 data[42]<=16'b0100101001000000; // end
 data[43]<=16'b1000101100000011; // branch link return
 
 data[44]<=16'b1100001000000111;
 data[45]<=16'b0110001001000000;
 data[46]<=16'b0100001001000000;
 data[47]<=16'b0100001001000000;
 data[48]<=16'b0100001001000000;
 data[49]<=16'b0100001001000000; // end
 data[50]<=16'b1000101100000011; // branch link return
 
 
 
// data[37]<=16'b1100001000000111;   
// data[38]<=16'b1100011100000111;
// 
// data[39]<=16'b1000101100110000; //bwlink
// data[41]<=16'b1100001000001100;
// 
// data[48]<=16'b1100001000000010;
// data[49]<=16'b1000101100101001; //b return
 end
 
 always @(posedge clk)begin
  if(we) data[a[7:0]]<=wd;
 end
 
 assign ri=data[a[7:0]];
 endmodule
 