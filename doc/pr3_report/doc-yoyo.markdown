% 计算机组成原理 - 大实验\
实验报告
% 涂珂 2011011273 计14; 傅左右 2011011264 计14
% \today

\thispagestyle{empty}

# 实验目标

基于THINPAD教学计算机，设计：

- 基于MIPS16指令集的流水线CPU

- 使用基本存储、扩展存储、Flash、IO设备

- 能够运行kernel、监控程序、project1程序

# 实验成果指标

- CPU主频为6.25MHz（12.5MHz有时会出一些问题，所以只能二分之，6.25MHz是稳定频率）

- VGA分辨率为640*480

- **继续加啊**

# 实验成果简列

- 清晰的模块分工

- 指令集改进，指令集汇编工具

- 数据旁路

- 冒险检测

- 完整VGA调试工具

- FLASH自启动

- 地址映射统一管理IO设备

- 串口通信

- VGA、键盘交互
	- VGA等宽字符集
	- 键盘输入、支持换行、发送串口与VGA的记事本程序

# 整体设计图

**加图**


\begin{table}[h]
\begin{tabular}{@{}lllll@{}}
\toprule
控制信号         & 发生阶段 & 置0时           & 置1时                                   & 置10时         \\ \midrule
PCWrite      & IF   & null          & 写PC                                   &              \\
Branch（2位）   & ID   & PC+4          & PC+4+immediate                        & Reg1         \\
ForwardA(2位) & EX   & 来自寄存器堆的输出Reg1 & 转发写回的值                                & 转发上一次ALU运算结果 \\
ForwardB(2位） & EX   & 来自寄存器堆的输出Reg2 & 转发写回的值                                & 转发上一次ALU运算结果 \\
ALUsrc       & EX   & 来自寄存器堆的输出     & 来自符号扩展的立即数                            &              \\
ALUop（3位）    & EX   & 加             & 001:减,010:与，011:或，100:非，101:左移,110:右移 &              \\
Ttype        & EX   & 小于T为1         & 不等于T为1                                &              \\
Twrite       & EX   & null          & 写入T                                   &              \\
MemRead      & MEM  & null          & 读内存                                   &              \\
MemWrite     & MEM  & null          & 写内存                                   &              \\
MemtoReg     & WB   & 写入ALU输出值      & 写入内存输入值                               &              \\
RegWrite     & WB   & null          & 写入寄存器堆                                &             
\end{tabular}
\end{table}