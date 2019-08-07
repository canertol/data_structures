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
// CREATED		"Sat May 05 14:53:08 2018"

module multicycle(
	pcwrite,
	adrsrc,
	memwrite,
	irwrite,
	regwrite,
	alusrca,
	alusrcb,
	clk,
	shiftop,
	alucontrol,
	resultsrc,
	shifter,
	aluout,
	dallanma,
	fetchedinst,
	outpc1,
	r2,
	reg1out,
	reg2out,
	regadres1,
	regadres2,
	wa
);


input wire	pcwrite;
input wire	adrsrc;
input wire	memwrite;
input wire	irwrite;
input wire	regwrite;
input wire	alusrca;
input wire	alusrcb;
input wire	clk;
input wire	shiftop;
input wire	[1:0] alucontrol;
input wire	[1:0] resultsrc;
input wire	[2:0] shifter;
output wire	[7:0] aluout;
output wire	[15:0] dallanma;
output wire	[15:0] fetchedinst;
output wire	[7:0] outpc1;
output wire	[7:0] r2;
output wire	[7:0] reg1out;
output wire	[7:0] reg2out;
output wire	[2:0] regadres1;
output wire	[2:0] regadres2;
output wire	[2:0] wa;

wire	[15:0] b;
wire	[15:0] ri;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[0:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[0:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[0:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[0:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_28;
wire	[7:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[7:0] SYNTHESIZED_WIRE_17;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[7:0] SYNTHESIZED_WIRE_24;

assign	aluout = SYNTHESIZED_WIRE_28;
assign	outpc1 = SYNTHESIZED_WIRE_27;
assign	reg1out = SYNTHESIZED_WIRE_30;
assign	reg2out = SYNTHESIZED_WIRE_9;




pcountreg	b2v_inst(
	.clk(clk),
	.enable(pcwrite),
	.a(SYNTHESIZED_WIRE_26),
	.b(SYNTHESIZED_WIRE_27));


datareg	b2v_inst10(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_1),
	.a(ri[7:0]),
	.b(SYNTHESIZED_WIRE_19));


registerfile	b2v_inst11(
	.clk(clk),
	.we3(regwrite),
	.r15(SYNTHESIZED_WIRE_26),
	.ra1(b[7:5]),
	.ra2(b[4:2]),
	.wa3(b[10:8]),
	.wd3(SYNTHESIZED_WIRE_26),
	.r2(r2),
	
	
	
	
	.rd1(SYNTHESIZED_WIRE_30),
	.rd2(SYNTHESIZED_WIRE_9));


mux_2to1	b2v_inst12(
	.select(adrsrc),
	.D1(SYNTHESIZED_WIRE_27),
	.D2(SYNTHESIZED_WIRE_26),
	.O(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst12.W = 8;


constant_value_generator	b2v_inst13(
	.data_out_bus(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst13.D = 1;
	defparam	b2v_inst13.W = 1;


datareg	b2v_inst14(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_6),
	.a(SYNTHESIZED_WIRE_7),
	.b(SYNTHESIZED_WIRE_10));


constant_value_generator	b2v_inst15(
	.data_out_bus(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst15.D = 1;
	defparam	b2v_inst15.W = 1;


datareg	b2v_inst16(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_8),
	.a(SYNTHESIZED_WIRE_9),
	.b(SYNTHESIZED_WIRE_29));


mux_2to1	b2v_inst17(
	.select(alusrca),
	.D1(SYNTHESIZED_WIRE_10),
	.D2(SYNTHESIZED_WIRE_27),
	.O(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst17.W = 8;


datareg	b2v_inst18(
	.clk(clk),
	.enable(SYNTHESIZED_WIRE_12),
	.a(SYNTHESIZED_WIRE_28),
	.b(SYNTHESIZED_WIRE_18));


mux_2to1	b2v_inst19(
	.select(alusrcb),
	.D1(SYNTHESIZED_WIRE_29),
	.D2(SYNTHESIZED_WIRE_15),
	.O(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst19.W = 8;


constant_value_generator	b2v_inst20(
	.data_out_bus(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst20.D = 1;
	defparam	b2v_inst20.W = 8;


alu	b2v_inst21(
	.A(SYNTHESIZED_WIRE_16),
	.B(SYNTHESIZED_WIRE_17),
	.control(alucontrol),
	
	
	
	
	.out(SYNTHESIZED_WIRE_28));
	defparam	b2v_inst21.W = 8;


mux_4to1	b2v_inst22(
	.D1(SYNTHESIZED_WIRE_18),
	.D2(SYNTHESIZED_WIRE_19),
	.D3(SYNTHESIZED_WIRE_28),
	
	.select(resultsrc),
	.O(SYNTHESIZED_WIRE_26));
	defparam	b2v_inst22.W = 8;


shifter_arm	b2v_inst23(
	.control(shifter),
	.data(SYNTHESIZED_WIRE_30),
	.out(SYNTHESIZED_WIRE_23));


mux_2to1	b2v_inst24(
	.select(shiftop),
	.D1(SYNTHESIZED_WIRE_30),
	.D2(SYNTHESIZED_WIRE_23),
	.O(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst24.W = 8;


datamem	b2v_inst4(
	.clk(clk),
	.we(memwrite),
	.a(SYNTHESIZED_WIRE_24),
	.wd(SYNTHESIZED_WIRE_29),
	.ri(ri));


pcreg	b2v_inst7(
	.clk(clk),
	.enable(irwrite),
	.a(ri),
	.b(b));


constant_value_generator	b2v_inst9(
	.data_out_bus(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst9.D = 1;
	defparam	b2v_inst9.W = 1;


constant_value_generator	b2v_inst99(
	.data_out_bus(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst99.D = 1;
	defparam	b2v_inst99.W = 1;

assign	dallanma = b;
assign	fetchedinst = ri;
assign	regadres1[2:0] = b[7:5];
assign	regadres2[2:0] = b[4:2];
assign	wa[2:0] = b[10:8];

endmodule
