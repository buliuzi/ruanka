`timescale 1ns/1ps

module register(clk, wr, rd, wrena);
    parameter WIDTH = 32;
    input clk, wrena;
    input [WIDTH-1:0] wr;
    output reg [WIDTH-1:0] rd;
    initial rd = 0;
    always @ (posedge clk) begin
        if(wrena) rd <= wr;
    end
endmodule