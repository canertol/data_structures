module singlearm_decoder_controller(Op,Funct,Rd,FlagW,PCS,RegW,MemW,MemtoReg,ALUSrc,ImmSrc,RegSrc,ALUControl,NoWrite,shift);

input [1:0]Op;
input [5:0]Funct;
input [3:0]Rd;

output [1:0]FlagW,ImmSrc,RegSrc,ALUControl;
reg [1:0]ALUControl;
reg [1:0]FlagW;
output PCS,RegW,MemW,MemtoReg,ALUSrc,NoWrite,shift;
reg NoWrite,shift;
reg [9:0]signals;
wire Branch,ALUOp;

initial begin
NoWrite=0;
shift=0;
end
//main
always @(*) begin
 case(Op)
 2'b00: if(Funct[5]) signals=10'b0000101001;
		  else signals = 10'b0000001001;
 2'b01: if (Funct[0]) signals = 10'b0001111000;
		  else signals = 10'b1001110100;
 2'b10: signals = 10'b0110100010;
 default: signals = 10'bx;
 
 endcase
 end
 
assign {RegSrc, ImmSrc, ALUSrc, MemtoReg,RegW, MemW, Branch, ALUOp} = signals;

//alu
always @(*) begin
if(ALUOp)begin
  case(Funct[4:1])
	4'b0100: begin
				ALUControl = 2'b00; // ADD
				NoWrite=0;
				shift=0;
				end
	4'b0010: begin
				ALUControl = 2'b01; // SUB
				NoWrite=0;
				shift=0;
				end
	4'b0000: begin
				ALUControl = 2'b10; // AND
				NoWrite=0;
				shift=0;
				end
	4'b1100: begin
				ALUControl = 2'b11; // ORR
				NoWrite=0;
				shift=0;
				end
	4'b1010: begin 
				NoWrite=1;
				ALUControl = 2'b01; // cmp
				shift=0;
				end
	4'b1101: begin 
				NoWrite=0;
				ALUControl = 2'bx; // shift
				shift=1;
				end			
	default: begin
				ALUControl = 2'bx; // unimplemented
				NoWrite=0;
				shift=0;
				end
  endcase

 FlagW[1]=Funct[0];
 FlagW[0] = Funct[0] &(ALUControl == 2'b00 | ALUControl == 2'b01 );
 end
 else begin
 ALUControl=2'b00;
 FlagW = 2'b00;
 end
 end  
 
assign PCS = ((Rd == 4'b1111) & RegW) | Branch;


 
endmodule