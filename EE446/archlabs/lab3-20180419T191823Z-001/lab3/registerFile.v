module registerFile
	#(parameter W = 32)
	( input wire clk, rst, WE3, 
	  input wire [3:0] RA1, RA2, WA3,
	  input wire [W-1:0] WD3, R15,
	  output wire [W-1:0] RD1, RD2);
	
	reg [W-1:0] rf[14:0];
	
	assign RD1 = (RA1 == 4'b1111) ? R15 : rf[RA1];
	assign RD2 = (RA2 == 4'b1111) ? R15 : rf[RA2];
	
	always @(posedge clk)
	begin
		if(rst == 1'b1) begin
			rf[0]   <= 0;
			rf[1]   <= 0;
			rf[2]   <= 0;
			rf[3]   <= 0;
			rf[4]   <= 0;
			rf[5]   <= 0;
			rf[6]   <= 0;
			rf[7]   <= 0;
			rf[8]   <= 0;
			rf[9]   <= 0;
			rf[10]  <= 0;
			rf[11]  <= 0;
			rf[12]  <= 0;
			rf[13]  <= 0;
			rf[14]  <= 0;
			rf[15]  <= 0;
		end else if(WE3 == 1'b1)
			rf[WA3] <= WD3;
	
	end
endmodule 