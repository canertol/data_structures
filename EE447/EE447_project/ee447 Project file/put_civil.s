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
X				EQU  0x87
Y				EQU  0x41
memory			EQU	 0x20000400
offset_memory	EQU  0x20000500
case_memory		EQU  0x20000008	
xy_memory		EQU	 0x2000000C ; Y 
;***************************************************************
; Program section					      
;***************************************************************
;LABEL			DIRECTIVE	VALUE	   	COMMENT
                AREA    	main, READONLY, CODE
                THUMB
				IMPORT 		DELAY100
                EXPORT    	put_civil		; Make available
              
put_civil

                PUSH {R0-R12,LR}
				MOV32 R0, memory
				MOV32 R1, xy_memory
				LDRB R12, [R1]
				AND R12, #0xF
				ADD R11, #1
				MUL R3, R12, R11
				ADD R3, R0
				
				
				MOV32 R1, case_memory
				LDR R0, [R1]
				CMP R0, #1
				BEQ.W case_one
				CMP R0, #2
				BEQ.W case_two
				CMP R0, #3
				BEQ.W case_three
				CMP R0, #4
				BEQ.W case_four
				CMP R0, #5
				BEQ.W case_five
				CMP R0, #6
				BEQ.W case_six
				CMP R0, #7
				BEQ.W case_seven
				CMP R0, #8
				BEQ.W case_eight
				
				B 	finish
				       
case_one        MOV R0, R3
                MOV R1, #0xF8
                STR R1, [R0] , #1
                MOV R1, #0xF8
                STR R1, [R0] , #1
				MOV R1, #0xF8
                STR R1, [R0] , #1
				MOV R1, #0xF8
                STR R1, [R0] , #1
				
              
				ADD R0, #60
			  
				MOV R1, #0x07
                STR R1, [R0] , #1
				MOV R1, #0x07
                STR R1, [R0] , #1
				MOV R1, #0x07
                STR R1, [R0] , #1
				MOV R1, #0x07
                STR R1, [R0] , #1
				MOV R1, #0x07
                
				
				B finish
				
                
case_two       	MOV R0, R3
				MOV R1, #0xF0
                STR R1, [R0] , #1
				MOV R1, #0xF0
                STR R1, [R0] , #1
				MOV R1, #0xF0
                STR R1, [R0] , #1
				MOV R1, #0xF0
                STR R1, [R0] , #1
				
				
				; OFFSET
				ADD R0, #60
				
				MOV R1, #0x0F
                STR R1, [R0] , #1
				MOV R1, #0x0F
                STR R1, [R0] , #1
				MOV R1, #0x0F
                STR R1, [R0] , #1
				MOV R1, #0x0F
                STR R1, [R0] , #1
				
				
				B finish
				
case_three     	MOV R0, R3
				MOV R1, #0xE0
                STR R1, [R0] , #1
                MOV R1, #0xE0
                STR R1, [R0] , #1
				MOV R1, #0xE0
                STR R1, [R0] , #1
				MOV R1, #0xE0
                STR R1, [R0] , #1
				
;				OFFSET
				ADD R0, #60
						
				
				MOV R1, #0x1F
                STR R1, [R0] , #1
				MOV R1, #0x1F
                STR R1, [R0] , #1
				MOV R1, #0x1F
                STR R1, [R0] , #1
				MOV R1, #0x1F
                STR R1, [R0] , #1
				
				
				B finish
				
				
case_four     	MOV R0, R3
				MOV R1, #0xC0
                STR R1, [R0] , #1
                MOV R1, #0xC0
                STR R1, [R0] , #1
				MOV R1, #0xC0
                STR R1, [R0] , #1
				MOV R1, #0xC0
                STR R1, [R0] , #1
				
				
				; OFFSET
				ADD R0, #60
				
				MOV R1, #0x3F
                STR R1, [R0] , #1
				MOV R1, #0x3F
                STR R1, [R0] , #1
				MOV R1, #0x3F
                STR R1, [R0] , #1
				MOV R1, #0x3F
                STR R1, [R0] , #1
			
								
				B finish	
				
                                  
case_five     	
				MOV R0, R3
				MOV R1, #0x80
                STR R1, [R0] , #1
				MOV R1, #0x80
                STR R1, [R0] , #1
				MOV R1, #0x80
                STR R1, [R0] , #1
				MOV R1, #0x80
                STR R1, [R0] , #1
								
				; OFFSET
				ADD R0, #60
				
				MOV R1, #0x7F
                STR R1, [R0] , #1
				MOV R1, #0x7F
                STR R1, [R0] , #1
				MOV R1, #0x7F
                STR R1, [R0] , #1
				MOV R1, #0x7F
                STR R1, [R0] , #1
			
			
                B finish					
				
				
case_six    	MOV R0, R3
				MOV R1, #0xFF
                STR R1, [R0] , #1
				MOV R1, #0xFF
                STR R1, [R0] , #1
				MOV R1, #0xFF
                STR R1, [R0] , #1
				MOV R1, #0xFF
                STR R1, [R0] , #1
				
				
				
				B finish	
				
case_seven   	MOV R0, R3
				MOV R1, #0xFE
                STR R1, [R0] , #1
				MOV R1, #0xFE
                STR R1, [R0] , #1
				MOV R1, #0xFE
                STR R1, [R0] , #1
				MOV R1, #0xFE
                STR R1, [R0] , #1
				
				; OFFSET
				ADD R0, #60
				
				MOV R1, #0x01
                STR R1, [R0] , #1
				MOV R1, #0x01
                STR R1, [R0] , #1
				MOV R1, #0x01
                STR R1, [R0] , #1
				MOV R1, #0x01
                STR R1, [R0] , #1
				

               
				B finish					
				
case_eight     	MOV R0, R3
				MOV R1, #0xFC
                STR R1, [R0] , #1
				MOV R1, #0xFC
                STR R1, [R0] , #1
				MOV R1, #0xFC
                STR R1, [R0] , #1
				MOV R1, #0xFC
                STR R1, [R0] , #1
				
				
				; OFFSET
				ADD R0, #60
				
				MOV R1, #0x03
                STR R1, [R0] , #1
				MOV R1, #0x03
                STR R1, [R0] , #1
				MOV R1, #0x03
                STR R1, [R0] , #1
				MOV R1, #0x03
                STR R1, [R0] , #1
				
				
				B finish


finish          POP {R0-R12,LR}
                BX  LR
				ALIGN
                END		
				
				
				
				
				B   finish


finish          POP {R0-R12,LR}
                BX  LR
				ALIGN
                END
