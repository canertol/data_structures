module Test_singleCycle();

	reg clk, rst;
	wire CO, OVF, Z, N;
	
	singleCycle DUT(clk, rst, CO, OVF, Z, N);
	
	
	initial begin 
		clk=0;
		forever #20 clk=~clk;
	end
	initial begin
		rst=1;
		#120;
		rst=0;
	end

	
endmodule 