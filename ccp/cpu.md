# 《自己动手写CPU》 学习


**五段流水线**
- 取指      PC、IF|ID
- 译码      ID、Regfile、ID|EX
- 执行      EX、DIV、EX|MEM
- 访存      MEM、MEM|WB
- 回写      CP0、LLbit、HILO

右上角的CTRL模块用来进行流水的暂停，清除等动作

<img src="./image/OpenMipsPipeLine.png" height = "%70" width = "%70" >

