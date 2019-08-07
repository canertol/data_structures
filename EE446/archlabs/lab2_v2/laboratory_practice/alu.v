module alu #(parameter W=8)(A,B,control,out,co,ovf,z,n,out1,out2);
    input [(W-1):0] A,B;                 
    input [2:0] control;
    output [(W-1):0] out;
    output reg co,ovf,z,n;
    reg [(W-1):0] out;
	 output reg[(W-1):0] out1;
	 output reg[(W-1):0] out2;
	 reg [15:0]temp;
	 reg [7:0]    multiplier_copy;
    reg [15:0]    multiplicand_copy;
    reg           negative_output;
	 reg [15:0] product_temp;
   
    reg [5:0]     bit; 

    initial bit = 0;
    initial negative_output = 0;
	 

	 always @(*)
    begin
        case(control)
       0: // Add
		 begin
          {co,out} = A + B ;
			 z=(out == 0) ? 1 : 0; 
			 if ((A[W-1] == 0 && B[W-1] == 0 && out[W-1] == 1) || (A[W-1] == 1 && B[W-1] == 1 && out[W-1] == 0)) begin
						ovf = 1;
						n=0;
					end else begin
						ovf = 0;
						if (out[W-1]==1) begin
							n=1;
						end else begin
							n=0;
						end
					end
		end	  
       1: // SubAB
		 begin
           {co,out} = A + (~B + 1) ;
			  z=(out == 0) ? 1 : 0;
			  if ((A[W-1] == 1 && B[W-1] == 0 && out[W-1] == 0) || (A[W-1] == 0 && B[W-1] == 1 && out[W-1] == 1)) begin
						ovf = 1;
						n=0;
					end else begin
						ovf = 0;
						if (out[W-1]==1) begin
							n=1;
						end else begin
							n=0;
						end
					end
       end
		 2: // multp
		 begin

        bit               = 6'd8;
        {out1,out2}           = 0;
        product_temp      = 0;
        multiplicand_copy = (0 || !A[7]) ?{ 8'd0, A } :{ 8'd0, ~A + 1'b1};
        multiplier_copy   = (0 || !B[7]) ? B : (~B + 1'b1); 

        negative_output = 1 && ((B[7] && !A[7]) || (!B[7] && A[7]));
        
		
	   repeat(8) begin
 
        if( multiplier_copy[0] == 1'b1 ) product_temp = product_temp + multiplicand_copy;
 
        multiplier_copy = multiplier_copy >> 1;
        multiplicand_copy = multiplicand_copy << 1;
        bit = bit - 1'b1;

      end
	  {out1,out2} = (!negative_output) ? product_temp :~product_temp + 1'b1;
	  end

		 3: // divid
		 begin
           out = A & B;
			  co=0;
			  ovf=0;
			  z=(out == 0) ? 1 : 0;
			  if (out[W-1]==1) begin
				n=1;
			  end else begin
				n=0;
			  end
		 end
		 4: // and
		 begin
           out = A & B;
			  co=0;
			  ovf=0;
			  z=(out == 0) ? 1 : 0;
			  if (out[W-1]==1) begin
				n=1;
			  end else begin
				n=0;
			  end
		 end
		5: // or
		begin
           out = A | B;
			  co=0;
			  ovf=0;
			  z=(out == 0) ? 1 : 0;
			  if (out[W-1]==1) begin
				n=1;
			  end else begin
				n=0;
			  end
       end
		 6: // exor
		 begin
           out = A ^ B;
			  co=0;
			  ovf=0;
			  z=(out == 0) ? 1 : 0;
			  if (out[W-1]==1) begin
				n=1;
			  end else begin
				n=0;
			  end
       end
		 7: // bit clear
		 begin
           out = A & (~B);
			  co=0;
			  ovf=0;
			  z=(out == 0) ? 1 : 0;
			  if (out[W-1]==1) begin
				n=1;
			  end else begin
				n=0;
			  end
       end
     
          default: out = A + B ; 
        endcase
    end

endmodule