;*************************************************************** 
; space.s  
; This program displays one line of space.
;***************************************************************	
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL			    DIRECTIVE	VALUE		COMMENT
DC            	EQU  0x40004100 
SSI0_SR_R       EQU  0x4000800C 
SSI0_DR_R       EQU  0x40008008 
;***************************************************************
; Program section					      
;***************************************************************
;LABEL			    DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
                EXPORT  	space	  	; Make available


space 		      PUSH {R0-R12,LR}
               
loop            LDR R0,=SSI0_SR_R
                LDR R1, [R0]
                AND R1, #0x10
                CMP R1, #0x10
                BEQ loop
                LDR R0, =DC 			  ;dc_command  
                MOV R1, #0x40 
                STR R1, [R0]
             ; sent
                LDR R0,=SSI0_DR_R
                MOV R1, #0x0
                STR R1, [R0]
                SUBS R6, #1
                BNE  loop
                
                POP {R0-R12,LR}
                BX  LR                
                END
