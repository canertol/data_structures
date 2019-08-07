module singleCycle
	( input wire clk, rst,
	  output wire CO, OVF, Z, N);
	  
	  wire [3:0] Flags;
	  
	  assign N 		= Flags[3];
	  assign Z 		= Flags[2];
	  assign CO 	= Flags[1];
	  assign OVF 	= Flags[0];
	  
	  wire [31:0] ReadData, Instr;
	  wire [31:0] WriteData, AluResult, PC;
	  wire WriteEnable;
	  
	  
	  arm arm1( clk, rst,
					ReadData, Instr,
					WriteData, AluResult, PC,
					Flags,
					WriteEnable);
		
	  instructionMem imem( PC, Instr);
							 
	  dataMem dmem( clk, WriteEnable,
						 AluResult, WriteData,
						 ReadData);
				  
	  
	  
endmodule 