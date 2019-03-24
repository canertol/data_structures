module DATA_MEM(input CLK,
					 input WE,
				 	 input [31:0] A,
					 input [31:0] WD,
					 output wire [31:0] RD);
					 
	reg [31:0] DATA[63:0];
	
	
	always @(posedge CLK)				// Sequantial Write
		if (WE) DATA[A] <= WD;
		
	assign RD = DATA[A];			// Combinational read

endmodule