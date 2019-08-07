 
;***************************************************************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.
DC                     EQU  0x40004100 
SSI0_SR_R              EQU  0x4000800C 
SSI0_DR_R              EQU  0x40008008 

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT  	numbers				; Make available	


numbers	PROC		
		
	    PUSH{LR}
		; This becomes SysTick Handler
		; It uses R0,R1 and R12
check	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ check
		LDR R0, =DC 	;dc_command  
		MOV R1, #0		; 0 because we coordinate
		STR R1, [R0]
		; set the direction of the clock X=0x45, Y = 000 (bank0)
		LDR R0,=SSI0_DR_R
		MOV R1, #0x40				;  CURSOR RESET Y=0
		STR R1, [R0]
		MOV R1, #0xC5				; X = 0b_1100_0101
		STR R1, [R0]
		
;		MOV R1, #1
;		CMP R12, R1
;		BEQ one
;		MOV R1, #2
;		CMP R12, R1
;		BEQ two
;		MOV R1, #3
;		CMP R12, R1
;		BEQ three
;		BHI jump1
;		
;		
check2	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ check2
		LDR R0, =DC 			; dc_command  
			MOV R1, #0x40			; make DC 1 because we display 1-20 instead of writting in Handler I put here
			STR R1, [R0]
			MOV R12, #1
one			LDR R0,=SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ one

			; sent
			LDR R0, =SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x04
			STR R1, [R0]
			MOV R1, #0x02
			STR R1, [R0]
			MOV R1, #0xFF
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R12, #1
			B endnumbers
			
;			
;two			LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ two

;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x84
;			STR R1, [R0]
;			MOV R1, #0xC2
;			STR R1, [R0]
;			MOV R1, #0xA1
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x8E
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers

;three		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ three
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x42
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x6E
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers

;four		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ four
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x70
;			STR R1, [R0]
;			MOV R1, #0x48
;			STR R1, [R0]
;			MOV R1, #0x44
;			STR R1, [R0]
;			MOV R1, #0x42
;			STR R1, [R0]
;			MOV R1, #0xE1
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers		


;jump1	MOV R1, #4
;		CMP R12, R1
;		BEQ four
;		MOV R1, #5
;		CMP R12, R1
;		BEQ five		
;		MOV R1, #6
;		CMP R12, R1
;		BEQ six
;		MOV R1, #7
;		CMP R12, R1
;		BEQ seven
;		MOV R1, #8
;		CMP R12, R1
;		BEQ eight
;		BHI jump2
;		
;five		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ five
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x4F
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x71
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers	
;			

;					
;		
;six			LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ six
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x7E
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x62
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers	


;seven		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ seven
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0xC1
;			STR R1, [R0]
;			MOV R1, #0x21
;			STR R1, [R0]
;			MOV R1, #0x11
;			STR R1, [R0]
;			MOV R1, #0x9
;			STR R1, [R0]
;			MOV R1, #0x7
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers
;			
;			
;eight		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ eight
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x76
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x76
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers

;jump2	MOV R1, #9
;		CMP R12, R1
;		BEQ nine
;		MOV R1, #10
;		CMP R12, R1
;		BEQ ten
;		BHI tenplus



;nine		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ nine
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x46
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x89
;			STR R1, [R0]
;			MOV R1, #0x76
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B endnumbers
;			
;zero	LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ zero
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x7E
;			STR R1, [R0]
;			MOV R1, #0x81
;			STR R1, [R0]
;			MOV R1, #0x81
;			STR R1, [R0]
;			MOV R1, #0x81
;			STR R1, [R0]
;			MOV R1, #0x7E
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			B endnumbers
;			
;ten			LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ ten
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x04
;			STR R1, [R0]
;			MOV R1, #0x02
;			STR R1, [R0]
;			MOV R1, #0xFF
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			ADD R12, #1
;			B zero	

;tenplus		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ tenplus
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x04
;			STR R1, [R0]
;			MOV R1, #0x02
;			STR R1, [R0]
;			MOV R1, #0xFF
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #11
;			CMP R12, R1
;			BEQ one
;			MOV R1, #12
;			CMP R12, R1
;			BEQ two
;			MOV R1, #13
;			CMP R12, R1
;			BEQ three
;			MOV R1, #14
;			CMP R12, R1
;			BEQ four
;			MOV R1, #15
;			CMP R12, R1
;			BEQ five		
;			MOV R1, #16
;			CMP R12, R1
;			BEQ six
;			MOV R1, #17
;			CMP R12, R1
;			BEQ seven
;			MOV R1, #18
;			CMP R12, R1
;			BEQ eight
;			MOV R1, #19
;			CMP R12, R1
;			BEQ nine
;			BHI twenty
;			
;			
;twenty		LDR R0,=SSI0_SR_R
;			LDR R1, [R0]
;			AND R1, #0x10
;			CMP R1, #0x10
;			BEQ two
;			LDR R0, =DC 			; dc_command  
;			MOV R1, #0x40			; make DC 1
;			STR R1, [R0]
;			; sent
;			LDR R0,=SSI0_DR_R
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R1, #0x84
;			STR R1, [R0]
;			MOV R1, #0xC2
;			STR R1, [R0]
;			MOV R1, #0xA1
;			STR R1, [R0]
;			MOV R1, #0x91
;			STR R1, [R0]
;			MOV R1, #0x8E
;			STR R1, [R0]
;			MOV R1, #0x0
;			STR R1, [R0]
;			MOV R12, #0  ; R12=20->0 ; END OF THIS SECTION
;			B zero			

endnumbers
			POP{LR}
			BX LR
			ENDP
			ALIGN 
			END
