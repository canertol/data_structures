// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Tue Apr 30 18:05:54 2019"

module multicycle(
	reset,
	clock,
	zeroflag,
	IRegen,
	ASrc1,
	RegWrite,
	carry,
	FlgWrite,
	pcEN,
	IDMWrite,
	IDMSrc,
	ASrc0,
	ALUa,
	ALUb,
	ALUCtrl,
	ALUout,
	BSrc,
	FetchedInst,
	Inst,
	LR,
	next_state,
	PCout,
	R2,
	R3,
	RD2,
	regadr1,
	regadr2,
	RegSrc,
	Shift,
	ShiftCtrl,
	Shiftin,
	Shiftout,
	shiftselectout,
	state,
	toReg,
	wa
);


input wire	reset;
input wire	clock;
output wire	zeroflag;
output wire	IRegen;
output wire	ASrc1;
output wire	RegWrite;
output wire	carry;
output wire	FlgWrite;
output wire	pcEN;
output wire	IDMWrite;
output wire	IDMSrc;
output wire	ASrc0;
output wire	[7:0] ALUa;
output wire	[7:0] ALUb;
output wire	[2:0] ALUCtrl;
output wire	[7:0] ALUout;
output wire	[1:0] BSrc;
output wire	[15:0] FetchedInst;
output wire	[15:0] Inst;
output wire	[7:0] LR;
output wire	[3:0] next_state;
output wire	[7:0] PCout;
output wire	[7:0] R2;
output wire	[7:0] R3;
output wire	[7:0] RD2;
output wire	[2:0] regadr1;
output wire	[2:0] regadr2;
output wire	[1:0] RegSrc;
output wire	[2:0] Shift;
output wire	[2:0] ShiftCtrl;
output wire	[7:0] Shiftin;
output wire	[7:0] Shiftout;
output wire	[7:0] shiftselectout;
output wire	[3:0] state;
output wire	[7:0] toReg;
output wire	[2:0] wa;

