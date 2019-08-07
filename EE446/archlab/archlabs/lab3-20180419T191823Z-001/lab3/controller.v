/*
* Ferhat Can ATAMAN 2030112
* 17/04/2018 Tuesday
*/

module controller
	(  input wire  clk,reset,
		input wire 	[31:0] Instr,
		input wire 	CO, N, Z, OVF,
		output wire WriteEnable,
		output reg 	PCsrc, shiftLR, 
		output wire RegWrite, 
		output wire ImmSrc,
		output wire [1:0] MemtoReg,
		output wire ALUSrcB, RegSrc,
		output reg 	[2:0] ALUControl,
		output wire [3:0] Flags);
		
		
	reg  NoWrite, FlagWrite;
	wire RegW, ALUOp;
	reg  [7:0] controls;
	wire [5:0] Funct;
	wire [1:0] Op;
	wire [3:0] Rd;
	wire [3:0] ALUFlags;
	
	assign ALUFlags 	= {N,Z,CO,OVF};
	assign Funct 		= Instr[25:20];
	assign Op 			= Instr[27:26];
	assign Rd 			= Instr[15:12];
	
	simpleRegWE #(2) flagreg1(clk, reset, ALUFlags[3:2], FlagWrite, Flags[3:2]);
	simpleRegWE #(2) flagreg0(clk, reset, ALUFlags[1:0], FlagWrite, Flags[1:0]);
	
	//Main Decoder
	always @(*) 
	begin
		case(Op)
			2'b00:
				begin
					if(Instr[25] == 1'b1) // LSL,LSR
						controls = 8'b10110101; //Data processing instructions with no immediate source
					else //ADD,SUB,AND,ORR,CMP
						controls = 8'bx0001101;
				
				end
			2'b01: 
				begin
					if(Funct[0] == 1'b1) 
						controls = 8'b0x100100; //LDR instruction
					else
						controls = 8'b011xx010; //STR instruction
				end
			default: controls = 8'bx;
			
		endcase
	end
	
	assign {ImmSrc, RegSrc, ALUSrcB, MemtoReg, RegW, WriteEnable, ALUOp} = controls;
	assign RegWrite = RegW & (~NoWrite);
	
	//ALU decoder
	always @(*)
	begin
		if(ALUOp == 1'b1)
		begin
			case(Funct[4:1])
				4'b0100: begin //ADD
					ALUControl 	= 3'b000; 
					NoWrite 		= 0;
					FlagWrite	= 1;
					end
				4'b0010: begin //SUB
					ALUControl 	= 3'b001; 
					NoWrite 		= 0;
					FlagWrite 	= 1;
				end
				4'b0000: begin //AND
					ALUControl 	= 3'b100; 
					NoWrite 		= 0;
					FlagWrite 	= 1;
				end
				4'b1100: begin //ORR
					ALUControl 	= 3'b101; 
					NoWrite 		= 0;
					FlagWrite 	= 1;
				end
				4'b1010: begin //CMP
					ALUControl 	= 3'b001; 
					NoWrite 		= 1;
					FlagWrite 	= 1;
				end
				4'b1101: begin //LSL,LSR
					ALUControl 	= 3'b000;
					NoWrite 		= 0;
					FlagWrite 	= 0;
					if(Instr[6:5] == 2'b00) //LSL
						shiftLR = 0;
					else if(Instr[6:5] == 2'b01) //LSR
						shiftLR = 1'b1;
				end
				default: begin
					ALUControl = 3'bx;
					NoWrite	  = 1'bx;
					FlagWrite  = 1'bx;
				end
			endcase
		end else begin
			ALUControl 	= 3'b000; //Non DP Instuctions
			FlagWrite	= 0; // Don't Update Flags
			NoWrite 		= 0;
		end
	end
	
	//PC Logic
	always @* begin
		PCsrc = (Rd == 4'b1111) & RegW;
	end
	
endmodule 