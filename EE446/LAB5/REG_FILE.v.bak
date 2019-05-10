module REG_FILE(input RST,CLK,
					 input WE3,
				 	 input [3:0] RA1, RA2, WA3,
					 input [31:0] WD3, R15,
					 output wire [31:0] RD1, RD2);//, R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R_10,R_11,R_12,R_13,R_14,R_15);
					 
	reg [31:0] RF[14:0];
	integer i;
	
	always @(posedge CLK)			
		// Sequantial Write
		begin
		if (WE3) RF[WA3] <= WD3;
		if(RST==1)  for (i=0; i<15; i=i+1) RF[i] <= 32'b0;
		end
		
	assign RD1 = (RA1 == 4'b1111) ? R15 : RF[RA1];	// Combinational Read
	assign RD2 = (RA2 == 4'b1111) ? R15 : RF[RA2];
/*	assign R0 = RF[0];
	assign R1 = RF[1];
	assign R2 = RF[2];
	assign R3 = RF[3];
	assign R4 = RF[4];
	assign R5 = RF[5];
	assign R6 = RF[6];
	assign R7 = RF[7];
	assign R8 = RF[8];
	assign R9 = RF[9];
	assign R_10 = RF[10];
	assign R_11 = RF[11];
	assign R_12 = RF[12];
	assign R_13 = RF[13];
	assign R_14 = RF[14];
	assign R_15 = R15;*/

endmodule