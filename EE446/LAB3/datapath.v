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
// CREATED		"Sun Mar 24 17:07:35 2019"

module datapath(
	CLK,
	PCSrc,
	RegWrite,
	MemtoReg,
	RegSrc,
	ALUSrc,
	Shift,
	MemWrite,
	ALUControl,
	ImmSrc,
	ALUFlags,
	dataA,
	dataRead,
	Inst,
	RFread,
	RFreadtwo,
	writedata
);


input wire	CLK;
input wire	PCSrc;
input wire	RegWrite;
input wire	MemtoReg;
input wire	RegSrc;
input wire	ALUSrc;
input wire	Shift;
input wire	MemWrite;
input wire	[1:0] ALUControl;
input wire	[1:0] ImmSrc;
output wire	[3:0] ALUFlags;
output wire	[31:0] dataA;
output wire	[31:0] dataRead;
output wire	[31:0] Inst;
output wire	[31:0] RFread;
output wire	[31:0] RFreadtwo;
output wire	[31:0] writedata;

wire	[3:0] ALUFlags_ALTERA_SYNTHESIZED;
wire	[31:0] Instr;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_16;

assign	dataA = SYNTHESIZED_WIRE_23;
assign	dataRead = SYNTHESIZED_WIRE_2;
assign	RFread = SYNTHESIZED_WIRE_3;
assign	RFreadtwo = SYNTHESIZED_WIRE_25;
assign	writedata = SYNTHESIZED_WIRE_25;




PC	b2v_inst0(
	.CLK(CLK),
	.NEXT(SYNTHESIZED_WIRE_0),
	.CURRENT(SYNTHESIZED_WIRE_28));
	defparam	b2v_inst0.W = 32;


busmux_0	b2v_inst11(
	.sel(MemtoReg),
	.dataa(SYNTHESIZED_WIRE_23),
	.datab(SYNTHESIZED_WIRE_2),
	.result(SYNTHESIZED_WIRE_26));


busmux_1	b2v_inst12(
	.sel(RegSrc),
	.dataa(Instr[3:0]),
	.datab(Instr[15:12]),
	.result(SYNTHESIZED_WIRE_11));


ALU	b2v_inst13(
	.A(SYNTHESIZED_WIRE_3),
	.ALUControl(ALUControl),
	.B(SYNTHESIZED_WIRE_24),
	.C(ALUFlags_ALTERA_SYNTHESIZED[0]),
	.O(ALUFlags_ALTERA_SYNTHESIZED[1]),
	.Z(ALUFlags_ALTERA_SYNTHESIZED[2]),
	.N(ALUFlags_ALTERA_SYNTHESIZED[3]),
	.out(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst13.W = 32;


busmux_2	b2v_inst14(
	.sel(ALUSrc),
	.dataa(SYNTHESIZED_WIRE_5),
	.datab(SYNTHESIZED_WIRE_6),
	.result(SYNTHESIZED_WIRE_24));


SHIFT	b2v_inst15(
	.control(Instr[11:5]),
	.in(SYNTHESIZED_WIRE_25),
	.out(SYNTHESIZED_WIRE_5));


busmux_3	b2v_inst16(
	.sel(Shift),
	.dataa(SYNTHESIZED_WIRE_8),
	.datab(SYNTHESIZED_WIRE_24),
	.result(SYNTHESIZED_WIRE_23));


CONSTANT	b2v_inst18(
	.bus_in(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst18.V = 8'b00000100;
	defparam	b2v_inst18.W = 32;


CONSTANT	b2v_inst19(
	.bus_in(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst19.V = 8'b00000100;
	defparam	b2v_inst19.W = 32;


REG_FILE	b2v_inst2(
	.CLK(CLK),
	.WE3(RegWrite),
	.R15(SYNTHESIZED_WIRE_10),
	.RA1(Instr[19:16]),
	.RA2(SYNTHESIZED_WIRE_11),
	.WA3(Instr[15:12]),
	.WD3(SYNTHESIZED_WIRE_26),
	.RD1(SYNTHESIZED_WIRE_3),
	.RD2(SYNTHESIZED_WIRE_25));


EXTEND	b2v_inst3(
	.ImmSrc(ImmSrc),
	.Instr(Instr[23:0]),
	.ExtImm(SYNTHESIZED_WIRE_6));


ADDER	b2v_inst5(
	.a(SYNTHESIZED_WIRE_13),
	.b(SYNTHESIZED_WIRE_27),
	.y(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst5.W = 32;


ADDER	b2v_inst6(
	.a(SYNTHESIZED_WIRE_28),
	.b(SYNTHESIZED_WIRE_16),
	.y(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst6.W = 32;


DATA_MEM	b2v_inst7(
	.CLK(CLK),
	.WE(MemWrite),
	.A(SYNTHESIZED_WIRE_23),
	.WD(SYNTHESIZED_WIRE_25),
	.RD(SYNTHESIZED_WIRE_2));


busmux_4	b2v_inst8(
	.sel(PCSrc),
	.dataa(SYNTHESIZED_WIRE_27),
	.datab(SYNTHESIZED_WIRE_26),
	.result(SYNTHESIZED_WIRE_0));


INST_MEM	b2v_MEM(
	.A(SYNTHESIZED_WIRE_28),
	.RD(Instr));

assign	ALUFlags = ALUFlags_ALTERA_SYNTHESIZED;
assign	Inst = Instr;

endmodule

module busmux_0(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_1(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [3:0] dataa;
input [3:0] datab;
output [3:0] result;

endmodule

module busmux_2(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_3(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_4(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule
