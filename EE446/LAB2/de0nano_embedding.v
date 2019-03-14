
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module de0nano_embedding(

	//////////// CLOCK //////////
	CLOCK_50,

	//////////// LED //////////
	LED,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	GPIO_0,
	GPIO_0_IN,

	//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
	GPIO_1,
	GPIO_1_IN 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_0;
input 		     [1:0]		GPIO_0_IN;

//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_1;
input 		     [1:0]		GPIO_1_IN;


//=======================================================
//  REG/WIRE declarations
//=======================================================
   
     reg LOAD, COMP;
     reg [2:0] OP;
     reg [1:0] Stat;
	  reg R1m, R0m;
     wire R1Clr, R1Src, R0WE, R1WE;
	  wire [1:0] R0Src, ASrc, Bsrc;
	  wire [2:0] ALUCtrl;
     reg NFlag , Qn;
     reg ERR;
     wire AccRight, AccParallel, AccCLR, QParallel, QSrc, QnCLR, RST, QRight, QzSrc;



//=======================================================
//  Structural coding
//=======================================================
controller #(4) CONTROL(.CLK(KEY[1]),
            .AccRight(AccRight), .AccParallel(AccParallel), .AccCLR(AccCLR), // Acc register control
            .ALUCtrl(ALUCtrl), .ASrc(ASrc), .BSrc(BSrc),  // ALU Controllers
            .Stat(Stat), .NFlag(NFlag),    // Status bits
            .LOAD(!KEY[0]),.R1m(R1m), .R0m(R0m),
            .COMP(GPIO_0[0]), .R1Clr(R1Clr), .R1Src(R1Src), .R0WE(R0WE), .R1WE(R1WE), .R0Src(R0Src),
            .OP(SW[2:0]),  //ALP Operation
				.QParallel(QParallel), .QSrc(QSrc), .QnCLR(QnCLR), .RST(RST), .QRight(QRight), .QzSrc(QzSrc), .Qn(Qn),
            .CLR(GPIO_0[1]), // reset registers
            .ERR(GPIO_0[2]) // Arithmetic overflow
            );
				
ALP DATAPATH(.CLK(KEY[1]),
            .AccRight(AccRight), .AccParallel(AccParallel), .AccCLR(AccCLR), // Acc register control
            .ALUCtrl(ALUCtrl), .ASrc(ASrc), .BSrc(BSrc),  // ALU Controllers
            .Stat(Stat), .NFlag(NFlag),    // Status bits
            .R1m(R1m), .R0m(R0m),
            .R1Clr(R1Clr), .R1Src(R1Src), .R0WE(R0WE), .R1WE(R1WE), .R0Src(R0Src),
           	.QParallel(QParallel), .QSrc(QSrc), .QnCLR(QnCLR), .RST(RST), .QRight(QRight), .QzSrc(QzSrc), .Qn(Qn),
            .DATA(GPIO_0[6:3]), .R0out(LED[3:0]), .R1out(LED[7:4]) 
				);


endmodule
