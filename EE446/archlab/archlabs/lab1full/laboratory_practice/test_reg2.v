module test_reg2();

 wire [7:0]Y1;
 
 reg [7:0]A;
 reg reset;
 reg clk;
 reg enable;
 reg [17:0] memory [3:0];
 
 simple_reg_we DUT(A,reset,clk,enable,Y1);
 integer j;
	initial begin
	
	$readmemb("vector_reg2.tv", memory);
	
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
		for (j=0; j<4; j=j+1)
			begin
			{A,reset,enable} = memory[j][17:8];
			#9;
			if(Y1 != memory[j][7:0])
				$display("Error in %1d case",Y1);
			else
				$display("No error in %1d case",Y1);			
			#9;
			end
		#1 $display("t=%t",$time," A=%b",A," reset=%b",reset," enable=%b",enable," out=%b",Y1);
	end
 
 

 endmodule