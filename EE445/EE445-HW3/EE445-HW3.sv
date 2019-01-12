module basic_comp (
	clk,
	set_S, set_FGI, set_FGO,
	FGI_out, FGO_out,
	INPR_in, OUTR_out
);

	/* FILL HERE */

endmodule


/*
 * CPU modules
 */
module control_timing_unit (
	// Inputs
	clk, IR,
	IRQ, IEN, FGI, FGO, E, AC_MSB, AC_zero, DR_zero,

	// Outputs
	load_AR, clr_AR, inc_AR,
	load_PC, clr_PC, inc_PC,
	load_DR, inc_DR,
	load_AC, clr_AC, inc_AC,
	load_IR,
	load_TR,
	load_OUTR,
	set_IRQ, clr_IRQ,
	set_IEN, clr_IEN,
	load_E, clr_E, comp_E,
	clr_S,
	clr_FGI,
	clr_FGO,
	ALU_and, ALU_add, ALU_comp, ALU_cir, ALU_cil, ALU_trans_dr, ALU_trans_inpr,
	RAM_r, RAM_w,
	bus_select
);

	/* FILL HERE */
	
	

endmodule


module control_logic (
	// Inputs
	clk, D, T,
	IR, I, IRQ, IEN, FGI, FGO, E, AC_MSB, AC_zero, DR_zero,
	// Outputs
	load_AR, clr_AR, inc_AR,
	load_PC, clr_PC, inc_PC,
	load_DR, inc_DR,
	load_AC, clr_AC, inc_AC,
	load_IR,
	load_TR,
	load_OUTR,
	load_I,
	set_IRQ, clr_IRQ,
	set_IEN, clr_IEN,
	load_E, clr_E, comp_E,
	clr_S,
	clr_FGI,
	clr_FGO,
	clr_SC,
	ALU_and, ALU_add, ALU_comp, ALU_cir, ALU_cil, ALU_trans_dr, ALU_trans_inpr,
	RAM_r, RAM_w,
	bus_select
);
   // Inputs
	input clk,I, IRQ, IEN, FGI, FGO, E, AC_MSB, AC_zero, DR_zero;
	input [15:0]IR, T;
	input [7:0] D;
	// Outputs
	output load_AR, clr_AR, inc_AR,
	load_PC, clr_PC, inc_PC,
	load_DR, inc_DR,
	load_AC, clr_AC, inc_AC,
	load_IR,
	load_TR,
	load_OUTR,
	load_I,
	set_IRQ, clr_IRQ,
	set_IEN, clr_IEN,
	load_E, clr_E, comp_E,
	clr_S,
	clr_FGI,
	clr_FGO,
	clr_SC,
	ALU_and, ALU_add, ALU_comp, ALU_cir, ALU_cil, ALU_trans_dr, ALU_trans_inpr,
	RAM_r, RAM_w;
	output reg[2:0]bus_select;
	
	always@(negedge clk)
	begin
	if(IRQ==0)
		if(T[0]==1) // IRQ'T0
			
		if(T[1]==1)	// IRQ'T1
		
		if(T[2]==1)	// IRQ'T2
			begin
			load_I <= 1;
			load_AR <= 1;
			bus_select <= 3b'101;
			end
		if(D[7]==1) 						// D7=1
			begin
				if(I==0)						// D7I'
					begin
					if(T[3]==1)  			//D7I'T3 = r
					begin
						if(IR[11]==1)		// rB11
							clr_AC <= 1;		
							
						if(IR[10]==1)		// rB10
							clr_E <= 1;
							
						if(IR[9]==1)		// rB9
							ALU_comp <= 1;
							
						if(IR[8]==1)		// rB8
							comp_E <= 1;
							
						if(IR[7]==1)		// rB7
							ALU_cir <= 1;
							load_E <= 1;
							
						if(IR[6]==1)		// rB6
							ALU_cil <= 1;
							load_E <= 1;
							
						if(IR[5]==1)		// rB5
							inc_AC <= 1;
							
						if(IR[4]==1)		// rB4
							if(AC_MSB==0)
								inc_PC <= 1;
								
						if(IR[3]==1)		// rB3
							if(AC_MSB==1)
								inc_PC <= 1;
							
						if(IR[2]==1)		// rB2
							if(AC_zero==1)
								inc_PC <= 1;
							
						if(IR[1]==1)		// rB1
							if(E==0)
								inc_PC <= 1;
							
						if(IR[0]==1)
								clr_S <= 1;
						end
					end
							
				else							// D7I
					if(T[3]==1)				// D7IT3 = p
						begin
						clr_S <= 1;
						
						if(IR[11]==1)		// pB11
							ALU_trans_inpr <= 1;
							clr_FGI <= 1;
							load_AC <= 1;
							
						if(IR[10]==1)		// pB10
							clr_FGO <= 1;
							bus_select <= 3b'100;
							load_OUTR <= 1;
							
							
						if(IR[9]==1)		// pB9
							if(FGI==1)
							inc_PC <= 1;
							
							
						if(IR[8]==1)		// pB8
							if(FGO==1)
							inc_PC <= 1;
							
						if(IR[7]==1)		// pB7
							set_IEN <= 1;
							
						if(IR[6]==1)		// pB6
							clr_IEN <= 1;
						end
						
				
			end
		else // D7'
		begin
			if(I==1)
				begin
				load_AR <= 1;
				bus_select <= 3b'111;
				RAM_r <= 1;
				end
			if(D[0]==1)
			begin
				if(T[4]==1)
					begin
					bus_select <= 3b'111;
					RAM_r <= 1;
					load_DR <= 1;
					end
				if(T[5]==1)
					begin
					ALU_and <= 1;
					clr_S <= 1;
					end
				
			end
			if(D[1]==1)
				begin
					if(T[4]==1)
						begin
						bus_select <= 3b'111;
						RAM_r <= 1;
						load_DR <= 1;
						end
					if(T[5]==1)
						begin
						ALU_add <= 1;
						clr_S <= 0;
						end
					
				end
			if(D[2]==1)
				begin
					if(T[4]==1)
						begin
						bus_select <= 3b'111;
						RAM_r <= 1;
						load_DR <= 1;
						end
					if(T[5]==1)
						begin
						ALU_trans_dr <= 1;
						clr_S <= 1;
						end
				end
			if(D[3]==1)
				begin
					if(T[4]==1)
						begin
						bus_select <= 3b'100
						clr_S <= 1;
						RAM_w <= 1;
						end
				end
			if(D[4]==1)
			begin
				if(T[4]==1)
				begin
				load_PC <= 1;
				clr_S <= 1;
				bus_select <= 3b'001;
				end				
			end
			if(D[5]==1)
			begin
				if(T[4]==1)
					begin
					bus_select <= 3b'010;
					RAM_w <= 1;
					inr_AR <=1;
					end
				if(T[5]==1)
					begin
					bus_select <= 3b'001;
					load_PC <= 1;
					clr_S <= 1;
					end
			end
			if(D[6]==1)
			begin
				if(T[4]==1)
					begin
					bus_select <= 3b'111;
					RAM_r <= 1;
					load_DR <= 1;
					end
				if(T[5]==1)
					begin
					inc_DR <= 1;
					end
				if(T[6]==1)
					begin
					bus_select <= 3b'011;
					RAM_w <= 1;
						if(DR==0)
							begin
							inc_PC <= 1;
							end
					clr_S <= 1;
					end
			end				
		end
			
			
		
		if(D[7]~=0 && I==1 && T[3]==1) // D7'IT3
		
		
	else
		if(T[0]~=0 && T[1]~=0 && T[2]~=0 && IEN && (FGI || FGO)) // T0'T1'T2'(IEN)(FGI + FGO)
		
		else
			if(IRQ && T[0]) // IRQ T0
			
			if(IRQ && T[1]) // IRQ T1
			
			if(IRQ && T[2]) // IRQ T2
	
	
	
	
	end
	/* FILL HERE */

