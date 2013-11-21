## 模块接口
### PC寄存器 PCReg
 - Input: in 15 downto 0
 - Output: out 15 downto 0
 - clk: in
 - rst: in
 - PCWrite: in

### T寄存器 TReg
 - input: in 15 downto 0
 - Ttype: in 
 - TWrite: in
 - T: out

### 加法器 Add
 - input1: in 15 downto 0
 - input2: in 15 downto 0
 - output: out 15 downto 0

### 数据选择器 Mux
 - choice: in 1 downto 0
 - input1: in 15 downto 0
 - input2: in 15 downto 0
 - input3: in 15 downto 0
 - output: out 15 downto 0

### 译码器 Decoder
 - Instruction: in 15 downto 0
 - op: out 4 down to 0
 - Reg1: out 3 downto 0
 - Reg2: out 3 downto 0
 - Reg3: out 3 downto 0
 - Imm: out 15 downto 0 //立即数扩展？

### 指令寄存器 InstructionMem
 - Address：in 15 downto 0
 - data: out 15 downto 0

### 寄存器堆 RegFile
 - ReadAddress1: in 3 downto 0
 - ReadAddress2: in 3 downto 0
 - WriteAddress: in 3 downto 0
 - WriteData: in out 15 downto 0
 - Reg1: out 15 downto 0
 - Reg2: out 15 downto 0
 - RegWrite: in
 - rst: in
 - clk: in

### 数据存储器 DataMem
 - Address: in 15 downto 0
 - Input: in 15 downto 0
 - output: out15 downto 0
 - MemWrite: in
 - MemRead: in

### 运算器 ALU
 - input1: in 15 downto 0
 - input2: in 15 downto 0
 - output: out 15 downto 0
 - ALUop: in 2 downto 0

### IFID流水寄存器 IF_ID
 - Instruction_in: in 15 downto 0
 - Instruction_out: out 15 downto 0
 - PC_in: in 15 downto 0
 - PC_out: out 15 downto 0
 - clk: in
 - rst: in
 - WriteIn: in

### IDEX流水寄存器  ID_EX
 - clk: in
 - rst: in
 - WriteIn: in
 - ALUopInput: in 2 downto 0
 - ALUsrcInput: in
 - TtypeInput: in
 - TWriteInput: in
 - MemReadInput: in
 - MemWriteInput: in
 - MemtoRegInput: in
 - ALUopOutput: out 2 downto 0
 - ALUsrcOutput: out
 - TtypeOutput: out
 - TWriteOutput: out
 - MemReadOutput: out
 - MemWriteOutput: out
 - MemtoRegOutput: out
 - DataInpu1: in 15 downto 0
 - DataInput2: in 15 downto 0
 - ImmediateInput: in 15 downto 0
 - ALUdata1: out 15 downto 0
 - ALUdata2: out 15 downto 0
 - ImmediateOutput: out 15 downto 0
 - RegReadInput1: in 3 downto 0
 - RegReadInput2: in 3 downto 0
 - RegWriteInput: in 3 downto 0
 - RegReadOutput1: out 3 downto 0
 - RegReadOutput2: out 3 downto 0
 - RegWriteOutput: out 3 downto 0

### EXMEM流水寄存器  EX_MEM
 - clk: in
 - rst: in
 - WriteIn: in
 - MemReadInput: in
 - MemWriteInput: in
 - MemtoRegInput: in
 - MemReadOutput: out
 - MemWriteOutput: out
 - MemtoRegOutput: out
 - DataInput: in 15 downto 0
 - DataOutput: out 15 downto 0
 - RegReadInput1: in 3 downto 0
 - RegReadInput2: in 3 downto 0
 - RegWriteInput: in 3 downto 0
 - RegReadOutput1: out 3 downto 0
 - RegReadOutput2: out 3 downto 0
 - RegWriteOutput: out 3 downto 0

### MEMWB流水寄存器  MEM_WB
 - clk: in
 - rst: in
 - WriteIn: in
 - MemtoRegInput: in
 - MemtoRegOutput: out
 - AluResultInput: in 15 downto 0
 - AluResultOutput: out 15 downto 0
 - RegReadInput1: in 3 downto 0
 - RegReadInput2: in 3 downto 0
 - RegWriteInput: in 3 downto 0
 - RegReadOutput1: out 3 downto 0
 - RegReadOutput2: out 3 downto 0
 - RegWriteOutput: out 3 downto 0

### 控制单元 Controller
 - op: in 4 downto 0
 - rst: in
 - Branch: out 1 downto 0
 - ALUop: out 2 downto 0
 - Ttype: out
 - TWrite: out
 - MemRead: out
 - MemWrite: out
 - MemtoReg: out

### 转发单元 Passer
 - EXMEM_RegWrite: in
 - MEMWB_RegWrite: in
 - EXMEM_W: in 3 downto 0
 - MEMWB_W: in 3 downto 0
 - IDEX_R1: in 3 downto 0
 - IDEX_R2: in 3 downto 0
 - ForwardA: out 2 downto 0
 - ForwardB: out 2 downto 0

### 冒险检测单元 RiskChecker
 - PCWrite：out
 - IFIDWrite: out
 - ControlRst: out
 - IDEX_MemWrite: in
 - IDEX_W: in
 - IDEX_R1: in
 - IDEX_R2: in