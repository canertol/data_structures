module control_unit(
	Shift,
	IDMWrite,
	IRegen,
	IDMSrc,
	ASrc0,
	RegWrite,
	ASrc1,
	BSrc,
	PCen,
	ALUCtrl,
	RegSrc,
	RST,
	CLK,
	Z,
	C,
	Op
	, state, next_state,
	FlgWrite
    );
	 
output	reg	[2:0]	Shift,ALUCtrl;
output	reg	[1:0]	RegSrc;
output	reg	PCen,IDMSrc,IDMWrite,IRegen,RegWrite,ASrc0,ASrc1,BSrc, FlgWrite;

input	[4:0]	Op;
input	CLK,RST;
input Z,C;

output reg	[3:0]	state, next_state;

//ALUOp Values:
// 00 -> addition
// 01 -> subtraction
// 10 -> Function (R-Type)
// 11 -> Op	(I-Type)


///////////////////////
//STATES///////////////
///////////////////////

	parameter S0 = 4'b0000; //Instruction Fetch
	parameter S1 = 4'b0001; //Instruction Decode
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0011;
	parameter S4 = 4'b0100;
	parameter S5 = 4'b0101;
	parameter S6 = 4'b0110;
	parameter S7 = 4'b0111;
	parameter S8 = 4'b1000;
	parameter S9 = 4'b1001;  //Memory Write	
	parameter S10 = 4'b1010; //Register Write
	parameter S11 = 4'b1011;
	parameter S12 = 4'b1100;
	parameter S13 = 4'b1101;
	parameter S14 = 4'b1110;

initial
begin
state = 4'b1111;
next_state = 4'b0000;
end
//Sequential Logic Synced to Clock

always @(posedge CLK)     
begin
	state <= next_state;
end


