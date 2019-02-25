module regfile(
  input wire clk,
  input wire rst,

  //write
  input wire we,
  input wire[`RegAddrBus] waddr,
  input wire[`RegBus] wdata,
  
  //read1
  input wire re1,
  input wire[`RegAddrBus] raddr1,
  input wire[`RegBus] rdata1,

  //write
  input wire re2,
  input wire[`RegAddrBus] raddr2,
  input wire[`RegBus] rdata2
);

reg[`RegBus] regs[`RegNum-1:0];

always @(posedge clk) begin
  if (rst == `RstDisable) begin
    if ((we == `WriteEnable)&&(waddr != `RegNumLog2'h0))) begin
      regs[waddr] <= wdata;
    end
  end
end

always @(*) begin
  if (rst == `RstEnable) begin
    rdata1 <= `ZeroWord;
  end else if (raddr1 == `RegNumLog2'h0) begin
    rdata1 <= `ZeroWord;
  end else if ((raddr1 == raddr)&&(re1 == `ReadEnable)&&(we == `WriteEnbale)) begin
    rdata1 <= wdata;
  end else if (re1 == `ReadEnable) begin
    rdata1 <= regs[raddr1];
  end else begin
    rdata1 <= `ZeroWord;
  end
end

always @(*) begin
  if (rst == `RstEnable) begin
    rdata2 <= `ZeroWord;
  end else if (raddr2 == `RegNumLog2'h0) begin
    rdata2 <= `ZeroWord;
  end else if ((raddr2 == raddr)&&(re2 == `ReadEnable)&&(we == `WriteEnbale)) begin
    rdata2 <= wdata;
  end else if (re2 == `ReadEnable) begin
    rdata2 <= regs[raddr2];
  end else begin
    rdata2 <= `ZeroWord;
  end
end

endmodule // regfile