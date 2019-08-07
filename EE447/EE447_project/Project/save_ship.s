;*************************************************************** 
; save_ship.s  
; This program gets (X,Y) coordinates from R11 and R12. 
; Saves the shape of the ship to the memory on (X,Y).
;***************************************************************	
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL			DIRECTIVE	VALUE		COMMENT
DC            	EQU  0x40004100 
SSI0_SR_R       EQU  0x4000800C 
SSI0_DR_R       EQU  0x40008008 
X				EQU  0x87
Y				EQU  0x41
memory			EQU	 0x20000400
offset_memory	EQU  0x20000500
;***************************************************************
; Program section					      
;***************************************************************
;LABEL			DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
                EXPORT    	save_ship		; Make available
              
save_ship
                PUSH {R0-R12,LR}
				
resetX			MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ resetX
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV32 R0, SSI0_SR_R
resetY			LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ resetY
				MOV R1, #0x41				;  CURSOR RESET Y=1
				STR R1, [R0]
				
				MOV32 R0, DC 			;dc_command  
				MOV R1, #0x40			; screen update
				STR R1, [R0]
				
				MOV32 R2, memory
				MOV32 R4, offset_memory
				MOV R5, #0				; for loop = 64 	
				MOV	R6, #4				; change Y
				
from_memory		LDRB R3, [R2], #1				; R3 holds the memory value
				
				
display			MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ display
			; sent
				MOV32 R0, SSI0_DR_R
				;MVN R3, R3
				STR R3, [R0]					; R3 value => screen 
				ADD	R5, #1					; memory++
				CMP	R5, #64					; memory 64 check
				BNE from_memory
				MOV R5, #0	
				
				CMP R2, R4			; memory check in order to be done
				BEQ finish
				SUB R6, #1
				CMP R6, #2
				BHI	Y2
				BEQ Y3
				BLO Y4
				
Y2		  		MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ Y2
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV R1, #0x42				;  CURSOR RESET Y=2
				STR R1, [R0]
				B from_memory
								
Y3				MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ Y3
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV R1, #0x43				;  CURSOR RESET Y=3
				STR R1, [R0]
				B from_memory
				
Y4				MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ Y4
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0
				STR R1, [R0]
				; sent
				MOV32 R0, SSI0_DR_R
				MOV R1, #0x86				; CURSOR RESET X=6
				STR R1, [R0]
				MOV R1, #0x44				;  CURSOR RESET Y=4
				STR R1, [R0]
				B from_memory								

finish			POP {R0-R12,LR}
				BX LR
				
				END