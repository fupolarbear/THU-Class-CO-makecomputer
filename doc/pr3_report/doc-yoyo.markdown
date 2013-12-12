% 计算机组成原理\
THINPAD大实验\
实验报告
% 涂珂 2011011273 计14; 傅左右 2011011264 计14
% \today

\thispagestyle{empty}

\clearpage

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



# 实验成果参数

- CPU主频为6.25MHz（12.5MHz有时会出一些问题，所以只能二分之，6.25MHz是稳定频率）

- RAM频率为25MHz

- 正常运行kernel内核程序，正常运行所有project1程序。

- VGA分辨率为640*480，VGA（显存）运行频率25MHz



# 实验成果简列

- 清晰的模块分工

- 指令集改进，指令集汇编工具

- 数据旁路元件

- 冒险检测单元

- 完整的VGA、LED、可调时钟调试工具链

- FLASH自启动

- 使用地址映射，统一管理外围I/O设备

- 串口通信

- VGA、键盘交互
	- VGA等宽ASCII字符集显示
	- VGA双端FIFO显存
	- 键盘输入、支持换行、发送串口与VGA的记事本程序


# 整体设计图

数据通路可详见datapath.png文件。

RTL综合图可见下，或者cpu-schematic.pdf。可以无限放大该页面。

![数据通路图 datapath.png](datapath.png)

![RTL综合图(可放大)](cpu-schematic.pdf)

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

关于每一条指令在流水的五个步骤中具体做了什么。表格无法正常显示。请见相关设计文档`instruction.xlsx`。


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

## 寄存器编址 {#regfileaddr}

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


# 主要模块设计  {#moddesign}

