`timescale 1ns/1ps

module regfile(clk, rd1, rd2, wr1, wrdata, wrenable,
        data1, data2);
    input clk, wrenable;
    input [4:0] rd1, rd2, wr1;
    input [31:0] wrdata;
    output wire [31:0] data1, data2;
    reg [31:0] gpregisters [31:0];
    assign data1 = rd1 == 0 ? 0 : gpregisters[rd1];
    assign data2 = rd2 == 0 ? 0 : gpregisters[rd2];

    always @ (posedge clk) begin
        if (wrenable == 1) begin
            gpregisters[wr1] <= wrdata;
        end
    end

endmodule