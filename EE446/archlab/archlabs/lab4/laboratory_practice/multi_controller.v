module multi_controller(
	pcwrite,
	adrsrc,
	CLK,
	memwrite,
	irwrite,
	regwrite,
	shifter,
	shiftop,
	alusrca,
	alusrcb,
	alucontrol,
	resultsrc,
	Reset,
	zero,
	carry,
	Opcode
    );
	 
output	reg	[2:0]	shifter,alucontrol;
output	reg	[1:0]	resultsrc;
output	reg	pcwrite,adrsrc,memwrite,irwrite,regwrite,shiftop,alusrca,alusrcb;

input	[4:0]	Opcode;
input	CLK,Reset;
input zero,carry;

reg	[3:0]	state, next_state;

//ALUOp Values:
// 00 -> addition
// 01 -> subtraction
// 10 -> Function (R-Type)
// 11 -> Opcode	(I-Type)


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


//Sequential Logic Synced to Clock

always @(posedge CLK)     //run buraya ekle if(run==1) then state<=next_state;
begin
	state <= next_state;
end


always @ (state or Reset)
begin
	if(Reset == 1'b1)
		begin
		next_state = S0;
		adrsrc = 1'b0;
      alucontrol = 3'b000;
      alusrcb = 1'b0;
      alusrca = 1'b0;
      regwrite = 1'b0;
      irwrite = 1'b0;
      resultsrc = 2'b10;
      memwrite = 1'b0;
      pcwrite = 1'b0;
      shifter = 3'b000;
      shiftop = 1'b0;
		end
	
	else
	begin
		
	case(state)
	
		//Instruction Fetch
		S0:
		begin 	
			//Reset Controller Values
			alusrca = 1'b1;
			memwrite = 1'b0;
			regwrite = 1'b0;
			pcwrite = 1'b1;
			adrsrc = 1'b0;
			irwrite = 1'b1;
			alucontrol = 3'b000;
			resultsrc = 2'b10;
			alusrcb = 1'b1;
			shiftop = 1'b0;
			shifter = 3'b000;
			next_state = S1;
		end
		
		//Instruction Decode
		S1:
		begin
			regwrite = 1'b0;
			irwrite = 1'b0;
			pcwrite = 1'b0;
			alusrca = 1'b1;
			alusrcb = 1'b1;
			shifter = 3'b000;
			alucontrol = 3'b000;
			
			//shift
			if(Opcode[4:3] == 2'b01)
				begin
					shiftop = 1'b1;
					next_state = S11;
				end
				
			//R-Type
			else if(Opcode[4:3] == 2'b00)
				begin
				shiftop = 1'b0;
					next_state = S6;
				end
			
			
			//Branch Type
			else if(Opcode[4:3] == 2'b10)
				begin
				shiftop = 1'b0;
				regwrite = 1'b1;
					next_state = S10;
				end
			
			//I-Type
			else if(Opcode[4:3] == 2'b11)
				begin
				shiftop = 1'b0;
					if(Opcode[2:0] == 3'b000) //loadimm
					begin
							next_state = S12;
					end
					
					else if(Opcode[2:0] == 3'b001)
					begin
							next_state = S2;
					end
					
					else if(Opcode[2:0] == 3'b010) //store
					begin
							next_state = S14;
					end
					

				end
			end
		
		//load
		S2:
		begin
				irwrite = 1'b0;
				pcwrite = 1'b0;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				shiftop = 1'b0;
				next_state = S3;
			
		end
			
		//load comp
		S3:
		begin
			irwrite = 1'b0;
			pcwrite = 1'b0;
			resultsrc= 2'b01;
			regwrite=1'b1;
			shiftop = 1'b0;
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
			alusrca = 1'b0;
		   alusrcb = 1'b0;
			shiftop = 1'b0;
		   next_state = S7;
			
			//add
			if(Opcode[2:0] == 3'b000)
				alucontrol = 3'b000;
			
			//sub
			else if(Opcode[2:0] == 3'b001)
				alucontrol = 3'b001;
				
			//ADD ind	
			else if(Opcode[2:0] == 3'b010)
             alucontrol = 3'b000;
			
			//SUB ind
			else if(Opcode[2:0] == 3'b011)
             alucontrol = 3'b001;
			
			//and
			else if(Opcode[2:0] == 3'b100)
             alucontrol = 3'b010;
			
			//or
			else if(Opcode[2:0] == 3'b101)
             alucontrol = 3'b011;
			
			//XOR
			else if(Opcode[2:0] == 3'b110)
             alucontrol = 3'b100;
			
			//clear
			else if(Opcode[2:0] == 3'b111)
             alucontrol = 3'b101;
		end
	
		//R-Type Completion
		S7:
			begin
			irwrite = 1'b0;
			pcwrite = 1'b0;
			resultsrc = 2'b00;
			regwrite = 1'b1;
			shiftop = 1'b0;
			next_state = S0;
			end
		
		//shift comp
		S8:
		begin
			irwrite = 1'b0;
			pcwrite = 1'b0;
			resultsrc = 2'b00;
			regwrite = 1'b1;
			shiftop = 1'b1;
			next_state = S0;
		end

		//I-Type Completion
		S9:
		begin
			
		end
	
		//Write Back - I-Type
		S10:
		begin
			regwrite=1'b0;
			alusrca = 1'b0;
			alusrcb = 1'b0;
			shiftop = 1'b0;
			next_state = S0;
			
			//B
			if(Opcode[2:0] == 3'b000)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
				
			//Bwlink
			else if(Opcode[2:0] == 3'b001)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
			
			//Bindwlink
			else if(Opcode[2:0] == 3'b010)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
			
			//Bifzero
			else if(Opcode[2:0] == 3'b011)
				begin
					if(zero==0)
						begin
						pcwrite = 1'b0;
						resultsrc = 2'b11;
						adrsrc = 1'b0;
						end
					else
						begin
						pcwrite = 1'b1;
						resultsrc = 2'b11;
						adrsrc = 1'b1;
						end
					
				end
			
			//Bifnotzero
			else if(Opcode[2:0] == 3'b100)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
		    
		    //Bif carry
			else if(Opcode[2:0] == 3'b101)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
			
			//Bif not carry
			else if(Opcode[2:0] == 3'b111)
				begin
				pcwrite = 1'b1;
				resultsrc = 2'b11;
				adrsrc = 1'b1;
				end
		end
			
		//shift
		S11:
		begin    
	    	alusrca = 1'b0;
		   alusrcb = 1'b0;
		   shiftop = 1'b1;
			resultsrc = 2'b00;
			alucontrol = 3'b110;
		   next_state = S8;
			
			//rl
			if(Opcode[2:0] == 3'b000) 
			begin
				shifter = 3'b000;
			end
			
			//rr
			else if(Opcode[2:0] == 3'b001)
			begin
				shifter = 3'b001;
			end
			
			//sl	
			else if(Opcode[2:0] == 3'b010)
			begin
             shifter = 3'b010;
			end
			
			//asr
			else if(Opcode[2:0] == 3'b011)
			begin
             shifter = 3'b011;
			end
			
			//lsr
			else if(Opcode[2:0] == 3'b100)
			begin
             shifter = 3'b100;
			end
			
		end
		
		S12:
		begin
			irwrite = 1'b0;
			pcwrite = 1'b0;
			resultsrc = 2'b11;
			regwrite = 1'b1;
			shiftop = 1'b0;
			next_state = S0;
		end
		
		S13:
		begin
		irwrite = 1'b0;
			pcwrite = 1'b0;
			regwrite = 1'b1;
			shiftop = 1'b0;
			next_state = S0;
		end
		
		S14:
		begin
			irwrite = 1'b0;
			pcwrite = 1'b0;
			adrsrc = 1'b1;
			resultsrc = 2'b11;
         memwrite= 1'b1;
			shiftop = 1'b0;
			next_state = S0;
		end
			
	endcase
	end
end


endmodule