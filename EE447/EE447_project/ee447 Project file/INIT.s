;***************************************************************
;LABEL		       DIRECTIVE	VALUE		COMMENT
; ADC0 base address EQU 0x40038000
SCREENW     	       EQU  84
SCREENH     	       EQU  48
DC                     EQU  0x40004100 
DC_COMMAND             EQU  0
DC_DATA                EQU  0x40
RESET                  EQU  0x40004200 
RESET_LOW              EQU  0
RESET_HIGH             EQU  0x80
GPIO_PORTA_DIR_R       EQU  0x40004400 
GPIO_PORTA_AFSEL_R     EQU  0x40004420 
GPIO_PORTA_DEN_R       EQU  0x4000451C 
GPIO_PORTA_AMSEL_R     EQU  0x40004528 
GPIO_PORTA_PCTL_R      EQU  0x4000452C 
GPIO_PORTA_PUR_R       EQU  0x40004510

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
GPIO_PORTF_IBE_R		EQU 	0x40025408
NVIC 				EQU 0xE000E100
	
SSI0_CR0_R             EQU  0x40008000 
SSI0_CR1_R             EQU  0x40008004 
SSI0_DR_R              EQU  0x40008008 
SSI0_SR_R              EQU  0x4000800C 
SSI0_CPSR_R            EQU  0x40008010 
SSI0_CC_R              EQU  0x40008FC8 
SSI_CR0_SCR_M          EQU 0x0000FF00  ; SSI Serial Clock Rate
SSI_CR0_SPH            EQU 0x00000080  ; SSI Serial Clock Phase
SSI_CR0_SPO            EQU 0x00000040  ; SSI Serial Clock Polarity
SSI_CR0_FRF_M          EQU 0x00000030  ; SSI Frame Format Select
SSI_CR0_FRF_MOTO       EQU 0x00000000  ; Freescale SPI Frame Format
SSI_CR0_DSS_M          EQU 0x0000000F  ; SSI Data Size Select
SSI_CR0_DSS_8          EQU 0x00000007  ; 8-bit data
SSI_CR1_MS             EQU 0x00000004  ; SSI Master/Slave Select
SSI_CR1_SSE            EQU 0x00000002  ; SSI Synchronous Serial Port
; Enable
SSI_SR_BSY             EQU 0x00000010  ; SSI Busy Bit
SSI_SR_TNF             EQU 0x00000002  ; SSI Transmit FIFO Not Full
SSI_CPSR_CPSDVSR_M     EQU 0x000000FF  ; SSI Clock Prescale Divisor
SSI_CC_CS_M            EQU 0x0000000F  ; SSI Baud Clock Source
SSI_CC_CS_SYSPLL       EQU 0x00000000  ; Either the system clock (if the
; PLL bypass is in effect) or the
; PLL output (default)
SYSCTL_RCGC1_R         EQU  0x400FE104 
SYSCTL_RCGC2_R         EQU  0x400FE108 
SYSCTL_RCGC1_SSI0      EQU  0x00000010  ; SSI0 Clock Gating Control
SYSCTL_RCGC2_GPIOA     EQU  0x00000001  ; port A Clock Gating Control	       
;ADC EQUs
; ADC Registers
RCGCADC 	       EQU 0x400FE638 ; ADC clock register
; ADC0 base address EQU 0x40038000
ADC0_ACTSS 	       EQU 0x40038000 ; Sample sequencer (ADC0 base address)
ADC0_RIS 	       EQU 0x40038004 ; Interrupt status
ADC0_IM 	       EQU 0x40038008 ; Interrupt select
ADC0_EMUX 	       EQU 0x40038014 ; Trigger select
ADC0_PSSI 	       EQU 0x40038028 ; Initiate sample
ADC0_SSMUX3 	       EQU 0x400380A0 ; Input channel select
ADC0_SSCTL3 	       EQU 0x400380A4 ; Sample sequence 3 control
ADC0_SSFIFO3 	       EQU 0x400380A8 ; Channel 3 results
ADC0_SSMUX2 	       EQU 0x40038080 ; Input channel select
ADC0_PC 	       EQU 0x40038FC4 ; Sample rate
ADC0_ISC	       EQU 0x4003800C ; Interrupt Status and Clear 
; ADC1 base address EQU 0x40039000
ADC1_ACTSS 	       EQU 0x40039000 ; Sample sequencer (ADC1 base address)
ADC1_RIS 	       EQU 0x40039004 ; Interrupt status
ADC1_IM 	       EQU 0x40039008 ; Interrupt select
ADC1_EMUX 	       EQU 0x40039014 ; Trigger select
ADC1_PSSI 	       EQU 0x40039028 ; Initiate sample
ADC1_SSMUX3 	       EQU 0x400390A0 ; Input channel select
ADC1_SSCTL3 	       EQU 0x400390A4 ; Sample sequence 3 control
ADC1_SSFIFO3 	       EQU 0x400390A8 ; Channel 3 results
ADC1_SSMUX2 	       EQU 0x40039080 ; Input channel select
ADC1_PC 	       EQU 0x40039FC4 ; Sample rate
ADC1_ISC	       EQU 0x4003900C ; Interrupt Status and Clear 
; GPIO Registers
RCGCGPIO 	       EQU 0x400FE608 ; GPIO clock register
;PORT E base address EQU 0x40024000
PORTE_DEN 	       EQU 0x4002451C ; Digital Enable
PORTE_PCTL 	       EQU 0x4002452C ; Alternate function select
PORTE_AFSEL 	       EQU 0x40024420 ; Enable Alt functions
PORTE_AMSEL 	       EQU 0x40024528 ; Enable analog
PORTE_DIR 	       EQU 0x40024400 ; Direction 
;***************************************************************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.


