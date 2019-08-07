module Test_mux_2to1
	#(parameter WIDTH = 8)
	();

	wire [WIDTH-1:0] out;
	reg [WIDTH-1:0] in0, in1;
	reg sel;
	
	reg [24:0] memory [1:0];
	
	mux_2to1 DUT(in0, in1, out, sel);
	
	integer j;
	
	initial begin
	
	$readmemb("C:/Users/mc_fe/Desktop/EE446-Verilog-Modules/testVectors/test_mux_2to1.txt", memory);
	
	#1000;
	
	end
	
	always @(*)
	begin
		for (j=0; j<2; j=j+1)
			begin
			in0 = memory[j][24:17];
			in1 = memory[j][16:9];
			sel = memory[j][8];
			#10;

			if(out != memory[j][7:0])
				$display("Error in %1d case",sel);
			else
				$display("No error in %1d case",sel);
			
			#10;
			end
	end
	
endmodule
