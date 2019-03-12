// a generic test bench module
module test_bench ();
	
	////////////// MODIFY /////////////////////////////////////
	// parameters to be set according to the module under test
	parameter num_in = 2;	// number of inputs	
	parameter num_out = 1;	// number of outputs
	parameter num_test_vecs = 6;	// number of test vectors
	////////////// MODIFY /////////////////////////////////////

	////////////// DO NOT MODIFY ///////////////////////////////
	// variables for testing
	reg clk, reset;

	reg [(num_in - 1):0] in;

	reg [(num_out - 1):0] expected_out;
	wire [(num_out - 1):0] out;

	reg [31:0] vectornum, errors;	// uint32 type variables for book-keeping
	reg [(num_in + num_out - 1):0] testvectors[(num_test_vecs - 1):0];
	////////////////////////////////////////////////////////////

	////////////// MODIFY /////////////////////////////////////
	// "my_module" should be replaced with the name of the target module
	// input and output mappings should be properly configured for the target module
	my_module dut(.x1(in[1]), .x0(in[0]), .y(out[0])); // device under test
	////////////////////////////////////////////////////////////

	////////////// DO NOT MODIFY ///////////////////////////////

	// clock generation
	always
		begin
		clk = 1; #5; clk = 0; #5;
		end
	////////////////////////////////////////////////////////////

	////////////// MODIFY /////////////////////////////////////
	// initial block for the beginning of the test
	initial
		begin
		$readmemh("test_vectors_my_module.tv", testvectors); // modify as memb for binary test vectors
		vectornum = 0; errors = 0;
		reset = 1; #30; reset = 0;
		end
	////////////////////////////////////////////////////////////

	////////////// DO NOT MODIFY ///////////////////////////////

	// apply test vectors on rising edge of clk
	always @(posedge clk)
		begin
		#1; {in, expected_out} = testvectors[vectornum];
		end
		
	// check results on falling edge of clk
	always @(negedge clk)
		begin
		
		if (~reset)	// skip during reset pulse
			begin
			if( expected_out != out)
				begin
				$display("Error: inputs = %h", in);
				$display("Outputs = %h (%h expected)", {out}, {expected_out}); // %h for hex
				errors = errors + 1;
				end
			end
			
		// increment array index and read next test vector
		vectornum = vectornum + 1;
		if (vectornum === num_test_vecs)
			begin
			$display("%d test completed with %d errors", vectornum, errors);
			$stop;
			end
		
		end

	////////////////////////////////////////////////////////////
endmodule