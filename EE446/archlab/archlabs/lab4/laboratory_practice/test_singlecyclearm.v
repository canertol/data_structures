module test_singlecyclearm();

 wire regwrite,ortaregwrite,nowrite,zeroflag;
 wire [31:0]aluout,cikaninstruction,extendout,pcoutadress,r2,r3,r4,r5,r7,wd3;
 wire [3:0]wa3;
 
 reg clk;
 
 singlecyclearm DUT(clk,regwrite,ortaregwrite,nowrite,zeroflag,aluout,cikaninstruction,extendout,pcoutadress,r2,r3,r4,r5,r7,wa3,wd3);
	
integer j;
	
initial begin
  clk=0;
end
	
always @(*)
 	begin
	for(j=0; j<100; j=j+1) begin
	clk = ~clk;
			if(r2 != 32'b00000000000000000000000000000000)
				$display("Error in %1d case",r2);
			else
				$display("No error in %1d case",r2);			
	#10;
		end
	#1 $display("t=%t",$time," r2=%1d",r2);
	end
 

 endmodule