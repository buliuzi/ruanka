`timescale 1ns / 1ps


module multiplexer(
    result, srca, srcb, selector
    );
    parameter WIDTH = 8;
    input [WIDTH-1:0] srca,srcb;
    input selector;
    output wire [WIDTH-1:0] result;
    assign result = (selector == 1) ? srcb : srca;
endmodule
