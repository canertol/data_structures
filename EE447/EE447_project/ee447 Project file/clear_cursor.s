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
                EXPORT    	clear_cursor		; Make available
              
clear_cursor
                PUSH {R0-R1,LR}
setX			MOV32 R0, SSI0_SR_R
				LDR R1, [R0]
				AND R1, #0x10
				CMP R1, #0x10
				BEQ setX	
				MOV32 R0, DC 	;dc_command  
				MOV R1, #0x40
				STR R1, [R0]
				MOV32 R0, SSI0_DR_R
				MOV R1, #0
				STR R1, [R0]
				
done	        POP {R0-R1,LR}
                BX  LR
				ALIGN
                END
