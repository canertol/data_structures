module test_alu();

 wire [7:0]Y1;
 wire carry,overflow,zero,neg;
 
 reg [7:0]A;
 reg [7:0]B;
 reg [2:0]control;
 reg [30:0] memory [3:0];
 
 alu DUT(A,B,control,Y1,carry,overflow,zero,neg);
 integer j;
	initial begin
	
	$readmemb("vector_alu.tv", memory);
	
	#1000;
	
	end

 always @(*)
 	begin
		for (j=0; j<4; j=j+1)
			begin
			{A,B,control} = memory[j][30:12];
			#10;
			if({Y1,carry,overflow,zero,neg} != memory[j][11:0])
				$display("Error in %1d%1d%1d%1d%1d case",Y1,carry,overflow,zero,neg);
			else
				$display("No error in %1d%1d%1d%1d%1d case",Y1,carry,overflow,zero,neg);			
			#10;
			end
		#1 $display("t=%t",$time," A=%b",A," B=%b",B," carry=%b",carry," overflow=%b",overflow," out=%b",Y1);
	end
 
 

 endmodule