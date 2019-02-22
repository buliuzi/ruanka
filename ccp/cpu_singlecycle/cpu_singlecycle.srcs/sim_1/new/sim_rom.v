`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 11:15:26 AM
// Design Name: 
// Module Name: sim_rom
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


module sim_rom(

    );
    
reg [31:0] addr;
wire [31:0] data;

rom ROM (addr, data);
initial begin
addr <=0;
end

always begin
#10 addr = addr +1;
end
endmodule
