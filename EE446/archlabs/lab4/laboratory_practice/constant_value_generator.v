module constant_value_generator #(parameter W=8, D=12) (data_out_bus);
output wire [(W-1):0] data_out_bus;
assign data_out_bus[(W-1):0] = D;
endmodule
