SYSCTRL 	EQU 0xE000E010

;***************************************************************
; Program section					      
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT 		timer	; Reference external subroutine	

			
timer		PROC
			LDR R7, =SYSCTRL ; SYSTICK control and status register
			MOV R8, #0
			STR R8, [R7] ; stop counter to prevent interrupt triggered accidentally
			LDR R8, =19999999; trigger every XXX cycles - set this value
			STR R8, [R7,#4] ; write reload value to reload value register
			STR R8, [R7,#8] ; write any value to current value
			MOV R8, #0x3 ; enable interrupt, enable SYSTICK counter
			STR R8, [R7] ; start counter
			BX LR
			ENDP

;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
			ALIGN
			END
