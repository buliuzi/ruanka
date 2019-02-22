`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 10:42:57 AM
// Design Name: 
// Module Name: sim_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_control(

    );
reg [5:0] op;
reg [5:0] func;
wire [3:0] aluOP;
wire MemToReg;
wire MemWrite;
wire AluSrc;
wire RegWrite;
wire SysCall;
wire SignedExt;
wire RegDst;
wire Beq;
wire Bne;
wire JR;
wire JMP;
wire JAL;

control CONCROL_UNIT(op,func,aluOP,MemToReg,MemWrite,AluSrc,RegWrite,SysCall,SignedExt,RegDst,Beq,Bne,JR,JMP,JAL);

initial begin
op <= 0;
#10 func <= 0;
#10 func <= 2;
#10 func <= 3;
#10 func <= 8;
#10 func <= 12;
#10 func <= 32;
#10 func <= 33;
#10 func <= 34;
#10 func <= 36;
#10 func <= 37;
#10 func <= 39;
#10 func <= 42;
#10 func <= 43;
#10 op <=2; func<=0;
#10 op <=3;
#10 op <=4;
#10 op <=5;
#10 op <=8;
#10 op <=9;
#10 op <=10;
#10 op <=12;
#10 op <=13;
#10 op <=35;
#10 op <=43;
end


endmodule
