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

# 指令集任务

## THCO MIPS 基本指令集

序号	指令	    序号		指令
---	-------	----	-------
1	ADDIU 	 14		LW_SP
2	ADDIU3	 15		MFIH
3	ADDSP	 16		MFPC
4	ADDU	 17		MTIH
5	AND	     18		MTSP
6	B	     19		NOP
7	BEQZ	 20		OR
8	BNEZ	 21		SLL
9	BTEQZ	 22		SRA
10	CMP	     23		SUBU
11	JR	     24		SW
12	LI	     25		SW_SP
13	LW	

## 扩展指令集(402)

 - JRRA
 - SLTI
 - ADDSP3
 - NOT
 - SLT


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
	- VGA等宽ASCII字符集显示
	- VGA双端FIFO显存
	- 键盘输入、支持换行、发送串口与VGA的记事本程序

# 整体设计图

**加图**

# 重新设计的指令集

## 指令设计

 - 用前5位表示op。共30条。
 - 加*为扩展指令。
 - XXX，YYY，ZZZ为寄存器标号。
 - III为立即数。
 - 把类型相近的op连续起来，这样写代码就可以用大于小于判断了。

## R型指令

\begingroup
\ttfamily

R		指令结构
----	----------------
MFIH	00001XXX00000000
MFPC	00010XXX00000000
MTIH	00011XXX00000000
MTSP	00100XXX00000000
AND		00101XXXYYY00000
OR		00110XXXYYY00000
*NOT	00111XXXYYY00000
*SLT	01000XXXYYY00000
CMP		01001XXXYYY00000
SLL		01010XXXYYYIII00
SRA		01011XXXYYYIII00
ADDU	01100XXXYYYZZZ00
SUBU	01101XXXYYYZZZ00

\endgroup

## I型指令

\begingroup
\ttfamily

I		指令结构
-----	----------------
ADDSP	01110IIIIIIII000
LW_SP	01111XXX00000000
ADDIU	10000XXXIIIIIIII
*SLTI	10001XXXIIIIIIII
*ADDSP3	10010XXXIIIIIIII
LI		10011XXXIIIIIIII
ADDIU3	10100XXXYYY0IIII
LW		10101XXXYYYIIIII
SW		10110XXXYYYIIIII
SW_SP	10111XXXYYYIIIII

\endgroup

## B型指令

\begingroup
\ttfamily

B		指令结构
-----	----------------
B		11000IIIIIIIIIII
BTEQZ	11001IIIIIIII000
BEQZ	11010XXXIIIIIIII
BNEZ	11011XXXIIIIIIII

\endgroup

## J型指令

\begingroup
\ttfamily

J		指令结构
-----	----------------
*JRRA	1110000000000000
JR		11101XXX00000000

\endgroup

## NOP指令

\begingroup
\ttfamily

-----	----------------
NOP		0000000000000000
-----	----------------

\endgroup

## 指令流水细节

关于每一条指令在流水的五个步骤中具体做了什么。表格无法正常显示下。请见相关设计文档`instruction.xlsx`。


# 统一的信号及编码

## 控制信号

每一级流水阶段的寄存器均会储存相应信号。（显然的，当前指令与当前流水信号相对应）

\begin{table}[h]
\captionof{table}{控制信号表}
\label{tab:controlsignal}
\centering
\begin{tabularx}{\textwidth}{X X X X X}
控制信号         & 发生阶段 & 置0时           & 置1时                                   & 置10时         \\
\hline
PCWrite      & IF   & null          & 写PC                                   &              \\
\rowcolor{Gray} Branch(2位)   & ID   & PC+4          & PC+4+immediate                        & Reg1         \\
ForwardA(2位) & EX   & 来自寄存器堆的输出Reg1 & 转发写回的值 & 转发上一次ALU运算结果 \\
\rowcolor{Gray} ForwardB(2位) & EX   & 来自寄存器堆的输出Reg2 & 转发写回的值 & 转发上一次ALU运算结果 \\
ALUsrc       & EX   & 来自寄存器堆的输出     & 来自符号扩展的立即数                            &              \\
\rowcolor{Gray} ALUop(3位)    & EX   & 加             & 001:减,010:与, 011:或,100:非, 101:左移,110:右移 &              \\
Ttype        & EX   & 小于T为1         & 不等于T为1                                &              \\
\rowcolor{Gray} Twrite       & EX   & null          & 写入T                                   &              \\
MemRead      & MEM  & null          & 读内存                                   &              \\
\rowcolor{Gray} MemWrite     & MEM  & null          & 写内存                                   &              \\
MemtoReg     & WB   & 写入ALU输出值      & 写入内存输入值                               &              \\
\rowcolor{Gray} RegWrite     & WB   & null          & 写入寄存器堆                                &             \\
\end{tabularx}
\end{table}

