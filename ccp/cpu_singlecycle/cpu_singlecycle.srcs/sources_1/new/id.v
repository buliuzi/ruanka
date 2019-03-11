`include "defines.v"

module id(
  input wire rst,
  input wire[`InstAddrBus] pc_i,
  input wire[`InstBus] inst_i,
  
  //reg read data
  input wire[`RegBus] reg1_data_i,
  input wire[`RegBus] reg2_data_i,

  //reg write data
  output reg reg1_read_o,
  output reg reg2_read_o,
  output reg[`RegAddrBus] reg1_addr_o,
  output reg[`RegAddrBus] reg2_addr_o,
  
  //information to ex
  output reg[`AluOpBus] aluop_o,
  output reg[`AluSelBus] alusel_o,
  output reg[`RegBus] reg1_o,
  output reg[`RegBus] reg2_o,
  output reg[`RegAddrBus] wd_o,
  output reg wreg_o
);

wire[5:0] op = inst_i[31:26];
wire[5:0] funct = inst_i[5:0];

wire[4:0] rs = inst_i[25:21];
wire[4:0] rt = inst_i[20:16];
wire[4:0] rd = inst_i[15:11];

wire[4:0] shamt = inst_i[10:6];
wire[15:0] imm = inst_i[15:0];



reg[`RegBus] immExt;

reg instvalid;

////////////////////step1///////////////////////
always @(*) begin
  if(rst == `RstEnable) begin
    aluop_o <= `EXE_NOP_OP;
    alusel_o <= `EXE_RES_NOP;
    wd_o <= `NOPRegAddr;
    wreg_o <= `WriteDisable;
    instvalid <= `InstInvalid;
    reg1_read_o <= `ReadDisable;
    reg2_read_o <= `ReadDisable;
    reg1_addr_o <= `NOPRegAddr;
    reg2_addr_o <= `NOPRegAddr;
    immExt <= `ZeroWord;
  end else begin
    aluop_o <= `EXE_NOP_OP;
    alusel_o <= `EXE_RES_NOP;
    wd_o <= rd;
    wreg_o <= `WriteDisable;
    instvalid <= `InstValid;
    reg1_read_o <= `ReadDisable;
    reg2_read_o <= `ReadDisable;
    reg1_addr_o <= rs;
    reg2_addr_o <= rt;
    immExt <= `ZeroWord;

    case (op)
      `EXE_ORI: begin
        wreg_o <= `WriteEnable;
        aluop_o <= `EXE_OR_OP;
        alusel_o <= `EXE_RES_LOGIC;
        reg1_read_o <= `ReadEnable;
        reg2_read_o <= `ReadDisable;
        immExt <= {16'h0, imm};
        wd_o <= rt;
        instvalid <= `InstValid;
      end 
      default: begin
      end
    endcase
  end
end

always @(*) begin
  if(rst == `RstEnable) begin
    reg1_o <= `ZeroWord;
  end else if (reg1_read_o == `ReadEnable) begin
    reg1_o <= reg1_data_i;
  end else if (reg1_read_o == `ReadDisable) begin
    reg1_o <= immExt;
  end else begin
    reg1_o <= `ZeroWord;
  end
end

always @(*) begin
  if(rst == `RstEnable) begin
    reg2_o <= `ZeroWord;
  end else if (reg2_read_o == `ReadEnable) begin
    reg2_o <= reg2_data_i;
  end else if (reg2_read_o == `ReadDisable) begin
    reg2_o <= immExt;
  end else begin
    reg2_o <= `ZeroWord;
  end
end
endmodule // id