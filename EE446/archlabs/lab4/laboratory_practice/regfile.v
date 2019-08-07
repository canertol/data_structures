module regfile #(parameter W=4) (reset,clk,write,addrout1,addrout2,wraddr,dataA,dataB,datain);
	input clk,write,reset;
   input [2:0] wraddr;
   input [15:0] datain;
   input [2:0] addrout1;
	input [2:0] addrout2;
   output reg [(W-1):0] dataA;
   output reg [(W-1):0] dataB;

   reg [(W-1):0] 	 reg0, reg1, reg2, reg3;
	
	initial begin
	 reg0=0;
	 reg1=0;
	 reg2=0;
	 reg3=0;
	 end

   always @(*) begin
      case (addrout1)
	0: dataA = reg0;
	1: dataA = reg1;
	2: dataA = reg2;
	3: dataA = reg3;
	default: dataA = 16'hXXXX;
      endcase
   end
   always @(*) begin
      case (addrout2)
	0: dataB = reg0;
	1: dataB = reg1;
	2: dataB = reg2;
	3: dataB = reg3;
	default: dataB = 16'hXXXX;
      endcase
   end
   always @(posedge clk) begin
		if(reset==0) begin
		reg0<=0;
		reg1<=0;
		reg2<=0;
		reg3<=0;
		end
      else if (write) 
			case (wraddr) 
			0: reg0 <= datain;
			1: reg1 <= datain;
			2: reg2 <= datain;
			3: reg3 <= datain;
			endcase // case (wrAddr)
   end // always @ (posedge clk)
endmodule