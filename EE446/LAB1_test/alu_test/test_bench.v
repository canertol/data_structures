module test_bench ();

	reg clk, reset;
	reg [7:0] A, B;
	reg [2:0] I;
	reg [7:0] F;
	reg C_out, OVF, Z, N;
	
	wire [7:0] f;
	wire c, v, z, n;

	reg [3:0] vectornum, errors;
	reg [30:0] testvectors[7:0];
	
	alu dut(.A(A), .B(B), .I(I), .F(f), .C_out(c), .OVF(v), .Z(z), .N(n));
	
	// clock generation
	always
		begin
		clk = 1; #5; clk = 0; #5;
		end
		
	// initial block for the beginning of the test
	initial
		begin
		$readmemh("alu_test.tv", testvectors); // maybe memh for hex
		vectornum = 0; errors = 0;
		reset = 1; #30; reset = 0;
		end
	
	// apply test vectors on rising edge of clk
	always @(posedge clk)
		begin
		#1; {I, A, B, N, Z, OVF, C_out, F} = testvectors[vectornum];
		end
		
	// check results on falling edge of clk
	always @(negedge clk)
		begin
		
		if (~reset)	// skip during reset pulse
			begin
			if( {n,z,v,c,f} != {N,Z,OVF,C_out,F})
				begin
				$display("Error: A = %h, B = %h, I = %h", A, B, I);
				$display("Outputs = %h (%h expected)", {n,z,v,c,f}, {N,Z,OVF,C_out,F}); // %h for hex
				errors = errors + 1;
				end
			end
			
		// increment array index and read next test vector
		vectornum = vectornum + 1;
		if (vectornum == 8)
			begin
			$display("%d test completed with %d errors", vectornum, errors);
			end
		
		end


endmodule
