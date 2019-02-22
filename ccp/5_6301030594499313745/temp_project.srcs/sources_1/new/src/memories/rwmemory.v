`timescale 1ns/1ps


module rwmemory(clk, memop, isUnsigned, memsize, addr, wrcontent,
content);

    localparam MEMSIZE_BYTE = 0;
    localparam MEMSIZE_HWORD = 1;
    localparam MEMSIZE_WORD = 2;
    localparam MEMOP_WR = 3;

    input clk, isUnsigned;
    input [1:0] memop, memsize;
    input [31:0] addr;
    input [31:0] wrcontent;
    output wire [31:0] content;

    wire [4:0] real_addr;
    wire [1:0] select_addr;
    wire [7:0] rdc0, rdc1, rdc2, rdc3;
    wire [7:0] rdsel8;
    wire [15:0] rdsel16;
    wire [31:0] ext8, ext16, all32;

    reg [7:0] imem0[255:0];
    reg [7:0] imem1[255:0];
    reg [7:0] imem2[255:0];
    reg [7:0] imem3[255:0];

    assign real_addr = addr[7:2];
    assign select_addr = addr[1:0];

    assign rdc0 = imem0[real_addr];
    assign rdc1 = imem1[real_addr];
    assign rdc2 = imem2[real_addr];
    assign rdc3 = imem3[real_addr];

    assign all32 = {rdc3, rdc2, rdc1, rdc0};
    assign rdsel8 = (select_addr == 0) ? rdc0 :
        (select_addr == 1) ? rdc1 :
        (select_addr == 2) ? rdc2 :
        rdc3;
    assign rdsel16 = (select_addr[1] == 0) ? {rdc1, rdc0} :
        {rdc3, rdc2};
    extender32 #(8) extend_8(isUnsigned, rdsel8, ext8);
    extender32 #(16) extend_16(isUnsigned, rdsel16, ext16);
    
    assign content =
        (memsize == MEMSIZE_BYTE) ? ext8 :
        (memsize == MEMSIZE_HWORD) ? ext16 :
        all32;
    

    always @(posedge clk) begin
        if(memop == MEMOP_WR) begin
            case (memsize)
                MEMSIZE_BYTE: begin
                    case (select_addr)
                        0: imem0[real_addr] = wrcontent[7:0];
                        1: imem1[real_addr] = wrcontent[7:0];
                        2: imem2[real_addr] = wrcontent[7:0];
                        3: imem3[real_addr] = wrcontent[7:0];
                    endcase
                end
                MEMSIZE_HWORD: begin
                    if (select_addr[1] == 0) begin
                        imem0[real_addr] = wrcontent[7:0];
                        imem1[real_addr] = wrcontent[15:8];
                    end else begin
                        imem2[real_addr] = wrcontent[7:0];
                        imem3[real_addr] = wrcontent[15:8];
                    end
                end
                MEMSIZE_WORD: begin
                    imem0[real_addr] = wrcontent[7:0];
                    imem1[real_addr] = wrcontent[15:8];
                    imem2[real_addr] = wrcontent[23:16];
                    imem3[real_addr] = wrcontent[31:24];
                end
                default:begin
                    // ILLEGAL, do nothing
                end
            endcase
        end
    end

endmodule