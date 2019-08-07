module control_unit(clk,rst,alucontrol,cmp,load,enable,multip,divid,logicop,loadcont);
input clk,cmp,load,rst;
input [2:0]alucontrol;
output enable,multip,divid,logicop,loadcont;
reg[4:0] Control_Variable;
reg [1:0] y,Y;
wire enable,multip,divid,logicop,loadcont;
parameter S0=0,S1=1,S2=2,S3=3,S4=4;


//next state logic
always@ (y or load or cmp or alucontrol)
	begin
		case (y)
		S0: if (!load && !cmp) Y=S0;
			 else if (load) Y=S1;
			 else if (cmp && (alucontrol==3'b010)) Y=S2;
			 else if (cmp && (alucontrol==3'b011)) Y=S3;
			 else  Y=S4;
		S1: Y=S0;
		S2: Y=S0;
		S3: Y=S0;
		S4: Y=S0;
		endcase
		end
//state reg
always @(posedge clk)
	if (rst) y<=S0;
	else y<=Y;

	
//output logic
always@(y)
	case (y)
	S0: Control_Variable=5'b00000;
	S1: Control_Variable=5'b10001;
	S2: Control_Variable=5'b11000;
	S3: Control_Variable=5'b10100;
	S4: Control_Variable=5'b10010;
	endcase

assign enable=Control_Variable[4];
assign multip=Control_Variable[3];
assign divid=Control_Variable[2];
assign logicop=Control_Variable[1];
assign loadcont=Control_Variable[0];
endmodule
	