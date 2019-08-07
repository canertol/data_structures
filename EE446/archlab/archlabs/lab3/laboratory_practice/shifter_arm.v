module shifter_arm (data,control,out);
input [6:0]control;
input [31:0]data;
output [31:0]out;
reg [31:0]out;

always @(*)
begin
	if(control[1:0]==2'b00)
	out = data << control[6:2] ;	
	
	else if (control[1:0]==2'b01)
	out = data >> control[6:2];


end



endmodule