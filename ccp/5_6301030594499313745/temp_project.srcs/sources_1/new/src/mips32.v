`timescale 1ns/1ps
// module mips32_test();
module mips32_test(oclk, seg, an, sw);
    input oclk;
    output [7:0] seg, an;
    input [1:0] sw;
    // reg clk;
    wire [31:0] PCout, PCSetAddr, PCnext, instr, WRData, rsvalue, rtvalue, ALUSrcB, ALUSrcA, InstrImmExt;
    wire [31:0] PCin, shamtExtend, Immediate, ALUResult, ALUResultExt, JumpAddr, MemData, RegisterValue;
    wire [31:0] PCoffset, SegIn, SegOut;
    wire PCWrite, WREnable, isShamt, isSigned, isBranch, isImm, ALUEqual, isJR, MemSign, isJAL;
    wire BranchTaken, Jumping, isBNE, ALUJudge, isJump, BareJump;
    wire [5:0] OPcode, funct;
    wire [4:0] rs, rt, rd, shamt, WRReg;
    wire [15:0] InstrImm;
    wire [25:0] InstrAddr;
    wire [3:0] ALUop;
    wire [1:0] MemSize, MemOp;
    wire SYSCALL, InstrEx, isLUI, isBEQ, BNEorBEQ, isStopped, SegWrite;
    wire clk;

    divider #(3000000) clkdiv(oclk, clk);
    // assign oclk = clk;

    register RegPC(clk, PCin, PCout, PCWrite);
    assign PCWrite = ~isStopped;
    assign PCnext = PCout + 4;
    assign PCin = Jumping ? PCSetAddr : PCnext;
    instr_mem #(12) IMEM(PCout, instr);

    // ====================== IF/ID

    assign OPcode = instr[31:26];
    assign funct = instr[5:0];
    assign rs = SYSCALL ? 4 : instr[25:21];
    assign rt = SYSCALL ? 2 : instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign shamtExtend = {{27{1'b0}}, shamt}; 
    assign InstrImm = instr[15:0];
    assign InstrAddr = {PCout[31:28], instr[25:0], 2'b00};
    assign InstrEx = instr[16];

    control ctrl(OPcode, funct, InstrEx, ALUop, isImm, WREnable,
    SYSCALL, isSigned, isBNE, isJR, isJump, isJAL,
    isBranch, MemSign, isLUI, isShamt, MemOp, MemSize, isBEQ);

    regfile regf(clk, rs, rt, WRReg, WRData, WREnable, rsvalue, rtvalue);

    assign ALUSrcB = isShamt ? shamtExtend : rsvalue;
    assign isStopped = (SYSCALL & (rtvalue == 50)) ? 1 : 0;
    assign SegWrite = (SYSCALL & (rtvalue == 34)) ? 1 : 0;

    extender32 #(16) InstrImmExtender(~isSigned, InstrImm, InstrImmExt);

    assign BareJump = (isJump | isJAL) & ~isJR;
    assign PCoffset = {{InstrImmExt[29:0]}, 2'b00};
    assign Immediate = isBranch ? 0 : InstrImmExt;
    assign ALUSrcA = isImm ? Immediate : rtvalue;
    assign JumpAddr = PCnext + PCoffset;
    assign PCSetAddr = BareJump ? InstrAddr : (isJR ? rsvalue : JumpAddr);

    // ========================= ID/EX

    ALU alu(ALUSrcA,ALUSrcB,ALUop,ALUEqual,ALUResult,ALUResultExt);

    // ========================= EX/MEM

    rwmemory DMEM(clk, MemOp, MemSign, MemSize, ALUResult, rtvalue, MemData);
    
    // ========================= MEM/WB
    assign RegisterValue = isJAL ? PCnext : (isLUI ? {InstrImm, 16'b0} :ALUResult);
    assign WRData = MemOp[0] ? MemData : RegisterValue;
    assign WRReg = isJAL ? 31 : (isImm ? rt : rd);

    assign BNEorBEQ = isBNE | isBEQ;

    assign ALUJudge = BNEorBEQ ? ALUEqual : ALUResult[0];
    assign BranchTaken = (isBNE && isBranch && (~ALUJudge)) || ((~isBNE) && isBranch && ALUJudge);
    assign Jumping = BranchTaken || isJump;

    // ======================= EXTRA
    assign SegIn = rsvalue;
    register segdisplay(clk, SegIn, SegOut, SegWrite);
    show_num sn(oclk, SegOut, 0, 0, 0, sw, seg, an);

    // ======================= TestBench
    // initial begin
    //     clk = 0;
    //     #16000 $finish;
    // end

    // always begin
    //     #2 clk = ~clk;
    // end
endmodule