module control_unit(clk,rst,op,compute,load,enable,shift_quotient,loadps_quotient,S_quotient,out1_0bit,loadL,shift,loadH,out0_7bit,mux2select,alucontrol,mux4select,logicop,actualstate);
input clk,compute,load,rst,out1_0bit,out0_7bit;
input [2:0]op;
output enable,shift_quotient,loadps_quotient,S_quotient,loadL,shift,loadH,mux2select,logicop;
output [2:0]alucontrol;
output [1:0]mux4select;
output [4:0]actualstate;
reg[13:0] Control_Variable;
reg [4:0] y,Y;
wire enable,shift_quotient,loadps_quotient,S_quotient,loadL,shift,loadH,mux2select,logicop;
parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7,S8=8,S9=9,S10=10;


//next state logic
always@ (y or load or compute or op)
	begin
		case (y)
		S0: if (!load && !compute) Y=S0;
			 else if (load) Y=S1;
			 else if ((compute==1) && (op==2)) Y=S2; //MULTP
			 else if ((compute==1) && (op==3)) Y=S3;
			 else if ((compute==1) && (op==0)) Y=S4;
			 else if ((compute==1) && (op==1)) Y=S5;
			 else if ((compute==1) && (op==4)) Y=S6;
			 else if ((compute==1) && (op==5)) Y=S7;
			 else if ((compute==1) && (op==6)) Y=S8;
			 else if ((compute==1) && (op==7)) Y=S9;
			 else Y=S10;
		S1: Y=S0;
		S2: Y=S0;
		S3: Y=S0;
		S4: Y=S0;
		S5: Y=S0;
		S6: Y=S0;
		S7: Y=S0;
		S8: Y=S0;
		S9: Y=S0;
		S10: Y=S0;
		// for multiplication and division new states will come
		endcase
		end
//state reg
always @(posedge clk)
	if (rst) y<=S0;
	else y<=Y;

	
//output logic
always@(y)
	case (y)
	S0: Control_Variable=14'b00000000000000;
	S1: Control_Variable=14'b01000000000000;
	S2: Control_Variable=14'b11000000001011;
	S3: Control_Variable=14'b00000000000000;
	S4: Control_Variable=14'b11000000000010;
	S5: Control_Variable=14'b11000000000110;
	S6: Control_Variable=14'b11000000010010;
	S7: Control_Variable=14'b11000000010110;
	S8: Control_Variable=14'b11000000011010;
	S9: Control_Variable=14'b11000000011110;
	// controls are still being adjusted
	// above you can see load and normal alu operation controls (except multiplication and division)
	endcase
	
assign logicop=Control_Variable[13];
assign enable=Control_Variable[12];
assign shift_quotient=Control_Variable[11];
assign loadps_quotient=Control_Variable[10];
assign S_quotient=Control_Variable[9];
assign loadL=Control_Variable[8];
assign shift=Control_Variable[7];
assign loadH=Control_Variable[6];
assign mux2select=Control_Variable[5];
assign alucontrol=Control_Variable[4:2];
assign mux4select=Control_Variable[1:0];
assign actualstate=y;
endmodule
	
