module controller(CLK,
            AccRight, AccParallel, // Acc register control
            ALUCtrl, ASrc, BSrc,  // ALU Controllers
            Stat, NFlag,    // Status bits
            LOAD,
            COMP, 
            OP,  //ALP Operation
            CLR, // reset registers
            ERR // Arithmetic overflow
            
              );
     input CLK,  CLR;
     input LOAD, COMP;
     input [2:0] OP;
     input [1:0] Stat;
     input R1Clr;
     input Nflag;
     output reg ERR;
     output wire AccRight, AccParallel, ALUCtrl, ASrc, BSrc;
     
     





endmodule
