; 
;*********************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.
DC                     EQU  0x40004100 
SSI0_SR_R              EQU  0x4000800C 
SSI0_DR_R              EQU  0x40008008 
SYSCTRL 				EQU 0xE000E010

;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT  	MySysTick				; Make available	
			IMPORT 		DELAY100


MySysTick	PROC		
		
			PUSH{LR}
			; This becomes SysTick Handler
			; It uses R0,R1 and R10
check		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ check
			MOV32 R0, DC 	;dc_command  
			MOV R1, #0		; 0 because we coordinate
			STR R1, [R0]
			; set the direction of the clock X=0x45, Y = 000 (bank0)
			MOV32 R0,SSI0_DR_R
			MOV R1, #0x40				;  CURSOR RESET Y=0
			STR R1, [R0]
			MOV R1, #0xC7				; X = 0b_1100_0101
			STR R1, [R0]
			
check2		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ check2
			MOV32 R0, DC 			; dc_command  
			MOV R1, #0x40			; make DC 1 because we display 1-20 instead of writting in Handler I put here
			STR R1, [R0]
;			MOV R10, #1			
			
			
			
			
			MOV R1, #1
			CMP R10, R1
			BEQ one
			MOV R1, #2
			CMP R10, R1
			BEQ two
			MOV R1, #3
			CMP R10, R1
			BEQ three
			BHI jump1
			
		
			
			
			
one			MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ one

			; sent
			MOV32 R0, SSI0_DR_R
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
			ADD R10, #1    ; R10 = 2
			B endnumbers
			
			
two			MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ two

			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x84
			STR R1, [R0]
			MOV R1, #0xC2
			STR R1, [R0]
			MOV R1, #0xA1
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x8E
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1 ; 3
			B endnumbers
jump1	MOV R1, #4
		CMP R10, R1
		BEQ four
		MOV R1, #5
		CMP R10, R1
		BEQ five
		BHI jump2
three		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ three
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x42
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x6E
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1  		; R10 = 4
			B endnumbers

four		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ four
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x70
			STR R1, [R0]
			MOV R1, #0x48
			STR R1, [R0]
			MOV R1, #0x44
			STR R1, [R0]
			MOV R1, #0x42
			STR R1, [R0]
			MOV R1, #0xE1
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1			;R10 = 5
			B endnumbers		



		
five		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ five
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x4F
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x71
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1			; R10 = 6
			B endnumbers	
			
jump2	MOV R1, #6
		CMP R10, R1
		BEQ six
		MOV R1, #7
		CMP R10, R1
		BEQ seven
		BHI jump3
					
		
six			MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ six
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x7E
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x62
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1		; R10 = 7
			B endnumbers	


seven		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ seven
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0xC1
			STR R1, [R0]
			MOV R1, #0x21
			STR R1, [R0]
			MOV R1, #0x11
			STR R1, [R0]
			MOV R1, #0x9
			STR R1, [R0]
			MOV R1, #0x7
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1		; R10 = 8
			B endnumbers
jump3	MOV R1, #8
		CMP R10, R1
		BEQ eight	
		MOV R1, #9
		CMP R10, R1
		BEQ nine
		BHI jump4
			
			
eight		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ eight
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x76
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x76
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1		; R10 = 9
			B endnumbers





nine		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ nine
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x46
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x89
			STR R1, [R0]
			MOV R1, #0x76
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1		;  R10 = 10
			B endnumbers

jump4	MOV R1, #10
		CMP R10, R1
		BEQ ten
		BHI tenplus					
ten			MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ ten
			; sent
			MOV32 R0, SSI0_DR_R
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
tenpass		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ tenpass
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x7E
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x7E
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1  ; R10 = 11
			B endnumbers	

tenplus		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ tenplus
			; sent
			MOV R1, #20
			CMP R10, R1
			BEQ twenty
			BHI.W clear_end1
			
			MOV32 R0, SSI0_DR_R
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
			MOV R1, #11
			CMP R10, R1
			BEQ one
			MOV R1, #12
			CMP R10, R1
			BEQ two
			MOV R1, #13
			CMP R10, R1
			BEQ three
			MOV R1, #14
			CMP R10, R1
			BEQ four
			MOV R1, #15
			CMP R10, R1
			BEQ five		
			MOV R1, #16
			CMP R10, R1
			BEQ six
			MOV R1, #17
			CMP R10, R1
			BEQ seven
			MOV R1, #18
			CMP R10, R1
			BEQ eight
			BHI nine
			
zero		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ zero
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x7E
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x81
			STR R1, [R0]
			MOV R1, #0x7E
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			ADD R10, #1 ; 20->21
			B endnumbers			
			
twenty		MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ twenty
			MOV32 R0, DC 			; dc_command  
			MOV R1, #0x40			; make DC 1
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x84
			STR R1, [R0]
			MOV R1, #0xC2
			STR R1, [R0]
			MOV R1, #0xA1
			STR R1, [R0]
			MOV R1, #0x91
			STR R1, [R0]
			MOV R1, #0x8E
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
;			MOV R10, #0  ; R10=20->0 ; END OF THIS SECTION
			B zero			
			
clear_end1	MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ clear_end1
			MOV32 R0, DC 			; dc_command  
			MOV R1, #0x40			; make DC 1
			STR R1, [R0]
			; sent
			MOV32 R0, SSI0_DR_R
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
clear_end2	MOV32 R0,SSI0_SR_R
			LDR R1, [R0]
			AND R1, #0x10
			CMP R1, #0x10
			BEQ clear_end2
			MOV32 R0, DC 			; dc_command  
			MOV R1, #0x40			; make DC 1
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			MOV R1, #0x0
			STR R1, [R0]
			LDR R0, =SYSCTRL ; SYSTICK control and status register
			MOV R1, #0
			STR R1, [R0] ; stop counter to prevent interrupt triggered accidentally





endnumbers	

			MOV32 R0, DC 	;dc_command  
			MOV R1, #0x40		; 0 because we coordinate
			STR R1, [R0]
			
			
			
			POP{LR}
			BX LR
			ENDP
			ALIGN 
			END