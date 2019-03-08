module mux4 #(parameter W = 3)( select, mux_in, mux_out );

input[3:0] select;
input[W:0] mux_in;
output     mux_out;

wire      mux_out;
wire[3:0] select;
wire[W:0] mux_in;

assign mux_out = mux_in[select];

endmodule