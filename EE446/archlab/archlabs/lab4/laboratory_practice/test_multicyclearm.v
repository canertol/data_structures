module test_multicyclearm();

 wire [7:0 ]aluout,outpc1,r2,reg1out,reg2out;
 wire [15:0]dallanma,fetchedinst;
 wire [2:0]wa,regadres1,regadres2;
 
 reg pcwrite,adrsrc,	memwrite,	irwrite,	regwrite,	alusrca,	alusrcb,	clk,	shiftop;
 reg [1:0] alucontrol,resultsrc;
 reg [2:0] shifter;
 
 multicycle DUT(
   clk,
	resetpc,
	zeroflag,
	aluin1,
	aluin2,
	aluout,
	dallanma,
	fetchedinst,
	outpc1,
	r2,
	r3,
	reg1out,
	reg2out,
	regadres1,
	regadres2,
	regyolu,
	shiftercontrol,
	shifterin,
	shifterout,
	shiftselectout,
	wa);
	
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