;LABEL	        DIRECTIVE	VALUE		COMMENT
	        AREA    	main, READONLY, CODE
	        THUMB
	        IMPORT 		DELAY100
	        EXPORT  	INIT       ; Make available	
		
INIT	        PROC
	        PUSH{LR}
	    
;*********************SPI CONFIGURATION********STARTS******************  

;SYSCTL_RCGC1_R |= SYSCTL_RCGC1_SSI0;  // activate SSI0
		LDR R0,=SYSCTL_RCGC1_R
		LDR R1, [R0]
		ORR R1, #0x10
		STR R1, [R0]
		NOP
		NOP
		NOP		
		NOP
		NOP
;    SYSCTL_RCGC2_R |= SYSCTL_RCGC2_GPIOA; // activate port A 
;  We also use port E as a joystick 		//activate port E
		LDR R0,=SYSCTL_RCGC2_R
		LDR R1, [R0]
		ORR R1, #0x31						;activate port F for buttons
		STR R1, [R0]
		NOP
		NOP
		NOP		
		NOP
		NOP
;    delay = SYSCTL_RCGC2_R;               // allow time to finish activating


; interrupts for buttons
		MOV32 R0, GPIO_PORTF_LOCK_R
		MOV32 R1, #0x4C4F434B 		; unlock
		STR R1, [R0]
		
		MOV32 R0, GPIO_PORTF_CR_R
		MOV R1, #0x11 				; commit for PF0
		STR R1, [R0]
		
		MOV32 R0, GPIO_PORTF_DEN_R
		LDR R1, [R0]
		ORR R1, #0x11 				; enable F0 and F4
		STR R1, [R0]
		
		LDR R0,=GPIO_PORTF_AFSEL_R
		LDR R1, [R0]
		BIC R1, #0x11 				; enable F0 and F4
		STR R1, [R0]
		
		MOV32 R0,GPIO_PORTF_DIR_R
		LDR R1, [R0]
		BIC R1, #0x11 				; input F0 and F4
		STR R1, [R0]
		
		MOV32 R0, GPIO_PORTF_PUR_R		; THE PULL UP REGISTORS OF INPUT BITS ARE SET
		LDR	R1,[R0]
		AND	R1,#0x00
		ORR	R1,#0x11
		STR	R1,[R0]

		MOV32 R0,GPIO_PORTF_IM_R
		LDR R1, [R0]
		ORR R1, #0x11 				; interrupt mask F0 and F4
		STR R1, [R0]
		
		MOV32 R0,GPIO_PORTF_IS_R
		LDR R1, [R0]
		BIC R1, #0x11 				; edge sensitivity F0 and F4
		STR R1, [R0]
		
		MOV32 R0,GPIO_PORTF_IBE_R
		LDR R1, [R0]
		BIC R1, #0x11 				; not both edges F0 and F4
		STR R1, [R0]
		
		MOV32 R0,GPIO_PORTF_IEV_R
		LDR R1, [R0]
		ORR R1, #0x11 				; rising edge F0 and F4
		STR R1, [R0]
		
		MOV32 R0,GPIO_PORTF_ICR_R
		LDR R1, [R0]
		ORR R1, #0x11 				; rising edge F0 and F4
		STR R1, [R0]
		
		MOV32 R0,NVIC
		LDR R1, [R0]
		ORR R1, #0x40000000				; NVIC
		STR R1, [R0]
		
			
		
