`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 09:09:22 AM
// Design Name: 
// Module Name: sim_display
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


module sim_display(

    );
    reg clk;
    reg reset;
    reg [31:0] data;
    wire [7:0] seg;
    wire [7:0] en;

display DISPLAY(clk, reset, data, seg, en);

initial begin
clk <= 0;
reset <= 1;
#10 reset <= 0;
#100 data <= 32'h12345678;
#100 data <= 32'h9abcdef0;
end
    
always begin
#1 clk <= ~clk;
end
endmodule
