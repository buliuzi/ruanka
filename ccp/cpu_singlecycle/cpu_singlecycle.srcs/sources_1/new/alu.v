`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2019 10:39:37 PM
// Design Name: 
// Module Name: alu
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


module alu(
input [31:0] srcA,
input [31:0] srcB,
input [4:0] shamt,
input [3:0] aluOP,
output reg [31:0] result1,
output reg [31:0] result2,
output reg equal
    );
    
always @(srcA or srcB or aluOP) begin
    case (aluOP)
    4'b0000: begin result1 = srcB << shamt; end
    4'b0001: begin result1 = srcB >>> shamt; end //($signed(srcB))
    4'b0010: begin result1 = srcB >> shamt; end
    4'b0011: begin  end //multiply
    4'b0100: begin  end //div
    4'b0101: begin result1 = srcA + srcB; end
    4'b0110: begin result1 = srcA - srcB; end
    4'b0111: begin result1 = srcA & srcB; end
    4'b1000: begin result1 = srcA | srcB; end
    4'b1001: begin result1 = srcA ^ srcB; end
    4'b1010: begin result1 = ~(srcA | srcB); end
    4'b1011: begin result1 = (srcA < srcB ? 1 : 0); end
    4'b1100: begin result1 = (srcA < srcB ? 1 : 0); end
    4'b1101: begin end
    4'b1110: begin end
    4'b1111: begin end
    endcase
end
endmodule