wire	C;
wire	carry_ALTERA_SYNTHESIZED;
wire	CLK;
wire	FlgWrite_ALTERA_SYNTHESIZED;
wire	[15:0] IDM;
wire	[15:0] Instr;
wire	RST;
wire	Z;
wire	zero;
wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_40;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_42;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_43;
wire	[1:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[1:0] SYNTHESIZED_WIRE_22;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[2:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_32;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	[2:0] SYNTHESIZED_WIRE_44;

assign	IRegen = SYNTHESIZED_WIRE_34;
assign	ASrc1 = SYNTHESIZED_WIRE_10;
assign	RegWrite = SYNTHESIZED_WIRE_5;
assign	pcEN = SYNTHESIZED_WIRE_0;
assign	IDMWrite = SYNTHESIZED_WIRE_31;
assign	IDMSrc = SYNTHESIZED_WIRE_28;
assign	ASrc0 = SYNTHESIZED_WIRE_2;
assign	ALUa = SYNTHESIZED_WIRE_23;
assign	ALUb = SYNTHESIZED_WIRE_25;
assign	ALUCtrl = SYNTHESIZED_WIRE_24;
assign	ALUout = SYNTHESIZED_WIRE_42;
assign	BSrc = SYNTHESIZED_WIRE_22;
assign	PCout = SYNTHESIZED_WIRE_41;
assign	RD2 = SYNTHESIZED_WIRE_9;
assign	RegSrc = SYNTHESIZED_WIRE_18;
assign	Shift = SYNTHESIZED_WIRE_44;
assign	ShiftCtrl = SYNTHESIZED_WIRE_44;
assign	Shiftin = SYNTHESIZED_WIRE_40;
assign	Shiftout = SYNTHESIZED_WIRE_4;
assign	shiftselectout = SYNTHESIZED_WIRE_11;
assign	toReg = SYNTHESIZED_WIRE_39;
assign	SYNTHESIZED_WIRE_8 = 1;
assign	SYNTHESIZED_WIRE_13 = 1;
assign	SYNTHESIZED_WIRE_26 = 1;
assign	SYNTHESIZED_WIRE_35 = 1;




PC	b2v_inst000(
	.CLK(CLK),
	.RST(RST),
	.EN(SYNTHESIZED_WIRE_0),
	.NEXT(SYNTHESIZED_WIRE_39),
	.CURRENT(SYNTHESIZED_WIRE_41));
	defparam	b2v_inst000.W = 8;


mux2	b2v_inst10(
	.select(SYNTHESIZED_WIRE_2),
	.data0(SYNTHESIZED_WIRE_40),
	.data1(SYNTHESIZED_WIRE_4),
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst10.W = 8;


REG_FILE	b2v_inst11(
	.RST(RST),
	.CLK(CLK),
	.WE3(SYNTHESIZED_WIRE_5),
	.R15(SYNTHESIZED_WIRE_39),
	.RA1(Instr[7:5]),
	.RA2(Instr[4:2]),
	.WA3(Instr[10:8]),
	.WD3(SYNTHESIZED_WIRE_39),
	.R2(R2),
	.R3(R3),
	.R6(LR),
	.RD1(SYNTHESIZED_WIRE_27),
	.RD2(SYNTHESIZED_WIRE_9),
	.RDstr(SYNTHESIZED_WIRE_33));


FLAG_REG	b2v_inst11111(
	.clk(CLK),
	.in(Z),
	.EN(FlgWrite_ALTERA_SYNTHESIZED),
	.out(zero));


control_unit	b2v_inst12(
	.RST(RST),
	.CLK(CLK),
	.Z(zero),
	.C(carry_ALTERA_SYNTHESIZED),
	.Op(Instr[15:11]),
	.IDMWrite(SYNTHESIZED_WIRE_31),
	.IRegen(SYNTHESIZED_WIRE_34),
	.IDMSrc(SYNTHESIZED_WIRE_28),
	.ASrc0(SYNTHESIZED_WIRE_2),
	.RegWrite(SYNTHESIZED_WIRE_5),
	.ASrc1(SYNTHESIZED_WIRE_10),
	.PCen(SYNTHESIZED_WIRE_0),
	.FlgWrite(FlgWrite_ALTERA_SYNTHESIZED),
	.ALUCtrl(SYNTHESIZED_WIRE_24),
	.BSrc(SYNTHESIZED_WIRE_22),
	.next_state(next_state),
	.RegSrc(SYNTHESIZED_WIRE_18),
	.Shift(SYNTHESIZED_WIRE_44),
	.state(state));
	defparam	b2v_inst12.S0 = 4'b0000;
	defparam	b2v_inst12.S1 = 4'b0001;
	defparam	b2v_inst12.S10 = 4'b1010;
	defparam	b2v_inst12.S11 = 4'b1011;
	defparam	b2v_inst12.S12 = 4'b1100;
	defparam	b2v_inst12.S13 = 4'b1101;
	defparam	b2v_inst12.S14 = 4'b1110;
	defparam	b2v_inst12.S2 = 4'b0010;
	defparam	b2v_inst12.S3 = 4'b0011;
	defparam	b2v_inst12.S4 = 4'b0100;
	defparam	b2v_inst12.S5 = 4'b0101;
	defparam	b2v_inst12.S6 = 4'b0110;
	defparam	b2v_inst12.S7 = 4'b0111;
	defparam	b2v_inst12.S8 = 4'b1000;
	defparam	b2v_inst12.S9 = 4'b1001;


FLAG_REG	b2v_inst13(
	.clk(CLK),
	.in(C),
	.EN(FlgWrite_ALTERA_SYNTHESIZED),
	.out(carry_ALTERA_SYNTHESIZED));


DATA_REG	b2v_inst14(
	.clk(CLK),
	.EN(SYNTHESIZED_WIRE_8),
	.in(SYNTHESIZED_WIRE_9),
	.out(SYNTHESIZED_WIRE_19));


mux2	b2v_inst15(
	.select(SYNTHESIZED_WIRE_10),
	.data0(SYNTHESIZED_WIRE_11),
	.data1(SYNTHESIZED_WIRE_41),
	.out(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst15.W = 8;


DATA_REG	b2v_inst17(
	.clk(CLK),
	.EN(SYNTHESIZED_WIRE_13),
	.in(SYNTHESIZED_WIRE_42),
	.out(SYNTHESIZED_WIRE_15));


mux4	b2v_inst18(
	.D0(SYNTHESIZED_WIRE_15),
	.D1(SYNTHESIZED_WIRE_43),
	.D2(SYNTHESIZED_WIRE_42),
	.D3(Instr[7:0]),
	.select(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst18.W = 8;


mux4	b2v_inst19(
	.D0(SYNTHESIZED_WIRE_19),
	.D1(SYNTHESIZED_WIRE_20),
	.D2(SYNTHESIZED_WIRE_43),
	
	.select(SYNTHESIZED_WIRE_22),
	.out(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst19.W = 8;


ALU	b2v_inst2(
	.A(SYNTHESIZED_WIRE_23),
	.ALUCtrl(SYNTHESIZED_WIRE_24),
	.B(SYNTHESIZED_WIRE_25),
	.co(C),
	.z(Z),
	.out(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst2.W = 8;


DATA_REG	b2v_inst21(
	.clk(CLK),
	.EN(SYNTHESIZED_WIRE_26),
	.in(SYNTHESIZED_WIRE_27),
	.out(SYNTHESIZED_WIRE_40));





mux2	b2v_inst3(
	.select(SYNTHESIZED_WIRE_28),
	.data0(SYNTHESIZED_WIRE_41),
	.data1(SYNTHESIZED_WIRE_39),
	.out(SYNTHESIZED_WIRE_32));
	defparam	b2v_inst3.W = 8;


IDM	b2v_inst4(
	.clk(CLK),
	.WE(SYNTHESIZED_WIRE_31),
	.A(SYNTHESIZED_WIRE_32),
	.WD(SYNTHESIZED_WIRE_33),
	.out(IDM));


INST_REG	b2v_inst5(
	.clk(CLK),
	.EN(SYNTHESIZED_WIRE_34),
	.in(IDM),
	.out(Instr));


DATA_REG	b2v_inst6(
	.clk(CLK),
	.EN(SYNTHESIZED_WIRE_35),
	.in(IDM[7:0]),
	.out(SYNTHESIZED_WIRE_43));



CONSTANT	b2v_inst8(
	.bus_in(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst8.V = 1;
	defparam	b2v_inst8.W = 8;


SHIFT	b2v_inst9(
	.control(SYNTHESIZED_WIRE_44),
	.data(SYNTHESIZED_WIRE_40),
	.out(SYNTHESIZED_WIRE_4));

assign	zeroflag = zero;
assign	CLK = clock;
assign	RST = reset;
assign	carry = carry_ALTERA_SYNTHESIZED;
assign	FlgWrite = FlgWrite_ALTERA_SYNTHESIZED;
assign	FetchedInst = IDM;
assign	Inst = Instr;
assign	regadr1[2:0] = Instr[7:5];
assign	regadr2[2:0] = Instr[4:2];
assign	wa[2:0] = Instr[10:8];

endmodule
