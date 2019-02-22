`timescale 1ns/1ps

module mux4(sel, in0, in1, in2, in3, out);
    parameter WIDTH = 32;
    input [1:0] sel;
    input [WIDTH-1:0] in0, in1, in2, in3;
    output wire [WIDTH-1:0] out;
    wire [WIDTH-1:0] s0, s1;
    multiplexer #(WIDTH) mux0(s0, in0, in1, sel[0]);
    multiplexer #(WIDTH) mux1(s1, in2, in3, sel[0]);
    multiplexer #(WIDTH) muxf(out, s0, s1, sel[1]);

endmodule