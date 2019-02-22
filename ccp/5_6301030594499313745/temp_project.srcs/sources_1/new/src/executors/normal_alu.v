`timescale 1ns/1ps

module normal_alu(aluop, alusrcA, alusrcB, result, oflow);
    localparam ALUOP_ADD = 0;
    localparam ALUOP_SUB = 1;
    localparam ALUOP_AND = 2;
    localparam ALUOP_OR = 3;
    localparam ALUOP_NOR = 4;
    localparam ALUOP_XOR = 5;
    localparam ALUOP_SHL = 6;
    localparam ALUOP_SHR = 7;
    localparam ALUOP_LUI = 8;
    localparam ALUOP_EQU = 9;
    localparam ALUOP_NEQ = 10;
    localparam ALUOP_LES = 11;
    localparam ALUOP_LEQ = 12;
    localparam ALUOP_GRT = 13;
    localparam ALUOP_GEQ = 14;
    localparam ALUOP_SAL = 15;
    localparam ALUOP_SAR = 16;
    localparam ALUOP_TRUE = 17;

    input [4:0] aluop;
    input [31:0] alusrcA, alusrcB;
    output reg [31:0] result;
    output wire oflow;
    wire signed [31:0] alusrcAs;
    assign oflow = 0;
    assign alusrcAs = alusrcA;
    always @(aluop or alusrcA or alusrcB) begin
        case (aluop) 
            ALUOP_ADD: begin
                result = alusrcA + alusrcB;
            end
            ALUOP_SUB: begin
                result = alusrcA - alusrcB;
            end
            ALUOP_AND: begin
                result = alusrcA & alusrcB;
            end
            ALUOP_OR: begin
                result = alusrcA | alusrcB;
            end
            ALUOP_NOR: begin
                result = ~(alusrcA | alusrcB);
            end
            ALUOP_XOR: begin
                result = alusrcA ^ alusrcB;
            end
            ALUOP_SHL: begin
                result = alusrcA << alusrcB;
            end
            ALUOP_SHR: begin
                result = alusrcA >> alusrcB;
            end
            ALUOP_LUI: begin
                result = {alusrcA[15:0], {(16){1'b0}}};
            end
            ALUOP_EQU: begin
                result = (alusrcA == alusrcB) ? 1 : 0;
            end
            ALUOP_NEQ: begin
                result = (alusrcA != alusrcB) ? 1 : 0;
            end
            ALUOP_LES: begin
                result = (alusrcA < alusrcB) ? 1 : 0;
            end
            ALUOP_LEQ: begin
                result = ((alusrcA < alusrcB) || (alusrcA == alusrcB)) ? 1 : 0;
            end
            ALUOP_GRT: begin
                result = (alusrcA > alusrcB) ? 1 : 0;
            end
            ALUOP_GEQ: begin
                result = ((alusrcA > alusrcB) || (alusrcA == alusrcB)) ? 1 : 0;
            end
            ALUOP_SAL: begin
                result = alusrcAs <<< alusrcB;
            end
            ALUOP_SAR: begin
                result = alusrcAs >>> alusrcB;
            end
            ALUOP_TRUE: begin
                result = 1;
            end
            default: begin
                // ILLEGAL AluOp, output keep 0.
                result = 0;
            end
        endcase
    end
endmodule