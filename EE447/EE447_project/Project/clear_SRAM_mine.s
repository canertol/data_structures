 
; EQU Directives
; These directives do not allocate memory
;*********************
;LABEL			DIRECTIVE	VALUE		COMMENT
DC            	EQU  0x40004100 
SSI0_SR_R       EQU  0x4000800C 
SSI0_DR_R       EQU  0x40008008 
X				EQU  0x87
Y				EQU  0x41
memory			EQU	 0x20000504
offset_memory	EQU  0x20000604
;*********************
; Program section					      
;*********************
;LABEL			DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
                EXPORT    	clear_SRAM_mine		; Make available
              
clear_SRAM_mine
                PUSH {R0-R7,LR}
				
				MOV32 R2, memory
				MOV32 R4, offset_memory
				MOV R5, #64				; for loop = 64 	
				MOV	R6, #4				; change Y
				MOV R7, #0
clear			STRB R7, [R2], #1
				SUBS R5, #1					; memory--
				BNE clear
				MOV R5, #64				; for loop = 64 
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
				B clear
								
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
				B clear
				
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
				B clear								

finish          POP {R0-R7,LR}
                BX  LR
				ALIGN
                END
[21:13, 1/20/2019] Çagnur Tekerekoglu: ;********************* 
; cursor.s  
; This program gets (X,Y) coordinates from R7 and R8. 
; Displays the cursor on the screen according to (X,Y).
;*********************	
;********************* 
; EQU Directives
; These directives do not allocate memory
;*********************
;LABEL			DIRECTIVE	VALUE		COMMENT
DC            	EQU  0x40004100 
SSI0_SR_R       EQU  0x4000800C 
SSI0_DR_R       EQU  0x40008008 
X				EQU  0x87
Y				EQU  0x41
memory			EQU	 0x20000504
offset_memory	EQU  0x20000604
;*********************
; Program section					      
;*********************
;LABEL			DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
                EXPORT    	clear_SRAM_mine		; Make available
              
clear_SRAM_mine
                PUSH {R0-R7,LR}
				
				MOV32 R2, memory
				MOV32 R4, offset_memory
				MOV R5, #64				; for loop = 64 	
				MOV	R6, #4				; change Y
				MOV R7, #0
clear			STRB R7, [R2], #1
				SUBS R5, #1					; memory--
				BNE clear
				MOV R5, #64				; for loop = 64 
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
				B clear
								
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
				B clear
				
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
				B clear								

finish          POP {R0-R7,LR}
                BX  LR
				ALIGN
                END