always @ (state or RST)
begin
	if(RST == 1'b1)
		begin
		next_state = S0;
		IDMSrc = 1'b0;
      ALUCtrl = 3'b000;
      BSrc = 1'b0;
      ASrc1 = 1'b0;
      RegWrite = 1'b0;
      IRegen = 1'b0;
      RegSrc = 2'b10;
      IDMWrite = 1'b0;
      PCen = 1'b0;
      Shift = 3'b000;
      ASrc0 = 1'b0;
		FlgWrite = 1'b0;
		end
	
	else
	begin
		
	case(state)
	
		//Instruction Fetch
		S0:
		begin 	
			//RST Controller Values
			ASrc1 = 1'b1;
			IDMWrite = 1'b0;
			RegWrite = 1'b0;
			PCen = 1'b1;
			IDMSrc = 1'b0;
			IRegen = 1'b1;
			ALUCtrl = 3'b000;
			RegSrc = 2'b10;
			BSrc = 1'b1;
			ASrc0 = 1'b0;
			Shift = 3'b000;
			FlgWrite = 1'b0;
			next_state = S1;
		end
		
		//Instruction Decode
		S1:
		begin
			RegWrite = 1'b0;
			IRegen = 1'b0;
			PCen = 1'b0;
			ASrc1 = 1'b1;
			BSrc = 1'b1;
			Shift = 3'b000;
			ALUCtrl = 3'b000;
			FlgWrite = 1'b0;
			//shift
			if(Op[4:3] == 2'b01)
				begin
					ASrc0 = 1'b1;
					next_state = S11;
				end
				
			//R-Type
			else if(Op[4:3] == 2'b00)
				begin
				ASrc0 = 1'b0;
					next_state = S6;
				end
			
			
			//Branch Type
			else if(Op[4:3] == 2'b10)
				begin
				ASrc0 = 1'b0;
				RegWrite = 1'b1;
					next_state = S10;
				end
			
			//I-Type
			else if(Op[4:3] == 2'b11)
				begin
				ASrc0 = 1'b0;
					if(Op[2:0] == 3'b000) //loadimm
					begin
							next_state = S12;
					end
					
					else if(Op[2:0] == 3'b001)
					begin
							next_state = S2;
					end
					
					else if(Op[2:0] == 3'b010) //store
					begin
							next_state = S14;
					end

				end
			end
		
		//load
		S2:
		begin
				IRegen = 1'b0;
				PCen = 1'b0;
				RegSrc = 2'b11;
				IDMSrc = 1'b1;
				ASrc0 = 1'b0;
				next_state = S3;
			
		end
			
		//load comp
		S3:
		begin
			IRegen = 1'b0;
			PCen = 1'b0;
			RegSrc= 2'b01;
			RegWrite=1'b1;
			ASrc0 = 1'b0;
			next_state= S0;
		end
		
		//LWI/LUI/LI Completion
		S4:
		begin
		
		end
		
		//
		S5:
		begin
		
		end
			
		//Execution: R-Type
		S6:
		begin    
			ASrc1 = 1'b0;
		   BSrc = 1'b0;
			ASrc0 = 1'b0;
			FlgWrite = 1'b1;
		   next_state = S7;
			
			//add
			if(Op[2:0] == 3'b000)
				ALUCtrl = 3'b000;
			
			//sub
			else if(Op[2:0] == 3'b001)
				ALUCtrl = 3'b001;
				
			//ADD ind	
			else if(Op[2:0] == 3'b010)
             ALUCtrl = 3'b000;
			
			//SUB ind
			else if(Op[2:0] == 3'b011)
             ALUCtrl = 3'b001;
			
			//and
			else if(Op[2:0] == 3'b100)
             ALUCtrl = 3'b010;
			
			//or
			else if(Op[2:0] == 3'b101)
             ALUCtrl = 3'b011;
			
			//XOR
			else if(Op[2:0] == 3'b110)
             ALUCtrl = 3'b100;
			
			//clear
			else if(Op[2:0] == 3'b111)
             ALUCtrl = 3'b101;
		end
	
		//R-Type Completion
		S7:
			begin
			IRegen = 1'b0;
			PCen = 1'b0;
			RegSrc = 2'b00;
			RegWrite = 1'b1;
			ASrc0 = 1'b0;
			next_state = S0;
			end
		
		//shift comp
		S8:
		begin
			IRegen = 1'b0;
			PCen = 1'b0;
			RegSrc = 2'b00;
			RegWrite = 1'b1;
			ASrc0 = 1'b1;
			next_state = S0;
		end

		//I-Type Completion
		S9:
		begin
			
		end
	
		//Write Back - I-Type
		S10:
		begin
			RegWrite=1'b0;
			ASrc1 = 1'b0;
			BSrc = 1'b0;
			ASrc0 = 1'b0;
			next_state = S0;
			
			//B
			if(Op[2:0] == 3'b000)
				begin
				PCen = 1'b1;
				RegSrc = 2'b11;
				IDMSrc = 1'b1;
				end
				
			//Bwlink
			else if(Op[2:0] == 3'b001)
				begin
				PCen = 1'b1;
				RegSrc = 2'b11;
				IDMSrc = 1'b1;
				end
			
			//Bindwlink
			else if(Op[2:0] == 3'b010)
				begin
				PCen = 1'b1;
				RegSrc = 2'b11;
				IDMSrc = 1'b1;
				end
			
			//BifZ
			else if(Op[2:0] == 3'b011)
				begin
					if(Z==0)
						begin
						PCen = 1'b0;
						RegSrc = 2'b11;
						IDMSrc = 1'b0;
						end
					else
						begin
						PCen = 1'b1;
						RegSrc = 2'b11;
						IDMSrc = 1'b1;
						end
					
				end
			
			//BifnotZ
			else if(Op[2:0] == 3'b100)
				begin
				if(Z==1)
						begin
						PCen = 1'b0;
						RegSrc = 2'b11;
						IDMSrc = 1'b0;
						end
					else
						begin
						PCen = 1'b1;
						RegSrc = 2'b11;
						IDMSrc = 1'b1;
						end
				end
		    
		    //Bif C
			else if(Op[2:0] == 3'b101)
				begin
				if(C==0)
						begin
						PCen = 1'b0;
						RegSrc = 2'b11;
						IDMSrc = 1'b0;
						end
					else
						begin
						PCen = 1'b1;
						RegSrc = 2'b11;
						IDMSrc = 1'b1;
						end
				end
			
			//Bif not C
			else if(Op[2:0] == 3'b111)
				begin
				if(C==1)
						begin
						PCen = 1'b0;
						RegSrc = 2'b11;
						IDMSrc = 1'b0;
						end
					else
						begin
						PCen = 1'b1;
						RegSrc = 2'b11;
						IDMSrc = 1'b1;
						end
				end
		end
			
		//shift
		S11:
		begin    
	    	ASrc1 = 1'b0;
		   BSrc = 1'b0;
		   ASrc0 = 1'b1;
			RegSrc = 2'b00;
			ALUCtrl = 3'b110;
		   next_state = S8;
			
			//rl
			if(Op[2:0] == 3'b000) 
			begin
				Shift = 3'b000;
			end
			
			//rr
			else if(Op[2:0] == 3'b001)
			begin
				Shift = 3'b001;
			end
			
			//sl	
			else if(Op[2:0] == 3'b010)
			begin
             Shift = 3'b010;
			end
			
			//asr
			else if(Op[2:0] == 3'b011)
			begin
             Shift = 3'b011;
			end
			
			//lsr
			else if(Op[2:0] == 3'b100)
			begin
             Shift = 3'b100;
			end
			
		end
		
		S12:
		begin
			IRegen = 1'b0;
			PCen = 1'b0;
			RegSrc = 2'b11;
			RegWrite = 1'b1;
			ASrc0 = 1'b0;
			next_state = S0;
		end
		
		S13:
		begin
		IRegen = 1'b0;
			PCen = 1'b0;
			RegWrite = 1'b1;
			ASrc0 = 1'b0;
			next_state = S0;
		end
		
		S14:
		begin
			IRegen = 1'b0;
			PCen = 1'b0;
			IDMSrc = 1'b1;
			RegSrc = 2'b11;
         IDMWrite= 1'b1;
			ASrc0 = 1'b0;
			next_state = S0;
		end
			
	endcase
	end
end


endmodule