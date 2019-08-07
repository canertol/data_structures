// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.2 Build 153 07/15/2015 SJ Web Edition"
// CREATED		"Mon May 14 23:01:18 2018"

module multicycle(
	clk,
	resetpc,
	zeroflag,
	aluin1,
	aluin2,
	aluout,
	dallanma,
	fetchedinst,
	outpc1,
	r2,
	r3,
	reg1out,
	reg2out,
	regadres1,
	regadres2,
	regyolu,
	shiftercontrol,
	shifterin,
	shifterout,
	shiftselectout,
	wa
);


input wire	clk;
input wire	resetpc;
output wire	zeroflag;
output wire	[7:0] aluin1;
output wire	[7:0] aluin2;
output wire	[7:0] aluout;
output wire	[15:0] dallanma;
output wire	[15:0] fetchedinst;
output wire	[7:0] outpc1;
output wire	[7:0] r2;
output wire	[7:0] r3;
output wire	[7:0] reg1out;
output wire	[7:0] reg2out;
output wire	[2:0] regadres1;
output wire	[2:0] regadres2;
output wire	[7:0] regyolu;
output wire	[2:0] shiftercontrol;
output wire	[7:0] shifterin;
output wire	[7:0] shifterout;
output wire	[7:0] shiftselectout;
output wire	[2:0] wa;

