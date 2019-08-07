module divider(quotient,remainder,dividend,divider,clk);

   input         clk;
   input [7:0]  dividend, divider;
   output [7:0] quotient, remainder;

   reg [7:0]    quotient, quotient_temp;
   reg [15:0]    dividend_copy, divider_copy, diff;
   reg           negative_output;
   
   wire [7:0]   remainder = (!negative_output) ? 
                             dividend_copy[7:0] : 
                             ~dividend_copy[7:0] + 1'b1;

   reg [5:0]     bit; 
	integer index;

	initial index = 0;
   initial bit = 0;
   initial negative_output = 0;

   always @( posedge clk ) begin

     begin

        bit = 6'd8;
        quotient = 0;
        quotient_temp = 0;
        dividend_copy = (!1 || !dividend[7]) ? 
                        {8'd0,dividend} : 
                        {8'd0,~dividend + 1'b1};
        divider_copy = (!1 || !divider[7]) ? 
                       {1'b0,divider,7'd0} : 
                       {1'b0,~divider + 1'b1,7'd0};

        negative_output = 1 && (divider[7] ^ dividend[7]);
        
     end 
     if ( bit > 0 ) begin

			for(index = 0; index < 8; index = index + 1) begin
			diff = dividend_copy - divider_copy;

			quotient_temp = quotient_temp << 1;

			if( !diff[15] ) begin

           dividend_copy = diff;
           quotient_temp[0] = 1'd1;

				end
		  

		  divider_copy = divider_copy >> 1;
        bit = bit - 1'b1;
			end  
		  
        quotient = (!negative_output) ?  quotient_temp : ~quotient_temp + 1'b1;

        

     end
end
endmodule