## 寄存器编址

我们将特殊寄存器也看作普通的寄存器。将寄存器编码长度（3位）扩长一位，与特殊寄存器统一编址（4位）。这样在CPU内部处理的时候就能简化流程。

我们设置了SP、PC、RA、IH、Zero四个特殊寄存器。8个普通寄存器。特殊寄存器高位均为1。

\begin{table}[h]
\captionof{table}{寄存器编址表}
\label{tab:regfile}
\centering
\begin{tabular}{ll}
编码4位  & 寄存器     \\
\hline
0+XXX & 8个普通寄存器 \\
1000  & Zero    \\
1010  & PC      \\
1011  & IH      \\
1100  & RA      \\
1101  & SP
\end{tabular}
\end{table}

## 字符编码

我们将95个ASCII可打印字符的等宽字符写进了VGA控制模块的存储里。我们以空格（0x20）为偏移量，将每一个字符对应的ASCII码减去0x20作为内部字符编码。这样就有两个好处：一是减少地址量，二是可以用连接两个std_logic_vector的方法（`std_logic_vector & std_logic_vector`）计算字符地址。

## 指令集与控制信号关系表

\begin{table}[h]
\captionof{table}{指令与控制信号关系}
\label{tab:cmdandsignal}
\centering
\begin{tabularx}{\textwidth}{c X X X X X X X X X X}
指令      & Branch & ALU-op & ALU-src & T-type & T-write & Mem-Read & Mem-Write & Mem-to-Reg & Reg-Write \\
\hline
NOP     & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} MFIH    & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
MFPC    & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} MTIH    & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
MTSP    & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} AND     & 00     & 010   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
OR      & 00     & 011   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} NOT*    & 00     & 100   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
SLT*    & 00     & 001   & 0      & 0     & 1      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} CMP     & 00     & 001   & 0      & 1     & 1      & 0       & 0        & 0        & 0   \\
SLL     & 00     & 101   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} SRA     & 00     & 110   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
ADDU    & 00     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} SUBU    & 00     & 001   & 0      & 0     & 0      & 0       & 0        & 0        & 1   \\
ADDSP   & 00     & 000   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} LW\_SP  & 00     & 000   & 1      & 0     & 0      & 1       & 0        & 1        & 1   \\
SW\_SP  & 00     & 000   & 1      & 0     & 0      & 0       & 1        & 0        & 0   \\
\rowcolor{Gray} ADDIU   & 00     & 000   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
SLTI*   & 00     & 001   & 1      & 0     & 1      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} ADDSP3* & 00     & 000   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
LI      & 00     & 000   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
\rowcolor{Gray} ADDIU3  & 00     & 000   & 1      & 0     & 0      & 0       & 0        & 0        & 1   \\
LW      & 00     & 000   & 1      & 0     & 0      & 1       & 0        & 1        & 1   \\
\rowcolor{Gray} SW      & 00     & 000   & 1      & 0     & 0      & 0       & 1        & 0        & 0   \\
B       & 01     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} BTEQZ   & 01     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
BEQZ    & 01     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} BNEZ    & 01     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
JRRA*   & 10     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0   \\
\rowcolor{Gray} JR      & 10     & 000   & 0      & 0     & 0      & 0       & 0        & 0        & 0 
\end{tabularx}
\end{table}
