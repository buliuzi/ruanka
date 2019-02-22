`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 09:53:41 AM
// Design Name: 
// Module Name: rom
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


module rom(
input [31:0] addr,
output reg [31:0] data
    );
    
reg [31:0] rom [1023:0];
wire [31:0] addr_word;

assign addr_word = addr << 2;

initial begin
    $readmemh ("D:/ruanka/ccp/cpu_singlecycle/cpu_singlecycle.srcs/sources_1/new/romData.txt",rom);
    data <= 0;
end

always @(addr) begin
    data = rom[addr];
end

endmodule