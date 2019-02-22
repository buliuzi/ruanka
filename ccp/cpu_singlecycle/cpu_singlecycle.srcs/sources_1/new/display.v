`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2019 08:24:20 AM
// Design Name: 
// Module Name: display
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


module display(
input clk, reset, 
input [31:0] data,
output reg [7:0] seg,
output reg [7:0] en
    );

reg [15:0] cnt_scan;
reg [3:0] data_div;
    
initial begin
    cnt_scan <= 0;
end
  
always @(posedge clk) begin
    cnt_scan <= cnt_scan + 1;
end

always @(cnt_scan or reset) begin
    if (reset == 1) begin en <= 8'b1111_1111; data_div <= 4'b0000;
    end else begin
        case (cnt_scan[15:13])
        3'b000: begin en <= 8'b1111_1110; data_div <= data[3:0];   end
        3'b001: begin en <= 8'b1111_1101; data_div <= data[7:4];   end
        3'b010: begin en <= 8'b1111_1011; data_div <= data[11:8];  end
        3'b011: begin en <= 8'b1111_0111; data_div <= data[15:12]; end
        3'b100: begin en <= 8'b1110_1111; data_div <= data[19:16]; end
        3'b101: begin en <= 8'b1101_1111; data_div <= data[23:20]; end
        3'b110: begin en <= 8'b1011_1111; data_div <= data[27:24]; end
        3'b111: begin en <= 8'b0111_1111; data_div <= data[31:28]; end
        endcase
    end
end

always @(data_div) begin
    case (data_div)
        4'b0000: begin seg <= 8'b1100_0000; end //0
        4'b0001: begin seg <= 8'b1111_1001; end //1
        4'b0010: begin seg <= 8'b1010_0100; end //2
        4'b0011: begin seg <= 8'b1011_0000; end //3
        4'b0100: begin seg <= 8'b1001_1001; end //4
        4'b0101: begin seg <= 8'b1001_0010; end //5
        4'b0110: begin seg <= 8'b1000_0010; end  //6
        4'b0111: begin seg <= 8'b1111_1000; end  //7
        4'b1000: begin seg <= 8'b1000_0000; end  //8
        4'b1001: begin seg <= 8'b1001_0000; end  //9
        4'b1010: begin seg <= 8'b1000_1000; end  //a
        4'b1011: begin seg <= 8'b1000_0011; end  //b
        4'b1100: begin seg <= 8'b1000_0110; end  //c
        4'b1101: begin seg <= 8'b1010_0001; end  //d
        4'b1110: begin seg <= 8'b1000_0110; end  //e
        4'b1111: begin seg <= 8'b1000_1110; end  //f
    endcase
end

endmodule