`include "defines.v"

module inst_rom(
  input wire ce,
  input wire[`InstAddrBus] addr,
  output reg[`InstBus] inst
);

reg[`InstBus] inst_mem[`InstMemNum-1:0];

initial begin
  $readmemh ("D:/ruanka/ccp/cpu_singlecycle/cpu_singlecycle.srcs/sources_1/new/inst_rom.data",inst_mem);
end

always @(*) begin
  if(ce == `ChipDisable) begin
    inst <= `ZeroWord;
  end else begin
    inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
  end
end

endmodule // inst_rom