这一部分将简明扼要的介绍主要或关键模块的设计考量。更详细的设计细节可见下一个章节“[主要模块实现](#modimpl)”。

## 硬件

### ALU

运算逻辑单元，实现了以下7种基本运算（加法、减法、逻辑与、逻辑或、逻辑非、逻辑左移、逻辑右移）：

ALUop | 运算
------|-----
000 | a+b
001 | a-b
010 | a&b
011 | a|b
100 | ~a
101 | a << b
110 | a >> b

### BranchSelector

跳转选择器，根据不同的跳转指令及跳转条件决定PC是否跳转。

### Controller

控制器，输入Op，输出Op对应的控制信号（对应表见signal.xlsx）。由于自定义了指令集使得不同的指令对应的Op不同且类型相近的指令相邻，让这一部分得以简化。

### Decoder

译码器，将16位指令进行译码，向外输出5位指令编号Op，3个寄存器地址reg1、reg2、reg3和16位立即数imm。

在译码器中根据Op进行了立即数的扩展。3个寄存器地址中reg1、reg2为下一步将要读取的寄存器、reg3为将要写入的寄存器。

### MemoryTop

MemoryTop是总线上负责所有外围设备的通信的一个模块，相当于实际计算机中连接南北桥的芯片，目的是向CPU封装所有的外围设备的逻辑，由此分担工作、并简化CPU内部设计。

其职能可描述为：CPU从MemoryTop获取指令和数据，写入数据也需要通过MemoryTop。我们的MemoryTop负责管理RAM、FLASH、串口、PS2、VGA。

### Passer

数据冲突检测单元，看寄存器堆取出的值是否是EXE或MEM阶段未写回的值，若是，则通过旁路引回。共引入了4条旁路。

### RegFile

寄存器堆，负责所有寄存器，寄存器编址4位。具体可参见[寄存器编址分配表](#regfileaddr)。所有寄存器均是 _下降沿写入_ 。同时具有相应的调试接口。

### RiskChecker

控制冲突检查单元，主要是检测跳转指令所导致的寄存器未写回的冲突，并产生信号通过辅助的旁路元件处理解决相应的冲突。

### TReg

T寄存器，T寄存器的值需要额外的判断写入，故将其从寄存器堆中分离出来。置于EXE阶段，读取ALU的输出。  

所有指令中涉及到的T的写入分为2种，不等于和大于，所以我们通过ALU做减法，不等于即为ALU的输出不为0，大于即为ALU输出符号位为0。于是我们就可以直接根据控制信号Ttype、Twrite及ALU的输出直接计算出T寄存器的值输出。简化了内部逻辑。

### KeyTop

键盘模块。附属两个子模块`Keyboard.vhd`（完成接收键盘发送的信号和分析，进行滤波和去除毛刺，输出得到的扫描码），`KeySignaltoChar.vhd`（对键盘扫描码进行译码，翻译成内部的ASCII字符方言。）

### VGA\_top

VGA管理模块。具有一个显存和一个字模存储。外部可以通过传入指定地址和内部字符约定编码，就能更改显示内容。同时在开发阶段中被用来进行调试。


# 主要模块实现 {#modimpl}

这一部分将详细的介绍各个主要模块的实现细节。简明的设计思路可往回参看上一个章节“[主要模块设计](#moddesign)”。

## 硬件

### ALU

完全组合逻辑。接受外部传入的ALUop信号，通过case...when...语句进行相应运算并输出计算结果。

### BranchSelector

对不同Op表示的不同的跳转指令所需的条件进行判断，输出数据选择器Mux_PC的控制信号Branch，从而完成对跳转分支的选择功能。

~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5 caption="分支选择器 BranchSelector"}
...
case Op is
	when "11000" => -- B
		Branch <= "01";
	when "11001" => -- BTEQZ
		if T = '0' then 
			Branch <= "01";
		end if;
	when "11010" => -- BEQZ
		if RegInput = Int16_zero then 
			Branch <= "01";
		end if;
	when "11011" => --BNEZ
		if RegInput /= Int16_zero then 
			Branch <= "01";
		end if;
	when "11101" => --JR
		Branch <= "10";
	when "11100" => --JRRA*
		Branch <= "10";
	when others => null;
end case;
...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### Decoder

1. 通过Case语句判断高五位的值得到指令类型（5位指令编号Op）

2. 根据指令类型Op的不同决定在后续流程中将要读写的寄存器和立即数扩展的方式（每一条指令的执行细节可参见指令文档`instruction.xlsx`）

3. 输出下一步即将要读写的寄存器编址reg1（读）、reg2（读）、reg3（写）（没有使用寄存器则赋为零寄存器地址），以及扩展后的16位立即数imm。

### MemoryTop

MemoryTop是总线上负责所有外围设备的通信的一个关键模块，相当于实际计算机中连接南北桥的芯片，目的是向CPU封装所有的外围设备的逻辑，由此分担工作、并简化CPU内部设计。

其职能可描述为：CPU从MemoryTop获取指令和数据，写入数据也需要通过MemoryTop。我们的MemoryTop负责管理RAM、FLASH、串口、PS2、VGA，以及相应的地址映射。通过“SW”、“LW”指令，并配合相应的地址，就能完成读写外围设备的功能。

最后我们的实现是MemoryTop运行在CPU主频四倍的时钟频率上，为了保证CPU与外围设备时钟的一致，我们将总的时钟管理也交给MemoryTop，由MemoryTop四分频后的时钟输出给CPU使用。

MemoryTop以管理的设备分为下列几个子模块：

 - Flash管理（实现Flash自启动）
 
 - RAM读写（负责取指、写存的关键部位）
 
 - 键盘信息转发
 
 - 串口管理
 
 - 显存管理（VGA）

MemoryTop以实现的功能分为以下几个时序流程：

a. BOOT

	初始状态机，rst。转入BOOT\_FLASH。

b. BOOT\_FLASH

	调整FLASH信号，开始从FLASH中读取数据，由于FLASH延迟比较大，所以设置一个八位计时器。完成从FLASH读取指令之后，将取指令的地址+1，存入RAM2的地址亦+1。转入BOOT\_RAM2

c. BOOT\_RAM2

	将从FLASH中读取出的指令写入RAM2。转入BOOT\_READY。

d. BOOT\_READY

	检查读出指令的数量是否达到0xfff条。如果是，则跳出启动循环，转入READ1，进入正常的CPU工作循环。否则的话，转入BOOT\_FLASH状态，继续循环。

e. READ1

	在READ1与IDEL1两个状态中，向CPU输出的时钟信号为高位。在RW1与IDEL2中，向CPU输出的时钟信号为低位。这样就能四分频后输出给CPU一个稳定的时钟。
	
	READ1是CPU正常工作时的第一个工作流程。在这个状态机中，RAM的地址address1是下一条待取指令的地址，保持RAM_OE为低位，开始读出指令。转入IDEL1。

f. IDEL1

	IDEL1是第二个工作流程。在这个状态中，已经读出下一条指令（output1）。如果CPU要求串口通信的话（即访问地址为0xBF00），根据Decoder传来的指令信号（MemoryRead or MemoryWrite），就拉低串口读写使能。转入RW2。

g. RW1

	RW1是第三个工作流程，在这个状态中，程序将内部已经准备好的CPU取存的数据准备好。并通过output2转发出去。转入IDEL2。

h. IDEL2

	IDEL2是最后一个工作流程，是为了保证外围设备正常工作的一个缓冲周期。转入READ1。


address1，address2 均为18位拓展后的数据地址（为了适应总线宽度）。

固定的控制信号：

- VGA显存地址 <= address2

- VGA数据 <= dataInput(7 downto 0)

- RAM1使能 <= 1， RAM2使能 <= 0

- FLASH写使能、擦除使能 <= 1

- FLASH数据 <= "Z"

固定的状态信号：

a. 串口状态信号（访问地址0xBF01）

	根据约定，dataready（可读）放在倒数第二位，串口是否阻塞（可写）放在最后一位
	
	BF01 <= 0 \& serial\_dataready \& (serial\_tsre and serial\_trbe)

b. 键盘状态信号（访问地址0xBF03）

	根据约定，keyboard\_dataready在最后一位，表示是否可读入数据。
	
	BF03(0) <= Keyboard\_Dataready


\begin{table}[h]
\captionof{table}{外围设备的控制信号一览}
\label{tab:IOsignals}
\makebox[\linewidth]{
\centering
\begin{tabularx}{460pt}{X | X X X X X X X X}
信号 / 状态          & BOOT-FLASH & BOOT-RAM1         & BOOT-RAM2         & BOOT-READY & READ1    & IDEL1                      & RW1                        & IDEL2                      \\
\hline
基本总线        & "Z"         & "Z"                & "Z"                & "Z"         & "Z"      & Not MR (0xBF00) or "Z" & Not MR (0xBF00) or "Z" & Not MR (0xBF00) or "Z" \\
\rowcolor{Gray} 扩展总线        & "Z"         & flash-addr-input & flash-addr-input & "Z"         & "Z"      & data-input                  & data-input                  & "Z"                        \\
RAM2地址      & FLASH-PC   & FLASH-PC          & FLASH-PC          & ZERO        & address1 & address1                   & address2                   & address2                   \\
\rowcolor{Gray} RAM2-OE    & 1           & 1                  & 1                  & 0           & 0        & 0                          & Not MR                     & 0                          \\
RAM2-RW    & 1           & 1                  & 0                  & 1           & 1        & 1                          & 1 (0xBF00) or NOT MW   & 1                          \\
\rowcolor{Gray} serial-rdn & 1           & 1                  & 1                  & 1           & 1        & Not MR (0xBF00) or 1   & Not MR (0xBF00) or 1   & Not MR (0xBF00) or 1   \\
serial-wrn & 1           & 1                  & 1                  & 1           & 1        & 1                          & Not MW (0xBF00) or 1   & 1                          \\
\rowcolor{Gray} FLASH读使能    & 0           & 1                  & 1                  & 1           & 1        & 1                          & 1                          & 1                          \\
键盘读使能       & 0           & 0                  & 0                  & 0           & 0        & 0                          & MR (0xBF02)            & 0                          \\
\rowcolor{Gray} VGA写使能      & 0           & 0                  & 0                  & 0           & 0        & 0                          & MR (0xF*)              & 0                          \\
CPU-CLOCK  & 0           & 0                  & 0                  & 0           & 1        & 1                          & 0                          & 0                         
\end{tabularx}}
\end{table}

\FloatBarrier

### Passer

根据流水寄存器的值和译码阶段的寄存器的值判断是否有数据冲突，输出控制信号。

~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5 caption="数据冲突检测单元"}
...
if (EXMEM_RegWrite = '1' and EXMEM_W /= Zero_Reg and EXMEM_W = IDEX_R1) then
	ForwardA <= "10";
end if;
if (EXMEM_RegWrite = '1' and EXMEM_W /= Zero_Reg and EXMEM_W = IDEX_R2) then
	if IDEX_alusrc = '0' then
		ForwardB <= "10";
	else
		ForwardC <= "10";
	end if;
end if;
if (MEMWB_RegWrite = '1' and MEMWB_W /= Zero_Reg and EXMEM_W /= IDEX_R1 and MEMWB_W = IDEX_R1) then 
	ForwardA <= "01";
end if;
if (MEMWB_RegWrite = '1' and MEMWB_W /= Zero_Reg and EXMEM_W /= IDEX_R2 and MEMWB_W = IDEX_R2) then 
	if IDEX_alusrc = '0' then
		ForwardB <= "01";
	else 
		ForwardC <= "01";
	end if;
end if;
...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### RegFile

寄存器堆，负责所有寄存器，寄存器编址4位。具体可参见[寄存器编址分配表](#regfileaddr)。所有寄存器均是 _下降沿写入_ 。

同时具有相应的调试接口。在调试时能够通过拨码即时的向LED或者VGA输出。极大的方便了调试。

### RiskChecker

同Passer写法相同。控制冲突检查单元，主要是检测跳转指令所导致的寄存器未写回的冲突，并产生信号通过辅助的旁路元件处理解决相应的冲突。

### VGA\_top

可接受一个11位地址、8位数据、1位写使能的输入。用来写FIFO显存。显存和字模骨架是通过Xilinx的IP Core实例化得到。

**字模(char\_mem)**：通过编写的辅助程序，从等宽字库中抽取ASCII可打印字符的字模。进行地址映射和补0。最后生成一个10 * 15点阵。零扩充之后得到一个整的16 * 16 * 95内存空间。

**显存(fifo\_mem)**：整个VGA被设计为以一个字符显示（16 * 16）为单位，故相当于横向能放40个字符，竖向能放30个字符。也就是说显存只需要保存40 * 30个字符（7位）即可，将其零扩充得到64 * 32 * 8位深度的显存。

**零扩充**：零扩充虽然浪费了一定的门空间，但是带来的好处是显然的，即 _不需要乘法运算，只需要进行vector的连接运算就能计算显存与字模地址_ 。

可见下面的代码，`vector_x`是0-639的横坐标，`vector_y`是0-479的纵坐标。VGA是水平逐行扫描的。于是只需取`vector_x`前6位和`vector_y`的前5位进行显存寻址（获得7位表示字符编码的vector），就能表示某一个点正落在哪个字符的区域内。于是接下来取他们的后4位，再连接上7位表示字符的vector，进行字模寻址（获得1位当前点是否为亮点的boolean），就能表示当前字符下，该点的显示内容。我们没有考虑颜色，1表示当前点显示，即为红色。

按照如上的原理就能完成整个屏幕的显示。只需要简单的连接指令，不需要额外的乘法除法运算。减轻硬件负担。

~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5 caption="零扩充简化了寻址"}
signal vector_x : std_logic_vector(9 downto 0);		--X 10b 640
signal vector_y : std_logic_vector(8 downto 0);		--Y 9b 480

...
-- store char
ram: char_mem port map(clka => clk, addra => char_addr, douta => pr);
-- display cache
cache: fifo_mem port map(
	-- a for write -- wea: 1 is write signal
	clka => clk, wea => wctrl, addra => waddr, dina => wdata, 
	-- b for read
	clkb => clk, addrb => caddr, doutb => char
);

-- cache addr 5 + 6 = 11
caddr <= vector_y(8 downto 4) & vector_x(9 downto 4);

-- char acess addr 7 + 4 + 4 = 15
-- last 2 control the display-point(x, y)
-- first char control which char
char_addr <=  char(6 downto 0) & vector_y(3 downto 0) & vector_x(3 downto 0);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

该模块在调试时被编写成可以用来即时的十六进制显示各种输入数据，以`VGA_play.vhd`形式存在于工程中。在之后的阶段被移除了接口。

### KeyTop

对50MHz进行十分频，使用5MHz的时钟信号用于滤波。通过检测`F0`信号来判断一次按键。再将键盘的扫描码翻译成内部通信的ASCII方言（减去0x20）。其中键盘的dataready会在上升沿赋为0，表示数据已经失效。


## 硬件·补

### FLASH自启动

由于是MemoryTop管理时钟。MemoryTop一开始（或者rst）会进入一个从FLASH拷贝代码到RAM2上的自动机状态。拷贝代码的长度是一定的（0x0FFF）。然后MemoryTop再在其四个状态机中循环的时候向CPU输出时钟。于是CPU就从内核代码开始执行，于是启动过程顺利完成。

### 地址映射

主要存储：

- 系统程序区：0x0000-0x3FFF,16K
- 用户程序区：0x4000-0x7FFF,16K
- 系统数据区：0x8000-0xBEFF,16K
- 用户数据区：0xC000-0xF000,16K

外围设备：

- 串口
	- 串口1数据寄存器：0xBF00
	- 串口1状态寄存器：0xBF01
- 键盘
	- 串口2数据寄存器：0xBF02
	- 串口2状态寄存器：0xBF03
- VGA
	- FIFO显存：0xF000-0xFFFF,3K


## 软件

### Assembler (thcoas.py)

我们在武祥晋同学(2011011278)的基于python实现的汇编翻译器的基础上进行了改进，实现了对我们自己定义的指令集的编译工作。

具体使用方法：`python binToHex.py a.s`。汇编器会将MIPS汇编代码a.s编译输出a.s.bin的二进制文件，并在命令行上输出丰富的调试信息（二进制、十六进制代码、代码原文行号、翻译后的代码地址号、相应指令），从而极大的方便了后续的调试。

![汇编器截图 （代码原文行号、二进制、十六进制代码、翻译后的代码地址号、相应指令）](assembler.jpg)

### 简单记事本 (test_keyboard.s)

程序读取PS2键盘的输入，然后将结果发送至串口，同时显示在VGA上。在VGA上的显示支持换行。

![简单记事本程序(键盘输入，转发至VGA与串口)](notepad.jpg)



# 实验成果展示

CPU可运行所有指令，能正常运行Term。

## Xilinx编译报告

顺利完成所有综合、布线、生成二进制bin文件。

![Xilinx 编译结果报告](xilinx.jpg)


## RTL图

（可参见cpu-schematic.pdf）

![RTL图（可参见cpu-schematic.pdf）](RTL.jpg)


## 操作流程

0. kernel的二进制代码已经预先写入Flash。

1. 正确连线，将开关第5位拨到1 （将手动单步clk时钟转换到50M时钟）

2. 打开FlashAndRam.exe，将用户程序代码写入到RAM的0x4000处

	![使用工具程序，向RAM2写入用户程序](flashandram.jpg)

3. 打开Term

4. 在Xilinx中将CPU代码烧写进FPGA中，按rst复位系统

5. 系统将自动完成启动步骤，从Flash载入kernel代码并运行。

6. 在Term中连接串口，按G运行0x4000的用户程序，查看结果，R查看寄存器。

	![斐波那契数列运行结果](fib.jpg)

### 串口读写

程序读写串口。输出“23\\r\\n”。

![串口读写，写串口“23\\r\\n”](serial.jpg)

### 记事本（外设）

通过PS2键盘输入，然后将输入译码为ASCII码，将结果发送至串口，同时显示在VGA上。在VGA上的显示支持换行。读取键盘输入和VGA显示、串口发送，这些都是通过编写程序读取设备的映射地址获取设备数据而做到的，就像在真正的电脑上一样。

![键盘、串口及VGA显示的记事本](notepad2.jpg)

![整体测试](totaltest.jpg)



# 实验心得和体会

## 自定义指令集

课本上的指令集为了实现44条指令，不仅通过前5位作为Op判断指令类型，还需要通过其他的位才能判断具体是什么指令。这在decoder时，在一层case中要需要嵌套一层case语句来判断具体指令，而且在后面需要根据指令类型的运算中需要传入整个16位指令，不能只通过前5位op来判断。这很不方便。而我们的CPU只要求实现30条指令(25条基本+5条扩展)，因次前5位op完全足够判断指令类型，因此我们重新定义了指令集的二进制编码。定义指令集的过程中遵守相似的指令相邻。这样就可以少写很多case。如controller中对控制信号ALUSrc选择可以如下写，否则要通过大量case语句来实现，这里得到了大大的简化。


~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5}
if Op = "01010" or Op = "01011" or (Op >= "01110" and Op <= "10111") then
	ALUsrc <= '1';
