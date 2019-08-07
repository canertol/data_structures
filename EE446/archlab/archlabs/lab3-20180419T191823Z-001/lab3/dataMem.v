module dataMem
	( input wire clk, WE,
	  input wire [31:0] adress, writeData,
	  output wire [31:0] ReadData);
	  
	 reg [7:0] RAM [255:0]; //256 byte memory
	 
	 assign ReadData = {RAM[adress[31:0] + 3], RAM[adress[31:0] + 2], RAM[adress[31:0] + 1], RAM[adress[31:0] + 0]};
	 
	 initial begin
		$readmemh("C:/Users/mc_fe/Desktop/lab3/datamemory.txt", RAM);
		#100;
	 end
	 
	 always @(posedge clk)
	 begin
		if(WE == 1'b1)
			{RAM[adress[31:0] + 3], RAM[adress[31:0] + 2], RAM[adress[31:0] + 1], RAM[adress[31:0] + 0]} <= writeData;
	 end
endmodule 