`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 09:54:37 AM
// Design Name: 
// Module Name: control
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


module control(
input [5:0] op,
input [5:0] func,
input extra,
output reg [3:0] aluOP,
output reg isImm,
output reg WREnable,
output reg SYSCALL,
output reg isSign,
output reg BNE,
output reg isJR,
output reg isJMP,
output reg isJAL,
output reg isBranch,
output reg MemSign,
output reg isLUI,
output reg isShamt,
output reg [1:0] MemOp,
output reg [1:0] MemSIze,
output reg isBEQ
    );
always @(op or func or extra) begin
    case (op)
    6'b000000:
    begin
        case (func)
        6'b000000: begin aluOP = 0;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 1;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SLL
        6'b000011: begin aluOP = 1;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 1;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SRA
        6'b000010: begin aluOP = 2;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 1;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SRL
        6'b100000: begin aluOP = 5;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //ADD
        6'b100001: begin aluOP = 5;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //ADDU
        6'b100010: begin aluOP = 6;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SUB
        6'b100100: begin aluOP = 7;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //AND
        6'b100101: begin aluOP = 8;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //OR
        6'b100111: begin aluOP = 10; isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //NOR
        6'b101010: begin aluOP = 11; isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SLT
        6'b101011: begin aluOP = 12; isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SLTU
        6'b001000: begin aluOP = 0;  isImm = 0; WREnable = 0; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 1; isJMP = 1; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //JR
        6'b001100: begin aluOP = 0;  isImm = 0; WREnable = 0; SYSCALL = 1; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SYSCALL

        6'b000100: begin aluOP = 0;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SLLV
        6'b000110: begin aluOP = 2;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SRLV
        6'b000111: begin aluOP = 1;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SRAV
        6'b100011: begin aluOP = 6;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //SUBU
        6'b100110: begin aluOP = 9;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0;  end //XOR
        default:;
        endcase
    end
	6'b000010: begin aluOP = 0;  isImm = 0; WREnable = 0; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 1; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //J
	6'b000011: begin aluOP = 0;  isImm = 0; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 1; isJAL = 1; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //JAL
	6'b000100: begin aluOP = 0;  isImm = 0; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 1; end //BEQ
	6'b000101: begin aluOP = 0;  isImm = 0; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 1; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //BNE
	6'b001000: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //ADDI
	6'b001100: begin aluOP = 7;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //ANDI
	6'b001001: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //ADDIU
	6'b001010: begin aluOP = 11; isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //SLTI
	6'b001101: begin aluOP = 8;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //ORI
	6'b100011: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 1;  MemSIze = 2; isBEQ = 0; end //LW
	6'b101011: begin aluOP = 5;  isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 3;  MemSIze = 2; isBEQ = 0; end //SW
	6'b001111: begin aluOP = 0;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 1; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //LUI
	6'b001011: begin aluOP = 12; isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0;  MemSIze = 0; isBEQ = 0; end //SLTIU
	6'b100000: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 1;  MemSIze = 0; isBEQ = 0; end //LB
	6'b000001: 
    begin 
        case (extra)
        1'b0: begin aluOP = 11; isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0; end //BLTZ
        1'b1: begin aluOP = 15; isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0; end //BGEZ
        endcase
    end
    6'b001110: begin aluOP = 9;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 0; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 0; MemSIze = 0; isBEQ = 0; end //XORI
	6'b100001: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 1; MemSIze = 1; isBEQ = 0; end //LH
	6'b100100: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 1; isLUI = 0; isShamt = 0;  MemOp = 1; MemSIze = 0; isBEQ = 0; end //LBU
	6'b100101: begin aluOP = 5;  isImm = 1; WREnable = 1; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 1; isLUI = 0; isShamt = 0;  MemOp = 1; MemSIze = 1; isBEQ = 0; end //LHU
	6'b101000: begin aluOP = 5;  isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 3; MemSIze = 0; isBEQ = 0; end //SB
	6'b101001: begin aluOP = 5;  isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 0; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 3; MemSIze = 1; isBEQ = 0; end //SH
	6'b000110: begin aluOP = 14; isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 1; MemSIze = 0; isBEQ = 0; end //BLEZ
	6'b000111: begin aluOP = 13; isImm = 1; WREnable = 0; SYSCALL = 0; isSign = 1; BNE = 0; isJR = 0; isJMP = 0; isJAL = 0; isBranch = 1; MemSign = 0; isLUI = 0; isShamt = 0;  MemOp = 1; MemSIze = 0; isBEQ = 0; end //BGTZ
	default:;
    endcase
end

endmodule