else 
	ALUsrc <= '0';
end if;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## 数据通路的设计

数据通路完全由一个人设计，保证整个cpu设计的一致性。其中数据通路共修改了10多次。在写代码之前就改了7、8次。开始写cpu的模块后又发现了一些问题又改了数次。后来的修改主要在旁路的设计部分，刚开始写的时候考虑不周。写代码时完全按照数据通路来写，保证了程序的一致。写的时候深深感受到数据通路一定要先设计好，这样写的时候思路才流畅，犯的错误会相对少一些，检查起来也十分方便。

## 代码同步与管理

由于是两个人同时写代码，所以需要有效的代码管理和同步，我们使用了Git9对代码进行了管理。不仅能独立的在各自分支中开发相应功能，也能很快的同步对方的代码、查看小组的整体进度，还可以使用git工具对之前的提交版本进行对比从而更加高效的从错误中恢复。

![使用Git9管理代码(截至今天已经有128次提交)](git.png)

\FloatBarrier

## 代码调试

硬件的debug真是一件困难的事，它不能像软件一样输出一堆调试信息。我们只能利用有限的LED灯来debug，于是我们在RegFile中实现了一个debug模块，他能实时的通过改变开关的输入来改变显示的寄存器。后来我们写好了vga，就能输出信息在vga上来调试了，效率更高。
 
