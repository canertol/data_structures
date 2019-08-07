; 
;***************************************************************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.
GPIO_PORTF_DIR_R       EQU  0x40025400 
GPIO_PORTF_IS_R        EQU  0x40025404 
GPIO_PORTF_IEV_R       EQU  0x4002540C
GPIO_PORTF_IM_R        EQU  0x40025410
GPIO_PORTF_RIS_R       EQU  0x40025414
GPIO_PORTF_MIS_R       EQU  0x40025418
GPIO_PORTF_ICR_R       EQU  0x4002541C    	
GPIO_PORTF_AFSEL_R     EQU  0x40025420
GPIO_PORTF_PUR_R       EQU  0x40025510 	
GPIO_PORTF_PDR_R       EQU  0x40025514
GPIO_PORTF_LOCK_R      EQU  0x40025520
GPIO_PORTF_CR_R 	   EQU  0x40025524	
GPIO_PORTF_DEN_R       EQU  0x4002551C 
GPIO_PORTF_AMSEL_R     EQU  0x40025528 
GPIO_PORTF_PCTL_R      EQU  0x4002552C
	
DC                     EQU  0x40004100 
SSI0_SR_R              EQU  0x4000800C 
SSI0_DR_R              EQU  0x40008008 
state_memory			EQU	 0x20000004
	
xy_memory		EQU	 0x2000000C ; Y 
;n						EQU 0x20000008	
;**************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT  	My_GPIOPortF_Handler				; Make available	
			IMPORT 		DELAY100
			IMPORT		mine_load
			IMPORT      put_battle
			IMPORT		put_civil
			IMPORT		timer
			IMPORT		ship_load


My_GPIOPortF_Handler 				
					PUSH{LR}
					;BL DELAY100
check_state			LDR R0, =state_memory
					LDR R1, [R0]
					CMP R1, #1
					BEQ.W state_1
					CMP R1, #2
					BEQ.W state_2
					CMP R1, #4
					BEQ.W state_3
					CMP R1, #8
					BEQ.W state_4
					B.W finish
			
state_1 	
			
which_button
			MOV32 R0, GPIO_PORTF_MIS_R
			LDR R1, [R0]
			ANDS R2, R1, #0x1
			BNE put__battle			; battleship is selected
			ANDS R2, R1, #0x10
			BNE put__civil			; civillian is selectecd
			
put__battle	; memorye yerlestir
			MOV32 R1, xy_memory
			LDRB R12, [R1]
			AND R12, #0xF
			CMP R12, #4
			BEQ.W finish
			PUSH {LR}
			BL	put_battle
			POP {LR}
			B.W finish_1

put__civil	; memorye yerlestir
			MOV32 R1, xy_memory
			LDRB R12, [R1]
			AND R12, #0xF
			CMP R12, #4
			BEQ.W finish
			PUSH {LR}
			BL	put_civil
			POP {LR}
			B.W finish_1
			
			
finish_1	LDR R0, =state_memory
			LDR R1, [R0]
			LSL R1, #1		;1->2
			STR R1, [R0]
			B.W finish

			
state_2
				PUSH {LR}
				BL 	mine_load
				POP {LR}
finish_2		LDR R0, =state_memory
				LDR R1, [R0]
				LSL R1, #1		;2->4
				STR R1, [R0]
				B.W finish
				
				
state_3			;timer ayarlanacak
				PUSH {LR}
				BL ship_load
				POP {LR}
				MOV R1, #5
gogo			PUSH {LR}
				BL DELAY100
				POP {LR}
				SUBS R1, #1
				BNE gogo
				PUSH {LR}
				BL mine_load
				POP {LR}
				
				
finish_3		LDR R0, =state_memory
				LDR R1, [R0]
				LSL R1, #1		;4->8
				STR R1, [R0]
				B.W finish			


state_4		;Systick Initializer
			MOV32 R0, DC 			; dc_command  
			MOV R1, #0x40			; make DC 1 because we display 1-20 instead of writting in Handler I put here
			STR R1, [R0]
			MOV R10, #1
			PUSH {LR}
			BL timer
			POP {LR}
			; Systick depends on R10 When R10 is bigger than 0, it starts

			;herhangi birinne basilmasi yeter
			MOV32 R0, GPIO_PORTF_MIS_R
			LDR R1, [R0]
			ANDS R2, R1, #0x11
			BNE put_mine			; battleship is selected
			BEQ finish_4
put_mine				
				
				
finish_4		LDR R0, =state_memory
				MOV R1, #16  ;8->1
				STR R1, [R0]
				B.W finish	



			
			
			; interrupt clear
finish		MOV32 R0, GPIO_PORTF_ICR_R
			MOV R1, #0x11
			STR R1, [R0]			

						
			POP{LR}
			BX LR
			
			ALIGN 
			END
