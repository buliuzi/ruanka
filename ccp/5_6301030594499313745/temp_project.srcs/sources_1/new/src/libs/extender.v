`timescale 1ns/1ps

module extender32(isUnsigned, src, dst);
    parameter INPUT_WIDTH = 8;
    input isUnsigned;
    input [INPUT_WIDTH-1:0] src;
    output wire [31:0] dst;

    assign dst = (isUnsigned == 1)
    ? {{(32-INPUT_WIDTH){1'b0}}, src[INPUT_WIDTH-1:0]} :
    {{(32-INPUT_WIDTH){src[INPUT_WIDTH-1]}}, src[INPUT_WIDTH-1:0]};

endmodule