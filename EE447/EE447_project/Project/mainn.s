;*************************************************************** 
; mainn.s  
; BATTLESHIP GAME 2019
; Authors: Cagnur Tekerekoglu - cagnurtekerekoglu@gmail.com
; 	   Caner  Tol 	      - m.canertol@gmail.com
; Middle East Technical University, Ankara, TURKEY
;***************************************************************	
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL			DIRECTIVE	VALUE		COMMENT
; ADC0 base address 	EQU 0x40038000
DC                    	EQU  0x40004100 
SSI0_SR_R             	EQU  0x4000800C 
SSI0_DR_R              	EQU  0x40008008 
ADC0_RIS 				EQU  0x40038004 		; Interrupt status
;ADC0_SSFIFO3 		EQU  0x400380A8 		; Channel 3 results
ADC0_PSSI 				EQU  0x40038028 		; Initiate sample
ADC0_ISC				EQU  0x4003800C 		; Interrupt Status and Clear
ADC0_SSFIFO3 	  		EQU  0x400380A8 		; Channel 2 results
ADC1_RIS 	       		EQU  0x40039004 ; Interrupt status
ADC1_PSSI 	       		EQU  0x40039028 ; Initiate sample
ADC1_SSFIFO3 	   		EQU  0x400390A8 ; Channel 3 results
ADC1_ISC	       		EQU  0x4003900C ; Interrupt Status and Clear	
state_memory			EQU	 0x20000004	
xy_memory				EQU	 0x2000000C ; Y 
;***************************************************************
; Program section					      
;***************************************************************
;LABEL			DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			IMPORT 		INIT
			IMPORT 		DELAY100
			IMPORT		cursor
			IMPORT		cursor2
			IMPORT		ship_load
			IMPORT		draw_borders
			IMPORT 		clear_SRAM
			IMPORT      clear_SRAM_mine
			IMPORT 		clear_cursor
			IMPORT		timer
			IMPORT 		mine_load
			EXPORT  	__main		; Make available
			
			
__main
start		BL INIT

BUSY10		LDR R0,=SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ BUSY10
			LDR R0, =DC 			;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent 0x20
			LDR R0,=SSI0_DR_R
			MOV R1, #0x20			; H=0
			STR R1, [R0]
			PUSH {LR}
			BL clear_SRAM
			POP {LR}
			PUSH {LR}
			BL clear_SRAM_mine
			POP {LR}
			MOV R1, #1
			LDR R0, =state_memory
			STR R1, [R0] 			; 4 BYTE YER TEMIZLENDI
			PUSH {LR}
			BL draw_borders
			POP {LR}

			
SmplXY		
		
init_XY		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			ANDS R1, R1, #0x10
			BNE init_XY
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
				; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x86				; CURSOR RESET X=6
			STR R1, [R0]
			MOV R1, #0x41				;  CURSOR RESET Y=1
			STR R1, [R0]
			PUSH {LR}
			BL DELAY100
			POP {LR}
			MOV32 R0, state_memory
			LDRB R0, [R0]
			CMP	R0, #1
			BNE jump0
			PUSH {LR}
			BL ship_load
			POP {LR}
			B sadas
			; x 
			; start sampling routine
			; initiate sampling by enabling SS3 in ADC0_PSSI
jump0		PUSH {LR}	
			BL mine_load
			POP {LR}

sadas		LDR R1, =ADC0_PSSI 		; sample sequence initiate address
			LDR R0, [R1]
			ORR R0, R0, #0x08 		; set bit 3 for SS3
			STR R0, [R1]
			; check for sample complete (bit 2 of ADC0_RIS set)
			LDR R1, =ADC0_RIS 		; interrupt address
ContX 		LDR R0, [R1]
			ANDS R0, R0, #0x8 
			BEQ ContX
			;branch fails if the flag is set so data can be read and flag is cleared
			LDR R1,	=ADC0_ISC
			MOV R0, #0x4 
			STR R0, [R1] 			; clear flag
			; save cursor position in R7 with 6 bits
			LDR R1, =ADC0_SSFIFO3 		; result address
			LDR R11,[R1]		; read cursor X (sample from AIN0)
			LSR R11, #6			; 6 bits X address
			CMP	R11, #58
			BLO	setX
			MOV R11, #58
			
			
		
