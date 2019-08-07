module Test_decoder_2to4();

	wire Y3, Y2, Y1, Y0;
	reg a0, a1;
	reg [5:0] memory [3:0];
	
	decoder_2to4 DUT(a0, a1, Y0, Y1, Y2, Y3);
	
	integer j;
	
	initial begin
	
	$readmemb("C:/Users/mc_fe/Desktop/EE446-Verilog-Modules/testVectors/test_decoder_2to4.tv", memory);
	
	#1000;
	
	end
	
	always @(*)
	begin
		for (j=0; j<4; j=j+1)
			begin
			{a1,a0} = memory[j][5:4];
			#10;

			if({Y3, Y2, Y1, Y0} != memory[j][3:0])
				$display("Error in %1d%1d case",a1, a0);
			else
				$display("No error in %1d%1d case",a1, a0);
			
			#10;
			end
	end
	
endmodule
