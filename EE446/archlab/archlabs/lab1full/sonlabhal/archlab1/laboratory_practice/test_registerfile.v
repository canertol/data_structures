module test_registerfile();

 wire [7:0]datA;
 wire [7:0]datB;

 reg [7:0]datin; 
 reg c;
 reg e;
 reg rst;
 reg [1:0]adrin;
 reg [1:0]adrout1;
 reg [1:0]adrout2;

 reg [31:0] memory [4:0];
 
 registerfile DUT(c,e,rst,adrin,adrout1,adrout2,datin,datA,datB);
 integer j;
	initial begin
	
	$readmemb("vector_registerfile.tv", memory);
	
	#1000;
	
	end
	
initial begin
  c=0;
  forever begin
    #5 c = ~c;
  end
end
	
 always @(*)
 	begin	
		for (j=0; j<5; j=j+1)
			begin
			{e,rst,adrin,adrout1,adrout2,datin} = memory[j][31:16];
			#9;
			if({datA,datB} != memory[j][15:0])
				$display("Error in %1d case",datA);
			else
				$display("No error in %1d case",datA);			
			#9;
			end
		#1 $display("t=%t",$time,"out=%b",datA);
	end
 
 

 endmodule