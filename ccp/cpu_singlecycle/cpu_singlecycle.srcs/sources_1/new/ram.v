`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 06:52:55 PM
// Design Name: 
// Module Name: ram
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


module ram(
input clk,
input reset,
input [31:0] addr,
input [31:0] data_in,
input store,
input load,
output reg [31:0] data_out
    );

reg [31:0] ram [1023:0];

always @(posedge clk or posedge reset) begin
    if (load == 1) begin
        data_out <= ram[addr];
    end else if (store == 1) begin
        ram[addr] <= data_in;
    end else begin
        
    end
end

endmodule
