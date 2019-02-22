`timescale 1ns/1ps

module rwmemory_test();
    localparam MEMSIZE_BYTE = 0;
    localparam MEMSIZE_HWORD = 1;
    localparam MEMSIZE_WORD = 2;
    localparam MEMOP_WR = 3;

    reg clk, isUnsigned;
    reg [1:0] memop, memsize;
    reg [31:0] addr, wrcont;
    wire [31:0] out;
    wire [7:0] dbg0, dbg1, dbg2, dbg3;

    initial begin
        clk = 0;
        isUnsigned = 0;
        memop = 0;
        memsize = 0;
        addr = 0;
        wrcont = 0;
        // try write a WORD
        #4 isUnsigned = 1;
        memop = MEMOP_WR;
        memsize = MEMSIZE_WORD;
        addr = 0;
        wrcont = {8'hFF, 8'h40, 8'hFF, 8'h40};
        // 0x0: 0x40 0xFF 0x40 0xFF :0x3
        // wait it to write and stop
        #4 memop = 0;
        // try byte reads
        isUnsigned = 1;
        memsize = MEMSIZE_BYTE;
        // expect output 0x00000040
        #4 addr = 1;
        // expect output 0x000000FF
        #4 isUnsigned = 0;
        addr = 2;
        // expect output 0x00000040
        #4 addr = 3;
        // expect output 0xFFFFFFFF
        // test hword write
        #4 addr = 4;
        wrcont = {8'hAA, 8'hBB, 8'hCC, 8'hDD};
        memsize = MEMSIZE_HWORD;
        memop = MEMOP_WR;
        // wait write to complete, and read out
        #4 memop = 0;
        #4 isUnsigned = 0;
        // expect output 0xFFFFCCDD
        // test byte write
        #4 wrcont = {8'hAA, 8'hBB, 8'hCC, 8'h90};
        memsize = MEMSIZE_BYTE;
        addr = 2;
        memop = MEMOP_WR;
        // wait write to complete
        #4 memop = 0;
        // test read word
        #4 memsize = MEMSIZE_WORD;
        addr = 0;
        // expect output 0xFF90FF40
        #4 $finish;
    end

    always begin
        #2 clk = ~clk;
    end
    rwmemory #(8) testobj(clk, memop, isUnsigned, memsize, addr, wrcont, out, dbg0, dbg1, dbg2, dbg3);


endmodule