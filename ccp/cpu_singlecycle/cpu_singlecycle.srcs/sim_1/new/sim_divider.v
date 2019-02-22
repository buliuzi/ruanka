`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 09:15:03 AM
// Design Name: 
// Module Name: sim_divider
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


module sim_divider(
    );
    
reg clk;
reg reset;
wire clk_div;

divider #(4) DIV_CLK(clk, reset, clk_div);

initial begin
    clk <= 0;
    reset <= 1;
    #10 reset <= 0;
end

always begin
    #1 clk <= ~clk;
end

endmodule
