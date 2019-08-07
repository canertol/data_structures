module multiplier(product1,product2,multiplier,multiplicand,clk); 

   input         clk;
   input [7:0]  multiplier, multiplicand;
   output [7:0] product1;
	output [7:0] product2;
   reg [15:0]    product_temp;
	
   reg [7:0]    multiplier_copy,product1,product2;
   reg [15:0]    multiplicand_copy;
   reg           negative_output;
   
   reg [5:0]     bit; 
	integer index;

	initial index = 0;
   initial bit = 0;
   initial negative_output = 0;

   always @( posedge clk ) begin

     begin

        bit               = 6'd8;
        product1           = 0;
		  product2           = 0;
        product_temp      = 0;
        multiplicand_copy = (!1 || !multiplicand[7]) ? 
                            { 8'd0, multiplicand } : 
                            { 8'd0, ~multiplicand + 1'b1};
        multiplier_copy   = (!1 || !multiplier[7]) ?
                            multiplier :
                            ~multiplier + 1'b1; 

        negative_output = 1 &&(multiplier[7] ^ multiplicand[7]);
        
     end 
     if ( bit > 0 ) begin

			for(index = 0; index < 8; index = index + 1) begin

        if( multiplier_copy[0] == 1'b1 ) product_temp = product_temp +multiplicand_copy;

			multiplier_copy = multiplier_copy >> 1;
        multiplicand_copy = multiplicand_copy << 1;
        bit = bit - 1'b1;
		end
		
        {product2,product1} = (!negative_output) ? 
                  product_temp : 
                  ~product_temp + 1'b1;

        

     end
end
endmodule