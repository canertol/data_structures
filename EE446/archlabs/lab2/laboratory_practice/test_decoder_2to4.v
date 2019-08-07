module test_decoder_2to4();

 wire Y4, Y3, Y2, Y1;
 reg A, B;
 reg [5:0] memory [3:0];
 decoder_2to4 DUT(A,B,Y1,Y2,Y3,Y4);
 integer j;
	initial begin
	
	$readmemb("vector_decoder_2to4.tv", memory);
	
	#1000;
	
	end

 always @(*)
 	begin
		for (j=0; j<4; j=j+1)
			begin
			{A,B} = memory[j][5:4];
			#10;
			if({Y1, Y2, Y3, Y4} != memory[j][3:0])
				$display("Error in %1d%1d case",A,B);
			else
				$display("No error in %1d%1d case",A,B);			
			#10;
			end
		#1 $display("t=%t",$time," A=%b",A," B=%b",B," Y=%b%b%b%b",Y4,Y3,Y2,Y1);
	end
 
 

 endmodule