`timescale 1ns/1ps

module instr_mem(addr, rd);
    parameter ADDR_WIDTH = 8;
    input [31:0] addr;
    output wire [31:0] rd;
    reg [31:0] internal_mem[511:0] ;

    initial $readmemh("/home/imzhwk/MIPS32/sorting.hex", internal_mem);
    assign rd = internal_mem[addr[10:2]];

endmodule