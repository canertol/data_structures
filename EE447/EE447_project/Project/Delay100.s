;***************************************************************
; Program section					      
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA    	main, READONLY, CODE
			THUMB
			EXPORT 		DELAY100	; Reference external subroutine	

			
DELAY100	PROC
			PUSH{LR, R7}
			LDR R7, =0x00061A7F
wait		SUBS R7,#1
			CMP R7, #0
			BNE wait
			POP{LR, R7}
			BX LR
			ENDP

;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
			ALIGN
			END
