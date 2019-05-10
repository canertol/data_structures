module ALU #(parameter W = 32) (
	// Inputs
	B, A,
	// Result
	out, 
	// ALU Flags
	C, O, Z ,N,
	// Control Signal
	ALUControl);
	// Inputs
	input [W-1:0] B;
	input [W-1:0] A;
	// Outputs
	output reg[W-1:0] out;
	output reg C, O, Z ,N;
	// Signal
	input[1:0] ALUControl;
	
	always@(*)
	begin
		case (ALUControl)
			// Arithmetic operations
			2'b00: begin
						{C,out} = A + B;
						O = (A[W-1] & B[W-1] & !out[W-1])| (!A[W-1] & !B[W-1] & out[W-1]);
					  end	
			2'b01: begin
						{C,out} = A - B;	
						O = (A[W-1] & !B[W-1] & !out[W-1])| (!A[W-1] & B[W-1] & out[W-1]);
					  end
			// Logic operations				
			2'b10: out = A & B;

			2'b11: out = A | B;	
			
			default: begin
						{C,out} = A + B;
						O = (A[W-1] & B[W-1] & !out[W-1])| (!A[W-1] & !B[W-1] & out[W-1]);
					  end	

		endcase
		

		if((ALUControl != 2'b00) && (ALUControl != 2'b01))
			begin
				C = 1'b0;
				O = 1'b0;
			end
		
		N = out[W-1];
		Z = out=={W{1'b0}};
	end
endmodule
