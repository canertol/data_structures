module test_mux_4to1();

 wire [7:0]Y1;
 reg [7:0]A;
 reg [7:0]B;
 reg [7:0]C;
 reg [7:0]D;
 reg [1:0]s;
 reg [41:0] memory [3:0];
 
 mux_4to1 DUT(A,B,C,D,s,Y1);
 integer j;
	initial begin
	
	$readmemb("vector_mux_4to1.tv", memory);
	
	#1000;
	
	end

 always @(*)
 	begin
		for (j=0; j<4; j=j+1)
			begin
			{A,B,C,D,s} = memory[j][41:8];
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