endmodule


module alu (
	// Inputs
	from_DR, from_INPR, from_AC, from_E,
	// Outputs
	out, carry,
	// Signals
	and_, add, comp, cir, cil, trans_dr, trans_inpr
);
	// Inputs
	input [15:0]from_DR;
	input [7:0] from_INPR;
	input [15:0]from_AC;
	input from_E;
	// Outputs
	output reg[15:0] out, 
	output reg carry;
	// Signals
	input and_, add, comp, cir, cil, trans_dr, trans_inpr;
	
	always@(and_)
	begin
		out <= from_AC & from_DR;
	
	end
	always@(add)
	begin
		{carry,out} <= from_AC + from_DR;
		
	end
	always@(comp)
	begin
		

	end
	always@(cir)
	begin
		carry 	<= from_AC[0];
		out 		<= from_AC>>1;
		out[15]  <= from_E;

	end
	always@(cil)
	begin
		carry <= from_AC[15];
		out   <= from_AC<<1;
		out[0]<= from_E;

	end
	always@(trans_dr)
	begin
		out <= from_DR;

	end
	always@(trans_inpr)
	begin
		out[7:0] <= from_INPR;

	end
	/* FILL HERE */

endmodule


/*
 * Basic modules
 */
 module register #(parameter WIDTH = 8) (
	clk,
	in, out,
	load, clr, inc
);
 	input clk;
	input [WIDTH-1:0] in;
	output reg [WIDTH-1:0] out;
	input load, clr, inc;

	initial
	begin
		out = {WIDTH{1'b0}};
	end

	always @(posedge clk)
	begin
		if (load)
			out <= in;
		else if (clr)
			out <= {WIDTH{1'b0}};
		else if (inc)
			out <= out + {{WIDTH-1{1'b0}}, 1'b1};
	end
endmodule


module ff (
	clk,
	in, out,
	load, set, clr, comp
);
	input clk;
	input in;
	output reg out;
	input load, set, clr, comp;

	initial
	begin
		out = 1'b0;
	end

	always @(posedge clk)
	begin
		if (load)
			out <= in;
		else if (set)
			out <= 1'b1;
		else if (clr)
			out <= 1'b0;
		else if (comp)
			out <= ~out;
	end
endmodule


module counter #(parameter WIDTH = 4) (
	clk,
	out,
	clr,
);
	input clk;
	output reg [WIDTH-1:0] out;
	input clr;

	initial
	begin
		out = {WIDTH{1'b0}};
	end

	always @(posedge clk)
	begin
		if (clr)
			out <= {WIDTH{1'b0}};
		else
			out <= out + {{WIDTH-1{1'b0}}, 1'b1};
	end
endmodule


module decoder #(parameter IN_WIDTH = 3) (
	in, out
);
	input [IN_WIDTH-1:0] in;
	output reg [(1<<IN_WIDTH)-1:0] out;

	always @(in)
	begin
		out = {(1<<IN_WIDTH){1'b0}};
		out[in] = 1'b1;
	end

endmodule


module encoder #(parameter OUT_WIDTH = 3) (
	in,	out
);
	input [(1<<OUT_WIDTH)-1:0] in;
	output reg [OUT_WIDTH-1:0] out;

	integer i;
	always @(in)
	begin
		out = {OUT_WIDTH{1'b0}};
		for (i=(1<<OUT_WIDTH)-1; i>=0; i=i-1)
			if (in[i]) out = i;
	end
endmodule


module bus #(parameter DATA_WIDTH = 16, SELECT_WIDTH = 3) (
	select,
	in, out
);
	input [SELECT_WIDTH-1:0] select;
	input [DATA_WIDTH-1:0] in [0:(1<<SELECT_WIDTH)-1];
	output reg [DATA_WIDTH-1:0] out;

	always @(*)
	begin
		out = in[select];
	end
endmodule


module ram #(parameter ADDR_WIDTH = 12, DATA_WIDTH = 16) (
	clk,
	addr,
	r, w,
	in, out
);
	input clk;
	input [ADDR_WIDTH-1:0] addr;
	input r;
	input w;
	input [DATA_WIDTH-1:0] in;
	output [DATA_WIDTH-1:0] out;

	reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

	assign out = r ? memory[addr] : {DATA_WIDTH{1'bz}};

	always @(posedge clk)
		if (w)
			memory[addr] <= in;

endmodule
