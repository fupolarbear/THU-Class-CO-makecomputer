
## 主要模块设计 
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
```
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
```
### RegFile
TODO

### RiskChecker
同Passer写法相同。

### VGA\_top
TODO

## 实验心得和体会
### 自定义指令集
课本上的指令集为了实现44条指令，不仅通过前5位作为Op判断指令类型，还需要通过其他的位才能判断具体是什么指令。这在decoder时，在一层case中要需要嵌套一层case语句来判断具体指令，而且在后面需要根据指令类型的运算中需要传入整个16位指令，不能只通过前5位op来判断。这很不方便。而我们得cpu只要求实现30条指令(25条基本+5条扩展)，因次前5位op完全足够判断指令类型，因此我们自定义了指令集。定义指令集的过程中遵守相似的指令相邻。这样就可以少写很多case。如controller中对控制信号alusrc选择可以如下写：

```
if Op = "01010" or Op = "01011" or (Op >= "01110" and Op <= "10111") then
	ALUsrc <= '1';
else 
	ALUsrc <= '0';
end if;
```
否则要通过大量case语句来实现，这里得到了大大的简化。

### 数据通路的设计
数据通路完全由一个人设计，保证整个cpu设计的一致性。其中数据通路共修改了10多次。在写代码之前就改了7,8次。开始写cpu的模块后又发现了一些问题又改了数次。后来的修改主要在旁路的设计部分，刚开始写的时候考虑不周。写代码时完全按照数据通路来写，保证程序一致。写的时候深深感受到数据通路一定要先设计好，这样才有一个好的思路，写起来也比较快。

### 代码同步与管理
由于是2个人同时写代码，所以需要代码的同步，我们使用了git进行同步，能很快的同步对方的代码。在修改错误时还能回滚到上一正确的版本。

### debug
硬件的debug真是一件困难的事，它不能像软件一样输出一堆调试信息。我们只能利用有限的LED灯来debug，于是我们在RegFile中实现了一个debug模块，他能实时的通过改变开关的输入来改变显示的寄存器。后来我们写好了vga，就能输出信息在vga上来调试了，效率更高。  
整个实现过程中遇到的最大的bug就是我们通过Term读寄存器的值时老是可能有一个寄存器里出现了随机的结果，但是我们用led看到寄存器里的确是正确的。开始我们认为是我们串口写得不对，后来用仔细检查了一下发现我们串口应该没有错，那应该是执行kernel代码时的错，于是我们把kennel中读寄存器的部分单独拿出来写在一个文件了，通过手按clk来debug。这里涉及到手按与自动时钟的切换，我们写了一个模块来通过开关来快速切换2种时钟。最后单步执行观察寄存器的值发现时BTEQZ的一个冲突没解决好导致多循环了一次。我们马上在riskchecker中多加入一条旁路程序运行正常。
    

  [1]: ./assembler.jpg
  [2]: ./notepad.jpg