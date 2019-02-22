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
output reg [3:0] aluOP,
output reg MemToReg,
output reg MemWrite,
output reg AluSrc,
output reg RegWrite,
output reg SysCall,
output reg SignedExt,
output reg RegDst,
output reg Beq,
output reg Bne,
output reg JR,
output reg JMP,
output reg JAL
    );
always @(op or func) begin
    case (op)
    6'b000000:
    begin
        case (func)
        6'b000000:
        begin
            aluOP = 0;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
        6'b000010:
        begin
            aluOP = 2;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b000011:
        begin
            aluOP = 1;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end/*
		6'b000100:
        begin
            aluOP = 0;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b000110:
        begin
            aluOP = 2;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b000111:
        begin
            aluOP = 1;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end*/
		6'b001000:
        begin
            //aluOP = 0;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 0;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 0;
            Beq = 0;
            Bne = 0;
            JR = 1;
            JMP = 1;
            JAL = 0;
        end
		6'b001010:
        begin
            //aluOP = 0;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 0;
            SysCall = 1;
            SignedExt = 0;
            RegDst = 0;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100000:
        begin
            aluOP = 5;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100001:
        begin
            aluOP = 5;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100010:
        begin
            aluOP = 6;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100100:
        begin
            aluOP = 7;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100101:
        begin
            aluOP = 8;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b100111:
        begin
            aluOP = 10;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b101010:
        begin
            aluOP = 11;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
		6'b101011:
        begin
            aluOP = 12;
            MemToReg = 0;
            MemWrite = 0;
            AluSrc = 0;
            RegWrite = 1;
            SysCall = 0;
            SignedExt = 0;
            RegDst = 1;
            Beq = 0;
            Bne = 0;
            JR = 0;
            JMP = 0;
            JAL = 0;
        end
        endcase
    end/*
	6'b000001:
    begin
        aluOP = 11;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 0;
        RegWrite = 0;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end*/
	6'b000010:
    begin
        //aluOP = 0;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 0;
        RegWrite = 0;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 1;
        JAL = 0;
    end
	6'b000011:
    begin
        //aluOP = 0;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 0;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 1;
        JAL = 1;
    end
	6'b000100:
    begin
        //aluOP = 0;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 0;
        RegWrite = 0;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 1;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b000101:
    begin
        //aluOP = 0;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 0;
        RegWrite = 0;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 1;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b001000:
    begin
        aluOP = 5;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 1;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b001001:
    begin
        aluOP = 5;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b001010:
    begin
        aluOP = 11;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 1;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b001100:
    begin
        aluOP = 7;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b001101:
    begin
        aluOP = 8;
        MemToReg = 0;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 0;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b100011:
    begin
        aluOP = 5;
        MemToReg = 1;
        MemWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
        SysCall = 0;
        SignedExt = 1;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
	6'b101011:
    begin
        aluOP = 5;
        MemToReg = 0;
        MemWrite = 1;
        AluSrc = 1;
        RegWrite = 0;
        SysCall = 0;
        SignedExt = 1;
        RegDst = 0;
        Beq = 0;
        Bne = 0;
        JR = 0;
		JMP = 0;
        JAL = 0;
    end
    endcase
end
endmodule
