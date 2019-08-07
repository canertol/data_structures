module alu #(parameter W=8)(A,B,control,out,co,ovf,z,n);
    input [(W-1):0] A,B;                 
    input [2:0] control;
    output [(W-1):0] out;
    output reg co,ovf,z,n;
    reg [(W-1):0] out;
	 

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
		 2: // SubBA
		 begin
           {co,out} = B + (~A + 1);
			  z=(out == 0) ? 1 : 0;
			  if ((A[W-1] == 0 && B[W-1] == 1 && out[W-1] == 0) || (A[W-1] == 1 && B[W-1] == 0 && out[W-1] == 1)) begin
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
		 3: // bit clear
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
		 7: // bitclear
		 begin
           out = (~A) & B;
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