setX		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			ANDS R1, R1, #0x10
			BNE setX	
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
;			;left
;			MOV32 R0, SSI0_DR_R
;			MOV R1, #0x86	
;			ADD R1, R11
;			SUB R1, #1
;			STR R1, [R0]
;			BL clear_cursor
;			;right
;			MOV32 R0, SSI0_DR_R
;			MOV R1, #0x86	
;			ADD R1, R11
;			ADD R1, #1
;			STR R1, [R0]
;			BL clear_cursor
			; main one 
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x86	
			ADD R1, R11
			STR R1, [R0]			
			
			
			; Y 
			; start sampling routine
			; initiate sampling by enabling SS3 in ADC0_PSSI
			LDR R1, =ADC1_PSSI 		; sample sequence initiate address
			LDR R0, [R1]
			ORR R0, R0, #0x08 		; set bit 3 for SS3
			STR R0, [R1]
			; check for sample complete (bit 2 of ADC0_RIS set)
			LDR R1, =ADC1_RIS 		; interrupt address
ContY 		LDR R0, [R1]
			ANDS R0, R0, #0x8 
			BEQ ContY
			;branch fails if the flag is set so data can be read and flag is cleared
			LDR R1,	=ADC1_ISC
			MOV R0, #0x4 
			STR R0, [R1] 			; clear flag
			; save cursor position in R12 with 3 bits
			LDR R1, =ADC1_SSFIFO3 		; result address
			LDR R12,[R1]		; read cursor Y (sample from AIN1)
			
			CMP	R12, #0x400
			MOVLO R3, #0x41 	; set Y=1
			BLO setY
			CMP R12, #0xC00
			MOVHI R3, #0x44  	; set Y=4
			BHI setY
			CMP R12, #0x800
			MOVHI R3, #0x43		; set Y=3
			MOVLO R3, #0x42	 	; set Y=2
				

setY		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			ANDS R1, R1, #0x10
			BNE setY
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			;  Y CURSOR RESET 
			STR R3, [R0]
			MOV32 R0, xy_memory
			STRB R3, [R0]
;			MOV32 R0, cursor_memory
;			STRB R3, [R0], #1
			MOV32 R0, state_memory
			LDRB R0, [R0]
			CMP	R0, #1
			BNE jump
			PUSH {LR}	
			BL  cursor
			POP {LR}	
			B 	jump
			
jump		CMP	R0, #16
			BNE jumpp
			PUSH {LR}	
			BL cursor
			POP {LR}	
			
jumpp		LSR R2,R12, #7				
			MOV	R1, #8
			UDIV R0, R2, R1
			MUL	R1, R0
			SUB	R0, R2, R1
			CMP R0, #2
			BEQ.W	SmplXY
			CMP R0, #3
			BEQ.W SmplXY
			CMP R0, #4
			BEQ.W SmplXY
			CMP R0, #5
			BEQ.W cursor_shift
			CMP R0, #6
			BEQ.W cursor_shift
			CMP R0, #7
			BEQ.W cursor_shift
			CMP R0, #0
			BEQ.W cursor_shift
			CMP R0, #1
			BEQ.W SmplXY
			B.W SmplXY
			
cursor_shift 
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]

shift_x		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			ANDS R1, R1, #0x10
			BNE shift_x
			ANDS R1, R1, #0x10
			BNE shift_x
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x86	
			ADD R1, R11				; CURSOR RESET X=6
			STR R1, [R0]
			
shift_y		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			ANDS R1, R1, #0x10
			BNE shift_y
			ANDS R1, R1, #0x10
			BNE shift_y
			MOV32 R0, SSI0_DR_R
			ADD R3, #1				;  CURSOR RESET Y=4
			STR R3, [R0]

			
			CMP R3, #0x45
			BEQ	SmplXY
			CMP R3, #0x46
			BEQ	SmplXY
			CMP R3, #0x40
			BEQ	SmplXY
			NOP
			NOP
			LDR R0, =DC 	;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
			NOP
			MOV32 R0, state_memory
			LDRB R0, [R0]
			CMP	R0, #1
			BNE jumpX
			PUSH {LR}	
			BL  cursor2
			POP {LR}	
			B 	jumpX
			
jumpX		CMP	R0, #16
			BNE jumppX
			PUSH {LR}	
			BL cursor2
			POP {LR}	
			
jumppX		; print lower part of the cursor
			NOP
			NOP
			B SmplXY
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			


done		B done

			ALIGN
			END
