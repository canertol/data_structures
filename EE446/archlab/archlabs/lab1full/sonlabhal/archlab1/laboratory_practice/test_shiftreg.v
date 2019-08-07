module test_shiftreg();

 wire [7:0]Y1;
 
 reg [7:0]A;
 reg reset;
 reg clk;
 reg psload;
 reg lrshift;
 reg S;
 reg [19:0] memory [4:0];
 
 shift_reg DUT(S,A,reset,psload,lrshift,clk,Y1);
 integer j;
	initial begin
	
	$readmemb("vector_shiftreg.tv", memory);
	
	#1000;
	
	end
	
initial begin
  clk=0;
  forever begin
    #5 clk = ~clk;
  end
end
	
 always @(*)
 	begin	
		for (j=0; j<5; j=j+1)
			begin
			{S,A,reset,psload,lrshift} = memory[j][19:8];
			#9;
			if(Y1 != memory[j][7:0])
				$display("Error in %1d case",Y1);
			else
				$display("No error in %1d case",Y1);			
			#9;
			end
		#1 $display("t=%t",$time," A=%b",A," reset=%b",reset," psload=%b",psload," lrshift=%b",lrshift," out=%b",Y1);
	end
 
 

 endmodule