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
// CREATED		"Tue Mar 27 22:45:41 2018"

module datapath(
	reset,
	clock,
	loadorincrload,
	aluoutselect,
	sonmuilk2islemmi,
	ps1sonra0,
	input1,
	outr1
);


input wire	reset;
input wire	clock;
input wire	loadorincrload;
input wire	aluoutselect;
input wire	sonmuilk2islemmi;
input wire	ps1sonra0;
input wire	[7:0] input1;
output wire	[7:0] outr1;

wire	[7:0] out;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[2:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[0:0] SYNTHESIZED_WIRE_6;
wire	[0:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[0:0] SYNTHESIZED_WIRE_12;
wire	[0:0] SYNTHESIZED_WIRE_13;





alu	b2v_inst(
	.A(SYNTHESIZED_WIRE_0),
	.B(SYNTHESIZED_WIRE_1),
	.control(SYNTHESIZED_WIRE_2),
	
	
	
	
	.out(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst.W = 8;


constant_value_generator	b2v_inst10(
	.data_out_bus(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst10.D = 1;
	defparam	b2v_inst10.W = 1;


constant_value_generator	b2v_inst11(
	.data_out_bus(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst11.D = 0;
	defparam	b2v_inst11.W = 1;


constant_value_generator	b2v_inst111(
	.data_out_bus(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst111.D = 0;
	defparam	b2v_inst111.W = 8;


mux_2to1	b2v_inst119(
	.select(sonmuilk2islemmi),
	.D1(SYNTHESIZED_WIRE_3),
	.D2(SYNTHESIZED_WIRE_4),
	.O(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst119.W = 8;


constant_value_generator	b2v_inst2(
	.data_out_bus(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst2.D = 0;
	defparam	b2v_inst2.W = 3;


constant_value_generator	b2v_inst244(
	.data_out_bus(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst244.D = 1;
	defparam	b2v_inst244.W = 8;


constant_value_generator	b2v_inst3(
	.data_out_bus(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst3.D = 0;
	defparam	b2v_inst3.W = 1;


constant_value_generator	b2v_inst4(
	.data_out_bus(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst4.D = 0;
	defparam	b2v_inst4.W = 1;


demultiplexer1_2	b2v_inst44(
	.sel(aluoutselect),
	.din(SYNTHESIZED_WIRE_5),
	.dout1(SYNTHESIZED_WIRE_3),
	.dout2(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst44.W = 8;


shift_reg	b2v_inst5(
	.S(SYNTHESIZED_WIRE_6),
	.reset(reset),
	.psload(ps1sonra0),
	.lrshift(SYNTHESIZED_WIRE_7),
	.clk(clock),
	.D(SYNTHESIZED_WIRE_8),
	.out(out));
	defparam	b2v_inst5.W = 8;


simple_reg	b2v_inst6(
	.reset(reset),
	.clk(clock),
	.D(SYNTHESIZED_WIRE_9),
	.out(outr1));
	defparam	b2v_inst6.W = 8;


simple_reg	b2v_inst7(
	.reset(reset),
	.clk(clock),
	.D(input1),
	.out(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst7.W = 8;


mux_2to1	b2v_inst8(
	.select(loadorincrload),
	.D1(SYNTHESIZED_WIRE_10),
	.D2(SYNTHESIZED_WIRE_11),
	.O(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst8.W = 8;


shift_reg	b2v_inst9(
	.S(out[7]),
	.reset(reset),
	.psload(SYNTHESIZED_WIRE_12),
	.lrshift(SYNTHESIZED_WIRE_13),
	.clk(clock),
	
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst9.W = 8;


endmodule