整个实现过程中遇到的最大的bug就是在我们刚开始运行kernel代码的时候，我们通过Term+串口+R命令试图读寄存器的值，总是在一个寄存器里出现了随机的结果，但是我们用led看到寄存器里的值的确是正确的。一开始我们以为是我们串口写得不对，后来用串口精灵仔细检查了一下，发现我们串口应该没有错，而只是多输出了一个值，我们认为那应该是执行kernel代码时的出现的错误，于是我们把kernel中每一个功能部分（于是第一次作业阅读kernel源代码就用上了）单独取出来一个阶段一个阶段的进行调试。最后我们把读寄存器的部分单独拿出来，然后通过手按clk单步执行代码来debug。这里涉及到手按与自动时钟的切换，我们写了一个模块来通过开关来快速切换两种时钟。最后单步执行观察寄存器的值发现时BTEQZ的一个冲突没解决好，导致多循环了一次。于是我们就恍然大悟原来是多循环了一次所以向串口多输出了一个无效值。于是我们马上在riskchecker中多加入一条旁路检查，然后程序顺利正常运行。

# 附录

## 文件目录结构

\dirtree{%
 .1 /.
 .2 assembler\DTcomment{汇编器(thcoas.py)、kernel、测试代码}.
 .2 doc\DTcomment{文档文件夹}.
 .2 src\DTcomment{代码文件夹}.
 .3 CPU\DTcomment{CPU工程}.
 .3 Flash\DTcomment{辅助的Flash工程}.
 .3 VGA\DTcomment{辅助的VGA工程}.
 .4 tool\DTcomment{编写的字模处理工具(python)}.
}

\clearpage

## 小记

从“奋斗20天，做台计算机”。

\ ![](hardwork0.png)

一路走过来，有用一堆莫名其妙的硬件第一次点亮了屏幕的喜悦。

\ ![](hardwork1.jpg)

也有DDL当天在C楼刷通苦苦调bug的内心抑郁。

\ ![](hardwork2.jpg)

\ ![](hardwork3.jpg)

不过令人开心的是，最后还是做出来了呢。画了那么久的图，研究了那么久的代码，调试了那么久。天不负我，总算有一个马马虎虎还行的结果了。

\ ![](notepad2.jpg)

真好。谢谢老师和助教。


