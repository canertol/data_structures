module instructionMem
	( input wire [31:0] adr, 
	  output wire [31:0] inst);
	  
	 reg[31:0] RAM[63:0]; 
	  
	 initial begin
		$readmemb("C:/Users/mc_fe/Desktop/lab3/instructions.txt",RAM);
		#100;
	 end
	 assign inst = RAM[adr[31:2]];//pc should be multiples of 4
endmodule 