;    GPIO_PORTA_DIR_R |= 0xC0;             // make PA2,3,5,6,7 out  (2=clk, 3=CSE, 5=SDin, 6=D/C, 7=Reset)
		LDR R0,=GPIO_PORTA_DIR_R
		LDR R1, [R0]
		ORR R1, #0xEC		
		STR R1, [R0]		
;    GPIO_PORTA_AFSEL_R &= ~0xC0;          // disable alt funct on PA6,7
		LDR R0,=GPIO_PORTA_AFSEL_R
		LDR R1, [R0]
		BIC R1, #0xC0
		STR R1, [R0]
;    GPIO_PORTA_AFSEL_R |= 0x2C;           // enable alt funct on PA2,3,5
		LDR R0,=GPIO_PORTA_AFSEL_R
		LDR R1, [R0]
		ORR R1, #0x2C
		STR R1, [R0]

;    GPIO_PORTA_PCTL_R = (GPIO_PORTA_PCTL_R&0x00FFFFFF)+0x00000000;
		LDR R0,=GPIO_PORTA_PCTL_R
		LDR R1, [R0]
		LDR R2, =0xFF0F00FF
		BIC R1, R2
		LDR R2, =0x00202200  ; PA2,3,5
		ORR R2, R1
		STR R1, [R0]
		
;    GPIO_PORTA_DEN_R |= 0xEC;             // enable digital I/O on PA2,3,5,6,7
		LDR R0,=GPIO_PORTA_DEN_R
		LDR R1, [R0]
		ORR R1, #0xEC 
		STR R1, [R0]
		
; 	 GPIO pull up 							// pull-up which are also AFSEL PA2,3,5
		LDR R0,=GPIO_PORTA_PUR_R
		LDR R1, [R0]
		ORR R1, #0x2C
		STR R1, [R0]
;    // configure PA2,3,5 as SSI
;    GPIO_PORTA_PCTL_R = (GPIO_PORTA_PCTL_R&0xFF0F00FF)+0x00202200;
;    // configure PA6,7 as GPIO


;    GPIO_PORTA_AMSEL_R &= ~0xEC;          // disable analog functionality on PA2,3,5,6,7

		LDR R0,=GPIO_PORTA_AMSEL_R
		LDR R1, [R0]
		BIC R1, #0xEC 
		STR R1, [R0]

;    SSI0_CR1_R &= ~SSI_CR1_SSE;           // disable SSI
		LDR R0,=SSI0_CR1_R
		LDR R1, [R0]
		BIC R1, #0x2
		STR R1, [R0]
;    SSI0_CR1_R &= ~SSI_CR1_MS;            // master mode
		LDR R0,=SSI0_CR1_R
		LDR R1, [R0]
		BIC R1, #0x4
		STR R1, [R0]
;    // configure for system clock/PLL baud clock source
;    SSI0_CC_R = (SSI0_CC_R&~SSI_CC_CS_M)+SSI_CC_CS_SYSPLL;
		LDR R0,=SSI0_CC_R
		LDR R1, [R0]
		BIC R1, #0xFF
		STR R1, [R0]
;    // clock divider for 3.33 MHz SSIClk (80(bizce 16 MHz) MHz PLL/24(256))
;    // SysClk/(CPSDVSR*(1+SCR))
;    // 80/(24*(1+0)) = 3.33 MHz (slower than 4 MHz)
;    SSI0_CPSR_R = (SSI0_CPSR_R&~SSI_CPSR_CPSDVSR_M)+24; // must be even number
		LDR R0,=SSI0_CPSR_R				; Max value for the peripheral device is 100Khz so we give 16Mhz/254 =63 kHZ
		LDR R1, [R0]
		BIC R1, #0xFF
		ORR R1, #0xFE ; 0d254		
		STR R1, [R0]
