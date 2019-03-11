# 《自己动手写CPU》 学习


**五段流水线**
- 取指      PC、IF|ID
- 译码      ID、Regfile、ID|EX
- 执行      EX、DIV、EX|MEM
- 访存      MEM、MEM|WB
- 回写      CP0、LLbit、HILO

右上角的CTRL模块用来进行流水的暂停，清除等动作

<img src="./image/OpenMipsPipeLine.png" height = "%100" width = "%100" >
<img src="./image/OpenMipsPipeLineDetail.png" height = "%100" width = "%100" >


根据前面的指示完成了可以运行ori指令的五段流水cpu

现在看 **第五章**

**流水线数据相关问题**

流水线的三种数据相关
- raw (read after write)
- war (write after read)、
- wrw (write afer write)

由于流水线的结构，只会存在raw，这以下又存在三种情况：
- 相邻指令数据相关（译码、执行）
- 相隔1条指令数据相关（译码，访存）
- 相隔2条指令数据相关（译码、写回）
  - 这个问题在regfile中已经解决了
    ``` verilog 
    else if ((raddr1 == waddr)&&(re1 == `ReadEnable)&&(we == `WriteEnable)) begin
        data1 <= wdata;
    end
    ```
对于前两种（相邻指令数据相关、相隔1条指令数据相关）的解决方法
- 插入暂停周期
- 编译器调度
- **数据前推**

