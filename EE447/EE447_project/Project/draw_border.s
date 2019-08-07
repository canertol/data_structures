;*************************************************************** 
; cursor.s  
; This program gets (X,Y) coordinates from R7 and R8. 
; Displays the cursor on the screen according to (X,Y).
;***************************************************************	
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL			DIRECTIVE	VALUE		COMMENT
DC            	EQU  0x40004100 
SSI0_SR_R       EQU  0x4000800C 
SSI0_DR_R       EQU  0x40008008 

;***************************************************************
; Program section					      
;***************************************************************
;LABEL			DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
                EXPORT    	draw_borders		; Make available
              
draw_borders
			PUSH {R0-R1}
			PUSH{R6}
							
			MOV R6, #504
CLEAR		LDR R0,=SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ CLEAR
			LDR R0, =DC 			;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
		; sent
			LDR R0,=SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			SUBS R6, #1
			BNE	CLEAR
			
		
set_Xy		MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x40				;  CURSOR RESET Y=0
			STR R1, [R0]			
			
			MOV R6, #66
draw_border	LDR R0,=SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ draw_border
			LDR R0, =DC 			;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
		; sent
			LDR R0,=SSI0_DR_R
			MOV R1, #0x80
			STR R1, [R0]
			SUBS R6, #1
			BNE	draw_border
			
			MOV32 R0, SSI0_SR_R
ASD			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ ASD
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x45				;  CURSOR RESET Y=5
			STR R1, [R0]	
			
			MOV R6, #66
draw_border2 ; alt çizgi _
			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ draw_border2
			LDR R0, =DC 			;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
		; sent
			LDR R0,=SSI0_DR_R
			MOV R1, #0x01
			STR R1, [R0]
			SUBS R6, #1
			BNE	draw_border2
			
			
			; kenarlar için cursor update
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x41				;  CURSOR RESET Y=1
			STR R1, [R0]				

			MOV R2, #1
			MOV R3, #3
;********************************************************* right-left border
draw_border3 ; | |
			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ draw_border3
			LDR R0, =DC 			;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R       ; |
			MOV R1, #0xFF
			STR R1, [R0]
			
sdf			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ sdf
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0xC6				; CURSOR RESET X=60+
			STR R1, [R0]

		; sent
sdf1		MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ sdf1
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0x40
			STR R1, [R0]
			LDR R0,=SSI0_DR_R			;|
			MOV R1, #0xFF
			STR R1, [R0]
			ADD R2, #1
			CMP R2, #5
			BEQ pass
			CMP R3, R2
			BEQ Y4
			BLO Y3
			BHI Y5
			; DRAWBORDER END
			
			
			;change Y

Y3			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ Y3
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x42				;  CURSOR RESET Y=2
			STR R1, [R0]
			B draw_border3
			
Y4			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ Y4
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x43				;  CURSOR RESET Y=3
			STR R1, [R0]
			B draw_border3
			
Y5			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ Y5
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x85				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x44				;  CURSOR RESET Y=3
			STR R1, [R0]
			B draw_border3
;******************************************************** ; Mission is completed for borders :D			
pass	
			MOV32 R0, SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ pass
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x86				; CURSOR RESET X=5
			STR R1, [R0]
			MOV R1, #0x41				;  CURSOR RESET Y=3
			STR R1, [R0]

donee	        POP {R0-R1,R6}			
                BX  LR
				ALIGN
                END
