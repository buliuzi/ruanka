`timescale 1ns / 1ps
module show_num(
 clk,num,circle1,circle2,circle3,state,seg,an
    );
    input clk;
    input [31:0]num,circle1,circle2,circle3;
    input [1:0]state; 
    output [7:0] an;
    output [7:0] seg;
    wire [63:0]rom;
    makerom mr(num,circle1,circle2,circle3,state,rom);
    scan sc(clk,rom,seg,an);
endmodule

module makerom(num,circle1,circle2,circle3,state,rom);
//input clk,rst;
input [31:0]num,circle1,circle2,circle3;
input [1:0]state;
output reg [63:0] rom;

wire [7:0]p11,p12,p13,p14,p15,p16,p17,p18;
wire [7:0]p21,p22,p23,p24,p25,p26,p27,p28;
wire [7:0]p31,p32,p33,p34,p35,p36,p37,p38;
wire [7:0]p41,p42,p43,p44,p45,p46,p47,p48;
//wire clk_s;

Decode d1(num[3:0],p11);
Decode d2(num[7:4],p12);
Decode d3(num[11:8],p13);
Decode d4(num[15:12],p14);
Decode d5(num[19:16],p15);
Decode d6(num[23:20],p16);
Decode d7(num[27:24],p17);
Decode d8(num[31:28],p18);

Decode d9(circle1[3:0],p21);
Decode d10(circle1[7:4],p22);
Decode d11(circle1[11:8],p23);
Decode d12(circle1[15:12],p24);
Decode d13(circle1[19:16],p25);
Decode d14(circle1[23:20],p26);
Decode d15(circle1[27:24],p27);
Decode d16(circle1[31:28],p28);

Decode d17(circle2[3:0],p31);
Decode d18(circle2[7:4],p32);
Decode d19(circle2[11:8],p33);
Decode d20(circle2[15:12],p34);
Decode d21(circle2[19:16],p35);
Decode d22(circle2[23:20],p36);
Decode d23(circle2[27:24],p37);
Decode d24(circle2[31:28],p38);

Decode d25(circle3[3:0],p41);
Decode d26(circle3[7:4],p42);
Decode d27(circle3[11:8],p43);
Decode d28(circle3[15:12],p44);
Decode d29(circle3[19:16],p45);
Decode d30(circle3[23:20],p46);
Decode d31(circle3[27:24],p47);
Decode d32(circle3[31:28],p48);

//divider#(5000)(clk, clk_s);

always @(num or circle1 or circle2 or circle3) begin
//num three b
if(state==2'b00) begin
rom[63:56]=p18;
rom[55:48]=p17;
rom[47:40]=p16;
rom[39:32]=p15;
rom[31:24]=p14;
rom[23:16]=p13;
rom[15:8]=p12;
rom[7:0]=p11;
end
else if(state==2'b01) begin
rom[63:56]=p28;
rom[55:48]=p27;
rom[47:40]=p26;
rom[39:32]=p25;
rom[31:24]=p24;
rom[23:16]=p23;
rom[15:8]=p22;
rom[7:0]=p21;
end
else if(state==2'b10) begin
rom[63:56]=p38;
rom[55:48]=p37;
rom[47:40]=p36;
rom[39:32]=p35;
rom[31:24]=p34;
rom[23:16]=p33;
rom[15:8]=p32;
rom[7:0]=p31;
end
else begin
rom[63:56]=p48;
rom[55:48]=p47;
rom[47:40]=p46;
rom[39:32]=p45;
rom[31:24]=p44;
rom[23:16]=p43;
rom[15:8]=p42;
rom[7:0]=p41;
end
end

endmodule

module Decode(SW, SEG);
    input [3:0] SW;       // 16λ��������
	output reg [7:0] SEG;      // 7��������������͵�ƽ��Ч
    
    always @(SW[3:0])
    begin
        case(SW[3:0])
            4'b0000: SEG[7:0] = 8'b11000000;
            4'b0001: SEG[7:0] = 8'b11111001;
            4'b0010: SEG[7:0] = 8'b10100100;
            4'b0011: SEG[7:0] = 8'b10110000;
            4'b0100: SEG[7:0] = 8'b10011001;
            4'b0101: SEG[7:0] = 8'b10010010;
            4'b0110: SEG[7:0] = 8'b10000010;
            4'b0111: SEG[7:0] = 8'b11111000;
            4'b1000: SEG[7:0] = 8'b10000000;
            4'b1001: SEG[7:0] = 8'b10011000;
            4'b1010: SEG[7:0] = 8'b10001000;
            4'b1011: SEG[7:0] = 8'b10000011;
            4'b1100: SEG[7:0] = 8'b11000110;
            4'b1101: SEG[7:0] = 8'b10100001;
            4'b1110: SEG[7:0] = 8'b10000110;
            4'b1111: SEG[7:0] = 8'b10001110;
        endcase
    end
endmodule

module scan(input clk, input [63:0] rom,
    output reg [7:0] seg,output reg [7:0] an
);
    wire [63:0] sel;
    wire clk_d;
    divider #(5000) ddd(clk, clk_d);
    reg [2:0] cnt=0;
    initial begin
        an=0;
        seg=0;
    end
    assign sel = cnt*8+7;
    always @(posedge clk_d) begin
        seg <= rom[sel-:8];
        an <= ~(8'b00000001<<cnt);
        cnt <= cnt+1'b1;
    end
endmodule // dynamic_scan : ????????

module divider #(parameter N = 1000)
(clk, clk_N);
input clk;                      // ϵͳʱ��
output reg clk_N;                   // ��Ƶ���ʱ��
//parameter N = 100_000_000;      // 1Hz��ʱ��,N=fclk/fclk_N
reg [31:0] counter;             /* ������������ͨ������ʵ�ַ�Ƶ��
                                   ����������0������(N/2-1)ʱ��
                                   ���ʱ�ӷ�ת������������ */
always @(posedge clk)  begin    // ʱ��������
                              // ����ʵ��
    if(counter>=N/2)
    begin
    	clk_N<=~clk_N;
    	counter<=0;
    end
    else
    	counter<=counter+1;
end                           
endmodule