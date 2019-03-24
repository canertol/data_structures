module REG_FILE(input CLK,
					 input WE3,
				 	 input [3:0] RA1, RA2, WA3,
					 input [31:0] WD3, R15,
					 output wire [31:0] RD1, RD2);
					 
	reg [31:0] RF[14:0];
	
	
	always @(posedge CLK)				// Sequantial Write
		if (WE3) RF[WA3] <= WD3;
		
	assign RD1 = (RA1 == 4'b1111) ? R15 : RF[RA1];	// Combinational Read
	assign RD2 = (RA2 == 4'b1111) ? R15 : RF[RA2];

endmodule