;    SSI0_CR0_R &= ~(SSI_CR0_SCR_M |       // SCR = 0 (3.33 Mbps data rate)
;               SSI_CR0_SPH |         // SPH = 0
;               SSI_CR0_SPO);         // SPO = 0
;    // FRF = Freescale format
;    SSI0_CR0_R = (SSI0_CR0_R&~SSI_CR0_FRF_M)+SSI_CR0_FRF_MOTO;
;    // DSS = 8-bit data
;    SSI0_CR0_R = (SSI0_CR0_R&~SSI_CR0_DSS_M)+SSI_CR0_DSS_8;
		LDR R0,=SSI0_CR0_R
		LDR R1, [R0]
		LDR R2, =0xFFFF  ; Son bit for accuracy
		BIC R1, R2
		ORR R1, #0x7
		STR R1, [R0]
;    SSI0_CR1_R |= SSI_CR1_SSE;            // enable SSI
		LDR R0,=SSI0_CR1_R
		LDR R1, [R0]
		ORR R1, #0x2
		STR R1, [R0]
;*********************SPI CONFIGURATION********ENDS******
		
		
;*********************LCD CONFIGURATION********STARTS******
		
;	RESET = RESET_LOW;                    // reset the LCD to a known state
		LDR R0,=RESET
		LDR R1, [R0]
		MOV R1, #0x0 
		STR R1, [R0]		
;    for(delay=0; delay<10; delay=delay+1);// delay minimum 100 ns
		BL DELAY100
;    RESET = RESET_HIGH;                   // negative logic
		LDR R0,=RESET
		LDR R1, [R0]
		MOV R1, #0x80 
		STR R1, [R0]
;    lcdwrite(COMMAND, 0x21);              // chip active; horizontal addressing mode (V = 0); use extended instruction set (H = 1)
;    // set LCD Vop (contrast), which may require some tweaking:
;    lcdwrite(COMMAND, CONTRAST);          // try 0xB1 (for 3.3V red SparkFun), 0xB8 (for 3.3V blue SparkFun), 0xBF if your display is too dark, or 0x80 to 0xFF if experimenting
;    lcdwrite(COMMAND, 0x04);              // set temp coefficient
;    lcdwrite(COMMAND, 0x14);              // LCD bias mode 1:48: try 0x13 or 0x14
;    lcdwrite(COMMAND, 0x20);              // we must send 0x20 before modifying the display control mode
;    lcdwrite(COMMAND, 0x0C);              // set display control to normal mode: 0x0D for inverse
;void static lcdwrite(enum typeOfWrite type, uint8_t message){
;    if(type == COMMAND){
;        // wait until SSI0 not busy/transmit FIFO empty
;        while((SSI0_SR_R&SSI_SR_BSY)==SSI_SR_BSY){};
;        DC = DC_COMMAND;
;        SSI0_DR_R = message;                // command out
;        // wait until SSI0 not busy/transmit FIFO empty
;        while((SSI0_SR_R&SSI_SR_BSY)==SSI_SR_BSY){};
;    } else{
;        while((SSI0_SR_R&SSI_SR_TNF)==0){}; // wait until transmit FIFO not full
;        DC = DC_DATA;
;        SSI0_DR_R = message;                // data out
;    }
;}

BUSY1	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY1
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent 0x21
		LDR R0,=SSI0_DR_R
		MOV R1, #0x21				; H=1
		STR R1, [R0]


BUSY3	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY3
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x13  ;			;  BIas System MUX Rate = 1:48 which makes  the n =4??? 
		STR R1, [R0]

BUSY	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0xBF  				; Vlcd=3.3 V we hope
		STR R1, [R0]
		

BUSY2	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY2
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x07				; temperature coefficient 3
		STR R1, [R0]
		

BUSY4	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY4
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x20				; H = 0
		STR R1, [R0]
		
BUSY5	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY5
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x0C				; Display Control -> Normal Mode
		STR R1, [R0]
		
		;BURDA BI SEY VAR
		
BUSY6	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY6
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x80				; CURSOR RESET X=0
		STR R1, [R0]
	
BUSY7	LDR R0,=SSI0_SR_R
		LDR R1, [R0]
		AND R1, #0x10
		CMP R1, #0x10
		BEQ BUSY7
		LDR R0, =DC 	;dc_command  
		MOV R1, #0
		STR R1, [R0]
		; sent
		LDR R0,=SSI0_DR_R
		MOV R1, #0x40				;  CURSOR RESET Y=0
		STR R1, [R0]
;*********************LCD CONFIGURATION********ENDS******

