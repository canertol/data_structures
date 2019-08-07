module control_unit_v1(clk,rst,alucontrol,cmp,load,enable,multip,divid,logicop,loadcont,enable2,enable1,psload,lrshift1,enableout);
input clk,cmp,load,rst;
input [2:0]alucontrol;
output enable,multip,divid,logicop,loadcont,enable2,enable1,psload,lrshift1,enableout;
reg[9:0] Control_Variable;
reg [1:0] y,Y;
wire enable,multip,divid,logicop,loadcont;
parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7,S8=8,S9=9,S10=10,S11=11,S12=12,S13=13,S14=14,S15=15,S16=16,S17=17,S18=18,S19=19,S20=20,S21=21;


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
		S2: Y=S5;
		S3: Y=S0;
		S4: Y=S0;
		S5: Y=S6;
		S6: Y=S7;
		S7: Y=S8;
		S8: Y=S9;
		S9: Y=S10;
		S10: Y=S11;
		S11: Y=S12;
		S12: Y=S13;
		S13: Y=S14;
		S14: Y=S15;
		S15: Y=S16;
		S16: Y=S17;
		S17: Y=S18;
		S18: Y=S19;
		S19: Y=S20;
		S21: Y=S0;
		endcase
		end
//state reg
always @(posedge rst or negedge clk)
	if (rst) y<=S0;
	else y<=Y;

	
//output logic
always@(y)
	case (y)
	S0: Control_Variable=10'b0000000000;
	S1: Control_Variable=10'b1000100000;
	S2: Control_Variable=10'b1100000000;
	S3: Control_Variable=10'b1010000000;
	S4: Control_Variable=10'b1001000000;
	S5: Control_Variable=10'b00000_11100;
	S6: Control_Variable=10'b00000_10010;
	S7: Control_Variable=10'b00000_00011;
	S8: Control_Variable=10'b00000_11010;
	S9: Control_Variable=10'b00000_00011;
	S10: Control_Variable=10'b00000_11010;
	S11: Control_Variable=10'b00000_00011;
	S12: Control_Variable=10'b00000_11010;
	S13: Control_Variable=10'b00000_00011;
	S14: Control_Variable=10'b00000_11010;
	S15: Control_Variable=10'b00000_00011;
	S16: Control_Variable=10'b00000_11010;
	S17: Control_Variable=10'b00000_00011;
	S18: Control_Variable=10'b00000_11010;
	S19: Control_Variable=10'b00000_00011;
	S20: Control_Variable=10'b11000_11010;
	S21: Control_Variable=10'b11000_00011;
	endcase

assign enable=Control_Variable[9];
assign multip=Control_Variable[8];
assign divid=Control_Variable[7];
assign logicop=Control_Variable[6];
assign loadcont=Control_Variable[5];
assign enable2=Control_Variable[4];
assign enable1=Control_Variable[3];
assign psload=Control_Variable[2];
assign lrshift1=Control_Variable[1];
assign enableout=Control_Variable[0];

endmodule
	
