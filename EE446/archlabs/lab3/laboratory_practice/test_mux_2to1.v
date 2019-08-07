module test_mux_2to1();

 wire [7:0]Y1;
 reg [7:0]A;
 reg [7:0]B;
 reg s;
 reg [24:0] memory [1:0];
 mux_2to1 DUT(A,B,s,Y1);
 integer j;
	initial begin
	
	$readmemb("vector_mux_2to1.tv", memory);
	
	#1000;
	
	end

 always @(*)
 	begin
		for (j=0; j<2; j=j+1)
			begin
			{A,B,s} = memory[j][24:8];
			#10;
			if(Y1 != memory[j][7:0])
				$display("Error in %1d%1d case",A,B);
			else
				$display("No error in %1d%1d case",A,B);			
			#10;
			end
		#1 $display("t=%t",$time," A=%b",A," B=%b",B," Y=%b",Y1);
	end
 
 

 endmodule