;*********************ADC CONFIGURATION********STARTS******************  	
; We initialize PE3 which is AIN0
		LDR R1, =RCGCADC ; Turn on ADC clock
		LDR R0, [R1]
		ORR R0, R0, #0x03 ; set bit 0 and 1 to enable ADC0 and ADC1 clock
		STR R0, [R1]
		NOP
		NOP
		NOP

; Setup GPIO to make PE3 and PE2 input for ADC0  					// ADC initialization for E3 and E2
		LDR R1, =PORTE_DIR
		LDR R0, [R1]
		BIC R0, R0, #0x0C ; clear bit 3 to set as input
		STR R0, [R1]
		; Enable alternate functions
		LDR R1, =PORTE_AFSEL
		LDR R0, [R1]
		ORR R0, R0, #0x0C ; set bit 3 to enable alt functions on PE3 and PE2
		STR R0, [R1]
		; PCTL does not have to be configured
		; since ADC0 is automatically selected when
		; port pin is set to analog.
		; Disable digital on PE3 and PE2
		LDR R1, =PORTE_DEN
		LDR R0, [R1]
		BIC R0, R0, #0x0C ; clear bit 3 to disable digital on PE3 and PE2
		STR R0, [R1]
		; Enable analog on PE3 and PE2
		LDR R1, =PORTE_AMSEL
		LDR R0, [R1]
		ORR R0, R0, #0x0C ; set bit 3 to enable analog on PE3 and PE2
		STR R0, [R1]
		; Disable SS3 while ADC0 setup
		LDR R1, =ADC0_ACTSS
		LDR R0, [R1] 	; we use SS3
		BIC R0, R0, #0x08 ; clear bit 3 to disable SS3 for configuration
		STR R0, [R1]
		; Disable SS3 while ADC1 setup
		LDR R1, =ADC1_ACTSS
		LDR R0, [R1] 	; we use SS3
		BIC R0, R0, #0x08 ; clear bit 3 to disable SS3 for configuration
		STR R0, [R1]
		; Select trigger source
		LDR R1, =ADC0_EMUX
		LDR R0, [R1]
		BIC R0, R0, #0x0F00 ; clear bits 11:8 to select trigger by SOFTWARE <- 4b'0000
		STR R0, [R1] ; trigger
		LDR R1, =ADC1_EMUX
		LDR R0, [R1]
		BIC R0, R0, #0x0F00 ; clear bits 11:8 to select trigger by SOFTWARE <- 4b'0000
		STR R0, [R1] ; trigger
		; Select input channel
		LDR R1, =ADC0_SSMUX3
		LDR R0, [R1]
		BIC R0, R0, #0x000F ; clear bits 3:0 to select AIN0 <-0b0000
		STR R0, [R1]
		; Config sample sequence
		LDR R1, =ADC0_SSCTL3
		LDR R0, [R1]
		ORR R0, R0, #0x06 ; set bits 2:1 (IE0, END0) 
		STR R0, [R1]
		
		; Select input channel
		LDR R1, =ADC1_SSMUX3
		LDR R0, [R1]
		BIC R0, R0, #0x000F ; clear bits 3:0 to select AIN1 <-0b0001
		ORR	R0, #0x1
		STR R0, [R1]
		; Config sample sequence
		LDR R1, =ADC1_SSCTL3
		LDR R0, [R1]
		ORR R0, R0, #0x06 ; set bits 2:1 (IE0, END0) 
		STR R0, [R1]		
		
		; Set sample rate
		LDR R1, =ADC0_PC
		LDR R0, [R1]
		ORR R0, R0, #0x01 ; set bits 3:0 to 1 for 125 ksps
		STR R0, [R1]
		; Set sample rate
		LDR R1, =ADC1_PC
		LDR R0, [R1]
		ORR R0, R0, #0x01 ; set bits 3:0 to 1 for 125 ksps
		STR R0, [R1]
		
		; Done with setup, enable sequencer
		LDR R1, =ADC0_ACTSS
		LDR R0, [R1]
		ORR R0, R0, #0x08 ; set bit 3 to enable SS3
		STR R0, [R1] ; sampling enabled but not initiated yet
		LDR R1, =ADC1_ACTSS
		LDR R0, [R1]
		ORR R0, R0, #0x08 ; set bit 3 to enable SS3
		STR R0, [R1] ; sampling enabled but not initiated yet
;*********************ADC CONFIGURATION********ENDS******************  
				
		POP{LR}
		BX LR
		ENDP
		ALIGN 
		END
