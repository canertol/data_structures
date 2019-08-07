DC                     EQU  0x40004100 
SSI0_SR_R              EQU  0x4000800C 
SSI0_DR_R              EQU  0x40008008 
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT  	clear_screen				; Make available	
			
clear_screen	
				PUSH {R0-R12, LR}
				
init_XY			MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				ANDS R1, R1, #0x10
				BNE init_XY
repeat			MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
;				LDR	R1, [R0]
;				CMP R1, #0
				BNE	repeat
					; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV R1, #0x41				;  CURSOR RESET Y=1
				STR R1, [R0]
				MOV32 R0, DC 				 
				MOV R1, #0x40
				STR R1, [R0]
			
				MOV R5, #63				; for loop = 64 	
				MOV	R6, #4				; change Y
				MOV R7, #0xFF
clear			MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				ANDS R1, R1, #0x10
				BNE clear
				MOV32 R0, SSI0_DR_R
				STR R7,[R0]
				SUBS R5, #1
				BNE clear
				
				MOV R5, #63				; for loop = 64
				SUBS R6, #1
				BEQ finish_2
				CMP R6, #2
				BHI	Y2
				BEQ Y3
				BLO Y4
				
Y2		  		MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				ANDS R1, R1, #0x10
				BNE Y2
repeat2			MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				BNE	repeat2
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				MOV R1, #0x42				;  CURSOR RESET Y=2
				STR R1, [R0]
				B clear
								
Y3				MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				ANDS R1, R1, #0x10
				BNE Y3
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				MOV R1, #0x43				;  CURSOR RESET Y=3
				STR R1, [R0]
				B clear
				
Y4				MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				ANDS R1, R1, #0x10
				BNE Y4
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				MOV R1, #0x44				;  CURSOR RESET Y=4
				STR R1, [R0]
				B clear	
				
finish_2		POP {R0-R12, LR}
				BX LR
				END