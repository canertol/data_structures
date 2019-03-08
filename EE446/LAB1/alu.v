module alu #(parameter W = 1) (
	// Inputs
	A, B,
	// Outputs
	out, CO, OVF, Z ,N,
	// Control Signal
	ALU_control
);
	// Inputs
	input [W:0] A;
	input [W:0]  B;
	// Outputs
	output reg[W:0] out;
	output reg CO, OVF, Z ,N;
	// Signals
	input[2:0] ALU_control;
	
	always@(*)
	begin
	case (ALU_control)
	3'b000: out = A + B;
	
	3'b001: out = A - B;
	
	3'b010: out = B - A;
	
	3'b011: out = A & ~B;
	
	3'b100: out = A & B;
	
	3'b101: out = A | B;
	
	3'b110: out = A ^ B;
	
	3'b111: out = A ~^ B;
	
	endcase
	
	N = out[W];
	Z = out==0;
	
	
	
	
	end

endmodule