wire	[15:0] b;
wire	[15:0] ri;
wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_42;
wire	[0:0] SYNTHESIZED_WIRE_2;
wire	[0:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[0:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_43;
wire	[0:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[0:0] SYNTHESIZED_WIRE_17;
wire	[7:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	[7:0] SYNTHESIZED_WIRE_22;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[2:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[1:0] SYNTHESIZED_WIRE_28;
wire	[2:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	[0:0] SYNTHESIZED_WIRE_34;
wire	[7:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	[7:0] SYNTHESIZED_WIRE_38;
wire	[7:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;

assign	zeroflag = SYNTHESIZED_WIRE_36;
assign	aluin1 = SYNTHESIZED_WIRE_22;
assign	aluin2 = SYNTHESIZED_WIRE_23;
assign	aluout = SYNTHESIZED_WIRE_44;
assign	outpc1 = SYNTHESIZED_WIRE_43;
assign	reg1out = SYNTHESIZED_WIRE_45;
assign	reg2out = SYNTHESIZED_WIRE_13;
assign	regyolu = SYNTHESIZED_WIRE_42;
assign	shiftercontrol = SYNTHESIZED_WIRE_29;
assign	shifterin = SYNTHESIZED_WIRE_45;
assign	shifterout = SYNTHESIZED_WIRE_33;
assign	shiftselectout = SYNTHESIZED_WIRE_15;




pcountreg	b2v_inst(
	.reset(resetpc),
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_0),
	.a(SYNTHESIZED_WIRE_42),
	.b(SYNTHESIZED_WIRE_43));


multi_controller	b2v_inst1(
	.CLK(clk),
	.Reset(SYNTHESIZED_WIRE_2),
	.zero(SYNTHESIZED_WIRE_3),
	.carry(SYNTHESIZED_WIRE_4),
	.Opcode(b[15:11]),
	.pcwrite(SYNTHESIZED_WIRE_0),
	.adrsrc(SYNTHESIZED_WIRE_9),
	.memwrite(SYNTHESIZED_WIRE_37),
	.irwrite(SYNTHESIZED_WIRE_40),
	.regwrite(SYNTHESIZED_WIRE_6),
	.shiftop(SYNTHESIZED_WIRE_31),
	.alusrca(SYNTHESIZED_WIRE_14),
	.alusrcb(SYNTHESIZED_WIRE_19),
	.alucontrol(SYNTHESIZED_WIRE_24),
	.resultsrc(SYNTHESIZED_WIRE_28),
	.shifter(SYNTHESIZED_WIRE_29));
	defparam	b2v_inst1.S0 = 4'b0000;
	defparam	b2v_inst1.S1 = 4'b0001;
	defparam	b2v_inst1.S10 = 4'b1010;
	defparam	b2v_inst1.S11 = 4'b1011;
	defparam	b2v_inst1.S12 = 4'b1100;
	defparam	b2v_inst1.S13 = 4'b1101;
	defparam	b2v_inst1.S14 = 4'b1110;
	defparam	b2v_inst1.S2 = 4'b0010;
	defparam	b2v_inst1.S3 = 4'b0011;
	defparam	b2v_inst1.S4 = 4'b0100;
	defparam	b2v_inst1.S5 = 4'b0101;
	defparam	b2v_inst1.S6 = 4'b0110;
	defparam	b2v_inst1.S7 = 4'b0111;
	defparam	b2v_inst1.S8 = 4'b1000;
	defparam	b2v_inst1.S9 = 4'b1001;


datareg	b2v_inst10(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_5),
	.a(ri[7:0]),
	.b(SYNTHESIZED_WIRE_26));


registerfile	b2v_inst11(
	.clk(clk),
	.we3(SYNTHESIZED_WIRE_6),
	.r15(SYNTHESIZED_WIRE_42),
	.ra1(b[7:5]),
	.ra2(b[4:2]),
	.wa3(b[10:8]),
	.wd3(SYNTHESIZED_WIRE_42),
	.r2(r2),
	.r3(r3),
	
	
	
	.rd1(SYNTHESIZED_WIRE_35),
	.rd2(SYNTHESIZED_WIRE_13),
	.rdstore(SYNTHESIZED_WIRE_39));


mux_2to1	b2v_inst12(
	.select(SYNTHESIZED_WIRE_9),
	.D1(SYNTHESIZED_WIRE_43),
	.D2(SYNTHESIZED_WIRE_42),
	.O(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst12.W = 8;


constant_value_generator	b2v_inst15(
	.data_out_bus(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst15.D = 1;
	defparam	b2v_inst15.W = 1;


datareg	b2v_inst16(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_12),
	.a(SYNTHESIZED_WIRE_13),
	.b(SYNTHESIZED_WIRE_20));


mux_2to1	b2v_inst17(
	.select(SYNTHESIZED_WIRE_14),
	.D1(SYNTHESIZED_WIRE_15),
	.D2(SYNTHESIZED_WIRE_43),
	.O(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst17.W = 8;


datareg	b2v_inst18(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_17),
	.a(SYNTHESIZED_WIRE_44),
	.b(SYNTHESIZED_WIRE_25));


mux_2to1	b2v_inst19(
	.select(SYNTHESIZED_WIRE_19),
	.D1(SYNTHESIZED_WIRE_20),
	.D2(SYNTHESIZED_WIRE_21),
	.O(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst19.W = 8;


constant_value_generator	b2v_inst2(
	.data_out_bus(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst2.D = 0;
	defparam	b2v_inst2.W = 1;


constant_value_generator	b2v_inst20(
	.data_out_bus(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst20.D = 1;
	defparam	b2v_inst20.W = 8;


alu	b2v_inst21(
	.A(SYNTHESIZED_WIRE_22),
	.B(SYNTHESIZED_WIRE_23),
	.control(SYNTHESIZED_WIRE_24),
	.co(SYNTHESIZED_WIRE_4),
	
	.z(SYNTHESIZED_WIRE_36),
	
	.out(SYNTHESIZED_WIRE_44));
	defparam	b2v_inst21.W = 8;


mux_4to1	b2v_inst22(
	.D1(SYNTHESIZED_WIRE_25),
	.D2(SYNTHESIZED_WIRE_26),
	.D3(SYNTHESIZED_WIRE_44),
	.D4(b[7:0]),
	.select(SYNTHESIZED_WIRE_28),
	.O(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst22.W = 8;


shifter_arm	b2v_inst23(
	.control(SYNTHESIZED_WIRE_29),
	.data(SYNTHESIZED_WIRE_45),
	.out(SYNTHESIZED_WIRE_33));


mux_2to1	b2v_inst24(
	.select(SYNTHESIZED_WIRE_31),
	.D1(SYNTHESIZED_WIRE_45),
	.D2(SYNTHESIZED_WIRE_33),
	.O(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst24.W = 8;


datareg	b2v_inst25(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_34),
	.a(SYNTHESIZED_WIRE_35),
	.b(SYNTHESIZED_WIRE_45));


constant_value_generator	b2v_inst26(
	.data_out_bus(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst26.D = 1;
	defparam	b2v_inst26.W = 1;


simple_reg	b2v_inst3(
	
	.clk(clk),
	.D(SYNTHESIZED_WIRE_36),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst3.W = 1;


datamem	b2v_inst4(
	.clk(clk),
	.we(SYNTHESIZED_WIRE_37),
	.a(SYNTHESIZED_WIRE_38),
	.wd(SYNTHESIZED_WIRE_39),
	.ri(ri));


pcreg	b2v_inst7(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_40),
	.a(ri),
	.b(b));


constant_value_generator	b2v_inst9(
	.data_out_bus(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst9.D = 1;
	defparam	b2v_inst9.W = 1;


constant_value_generator	b2v_inst99(
	.data_out_bus(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst99.D = 1;
	defparam	b2v_inst99.W = 1;

assign	dallanma = b;
assign	fetchedinst = ri;
assign	regadres1[2:0] = b[7:5];
assign	regadres2[2:0] = b[4:2];
assign	wa[2:0] = b[10:8];

endmodule
