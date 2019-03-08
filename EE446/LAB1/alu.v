module alu #(parameter W = 1) (
	// Inputs
	A, B,
	// Outputs
	out, CO, OVF, Z ,N,
	// Control Signal
	ALU_control);
	// Inputs
	input [W:0] A;
	input [W:0]  B;
	// Outputs
	output reg[W:0] out;
	output reg CO, OVF, Z ,N;
	// Signal
	input[2:0] ALU_control;
	
	always@(*)
	begin
		case (ALU_control)
			// Arithmetic operations
			3'b000: {CO,out} = A + B;	
			3'b001: {CO,out} = A - B;	
			3'b010: {CO,out} = B - A;

			// Logic operations	
			3'b011: out = A & ~B;	
			3'b100: out = A & B;	
			3'b101: out = A | B;	
			3'b110: out = A ^ B;	
			3'b111: out = A ~^ B;

		endcase

		OVF = ({CO,out[W]} == 2'b01);

		if(ALU_control ~= 3'b000 && ALU_control ~= 3'b001 && ALU_control ~= 3'b010)
			begin
				CO = 1'b0;
				OVF = 1'b0;
			end
		
		N = out[W];
		Z = out==W{1'b0};
	end
endmodule
