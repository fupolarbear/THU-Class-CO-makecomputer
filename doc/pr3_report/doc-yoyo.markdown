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


# 主要模块设计

## 硬件

### ALU

运算逻辑单元， 实现了一下7种运算：

ALUop | 运算
------|-----
000 | a+b
001 | a-b
010 | a&b
011 | a\|b
100 | ~a
101 | a << b
110 | a >> b

### BranchSelector

跳转选择器，根据不同的跳转指令及跳转条件决定PC是否跳转。

### Controller

控制器，输入Op，输出Op对应的控制信号（对应表见signal.xlsx）。由于自定义了指令集使得不同的指令对应的Op不同且类型相近的指令相邻， 让这一部分得以简化。

### Decoder

译码器, 将16位指令译码为5位指令编号Op, 3个寄存器reg1,reg2,reg3和16位立即数imm。在译码器中根据Op进行了立即数的扩展。3个寄存器中reg1，reg2为读寄存器，reg3为写寄存器。

### MemoryTop

TODO

### Passer

数据冲突检测单元，看寄存器堆取出的值是否是EXE或MEM阶段未写回的值，若是，则通过旁路引回。共引入了4条旁路。

### RegFile

TODO

### RiskChecker

控制冲突检查单元，主要是检测跳转指令所判断寄存器未写回的冲突，通过旁路引回。

### TReg

T寄存器，T寄存器的值需要额外的判断写入，故将其从寄存器堆中分离出来。置于EXE阶段，读取alu的输出。  
所有指令中涉及到的T的写入分为2种，不等于和大于，故我们通过alu做减法，不等于即为alu的输出不为0， 大于即为alu输出符号位为0.
故可根据控制信号Ttype,Twrite及alu的输出算出T寄存器的值输出。

### VGA\_top

TODO

## 软件

### assenmbler(thcoas.py)

在武祥晋(2011011278)用python实现的编译器的基础上进行了更改，实现了对我们自己定义的指令集的编译工作。  
使用方法： `python binToHex.py a.s`, 会将mips汇编代码a.s编译输出a.s.bin的2进制文件，并在命令行上输出调试信息。

![assembler截图][1]

### 简单记事本(代码见test_keyboard.s)

将PS2键盘的输入直接显示到VGA上。

![记事本截图][2]

## 主要模块实现

设计见上面的主要模块设计。

### ALU

通过ALUop信号，通过case...when...语句计算结果。

### BranchSelector

对不同Op表示的不同的跳转指令所需的条件进行判断，输出选择器Mux_PC的控制信号Branch.

### Decoder

通过Case语句判断高五位的值得到指令类型，根据指令类型不同决定读写的寄存器，及立即数扩展的方式,输出完成要读或写的寄存器(没有则输出零寄存器)，及扩展后的立即数。

### MemoryTop

TODO

### Passer

根据流水寄存器的值和译码阶段的寄存器的值判断是否有数据冲突，输出控制信号。

~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5 caption="喵喵1"}
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### RegFile

TODO

### RiskChecker

同Passer写法相同。

### VGA\_top

TODO

# 实验心得和体会

## 自定义指令集

课本上的指令集为了实现44条指令，不仅通过前5位作为Op判断指令类型，还需要通过其他的位才能判断具体是什么指令。这在decoder时，在一层case中要需要嵌套一层case语句来判断具体指令，而且在后面需要根据指令类型的运算中需要传入整个16位指令，不能只通过前5位op来判断。这很不方便。而我们得cpu只要求实现30条指令(25条基本+5条扩展)，因次前5位op完全足够判断指令类型，因此我们自定义了指令集。定义指令集的过程中遵守相似的指令相邻。这样就可以少写很多case。如controller中对控制信号ALUSrc选择可以如下写：

~~~~ {.vhdl .numberLines startFrom="1" stepnumber=5 caption="寄存器堆 - RegFile"}
if Op = "01010" or Op = "01011" or (Op >= "01110" and Op <= "10111") then
	ALUsrc <= '1';
else 
	ALUsrc <= '0';
end if;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

否则要通过大量case语句来实现，这里得到了大大的简化。

## 数据通路的设计

数据通路完全由一个人设计，保证整个cpu设计的一致性。其中数据通路共修改了10多次。在写代码之前就改了7,8次。开始写cpu的模块后又发现了一些问题又改了数次。后来的修改主要在旁路的设计部分，刚开始写的时候考虑不周。写代码时完全按照数据通路来写，保证程序一致。写的时候深深感受到数据通路一定要先设计好，这样才有一个好的思路，写起来也比较快。

## 代码同步与管理

由于是2个人同时写代码，所以需要代码的同步，我们使用了git进行同步，能很快的同步对方的代码。在修改错误时还能回滚到上一正确的版本。

## debug

硬件的debug真是一件困难的事，它不能像软件一样输出一堆调试信息。我们只能利用有限的LED灯来debug，于是我们在RegFile中实现了一个debug模块，他能实时的通过改变开关的输入来改变显示的寄存器。后来我们写好了vga，就能输出信息在vga上来调试了，效率更高。  
整个实现过程中遇到的最大的bug就是我们通过Term读寄存器的值时老是可能有一个寄存器里出现了随机的结果，但是我们用led看到寄存器里的确是正确的。开始我们认为是我们串口写得不对，后来用仔细检查了一下发现我们串口应该没有错，那应该是执行kernel代码时的错，于是我们把kennel中读寄存器的部分单独拿出来写在一个文件了，通过手按clk来debug。这里涉及到手按与自动时钟的切换，我们写了一个模块来通过开关来快速切换2种时钟。最后单步执行观察寄存器的值发现时BTEQZ的一个冲突没解决好导致多循环了一次。我们马上在riskchecker中多加入一条旁路程序运行正常。
    

  [1]: ./assembler.jpg
  [2]: ./notepad.jpg