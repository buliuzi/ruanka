`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 09:09:59 AM
// Design Name: 
// Module Name: divider
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


module divider(
input clk_in,
input rst,
output reg clk_out
    );

parameter N = 32'd100_000_000;   
reg [31:0] cnt;     
        
initial begin 
    cnt <= 0;  
    clk_out <= 0;
end        
        
always @(posedge clk_in or rst) begin
    if(rst == 1) begin
        clk_out <= 1'b0;
        cnt <= 32'd0;
    end else if(cnt == N/2-1) begin
        clk_out <= ~clk_out;
        cnt <= 0;
    end else begin
        cnt <= cnt+1; 
    end
end
endmodule