----------------------------------------------------------------------------------
-- Company: 
-- Engineer: tuk
-- 
-- Create Date:    18:57:52 11/21/2013 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
	Port (
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		
		Ram1Addr : out  STD_LOGIC_VECTOR (17 downto 0);
		Ram1Data : inout  STD_LOGIC_VECTOR (15 downto 0);
		Ram1OE : out  STD_LOGIC;
		Ram1WE : out  STD_LOGIC;
		Ram1EN : out  STD_LOGIC;
--		Ram2Addr : out  STD_LOGIC_VECTOR (17 downto 0);
--		Ram2Data : inout  STD_LOGIC_VECTOR (15 downto 0);
--		Ram2OE : out  STD_LOGIC;
--		Ram2WE : out  STD_LOGIC;
--		Ram2EN : out  STD_LOGIC
		
		LED_output : out std_logic_vector(15 downto 0);
		ledseg1: out std_logic_vector(6 downto 0);
		ledseg2: out std_logic_vector(6 downto 0);
		
		KEY16_INPUT: in std_logic_vector(3 downto 0)
	);
end CPU;

architecture Behavioral of CPU is
--IF
component PCReg is
    Port ( Input : in  Int16;
		Output : out  Int16;
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		PCWrite : in  STD_LOGIC);
end component;
component Mux is
	Port ( choice : in  STD_LOGIC_VECTOR (1 downto 0);
		Input1 : in  Int16;
		Input2 : in  Int16;
		Input3 : in  Int16;
		Output : out  Int16);
end component;
component Mux2 is
    Port ( choice : in  STD_LOGIC;
           Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Add is
    Port ( Input1 : in  Int16;
		Input2 : in  Int16;
		Output : out Int16);
end component;
component InstructionMem is
    Port (
		rst : in std_logic;
		clk : in std_logic;
		Address : in  Int16;
		Data : out  Int16;
		ramdata : INOUT std_logic_vector(15 downto 0);      
		ramaddr : OUT std_logic_vector(17 downto 0);
		OE : OUT std_logic;
		WE : OUT std_logic;
		EN : OUT std_logic
		);
end component;

component IF_ID is
    Port ( Instruction_in : in  Int16;
		Instruction_out : out  Int16;
		PC_in : in  Int16;
		PC_out : out  Int16;
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		WriteIn : in  STD_LOGIC);
end component;

--ID
component Decoder is
    Port ( Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
		Op : out  STD_LOGIC_VECTOR (4 downto 0);
		Reg1 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg2 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg3 : out  STD_LOGIC_VECTOR (3 downto 0);
		Imm : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Controller is
    Port ( Op : in  STD_LOGIC_VECTOR (4 downto 0);
		rst : in  STD_LOGIC;
		ALUop : out  STD_LOGIC_VECTOR (2 downto 0);
		ALUsrc : out STD_LOGIC;
		TType : out  STD_LOGIC;
		TWrite : out  STD_LOGIC;
		MemRead : out  STD_LOGIC;
		MemWrite : out  STD_LOGIC;
		MemtoReg : out  STD_LOGIC;
		RegWrite: out STD_LOGIC);
end component;
component BranchSelector is
    Port ( Op : in  STD_LOGIC_VECTOR (4 downto 0);
		RegInput : in  STD_LOGIC_VECTOR (15 downto 0);
		T : in  STD_LOGIC;
		Branch : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
component RegFile is
    Port ( ReadAddress1 : in  STD_LOGIC_VECTOR (3 downto 0);
		ReadAddress2 : in  STD_LOGIC_VECTOR (3 downto 0);
		WriteAddress : in  STD_LOGIC_VECTOR (3 downto 0);
		WriteData : in  STD_LOGIC_VECTOR (15 downto 0);
		Reg1 : out  STD_LOGIC_VECTOR (15 downto 0);
		Reg2 : out  STD_LOGIC_VECTOR (15 downto 0);
		RegWrite : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		sel: in std_logic_vector(3 downto 0);
		LED_output: out std_logic_vector(15 downto 0);
		debug: in std_logic_vector(15 downto 0)
		);
end component;
component RiskChecker is
    Port ( PCWrite : out  STD_LOGIC;
		IFIDWrite : out  STD_LOGIC;
		ControlRst : out  STD_LOGIC;
		IDEX_MemWrite : in  STD_LOGIC;
		IDEX_W : in  Int4;
		IFID_R1 : in  Int4;
		IFID_R2 : in  Int4);
end component;

component ID_EX is
    Port ( clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		WriteIn : in  STD_LOGIC;
		ALUopInput : in  STD_LOGIC_VECTOR (2 downto 0);
		ALUsrcInput : in  STD_LOGIC;
		TTypeInput : in  STD_LOGIC;
		TWriteInput : in  STD_LOGIC;
		MemReadInput : in  STD_LOGIC;
		MemWriteInput : in  STD_LOGIC;
		MemtoRegInput : in  STD_LOGIC;
		ALUopOutput : out  STD_LOGIC_VECTOR (2 downto 0);
		ALUsrcOutput : out  STD_LOGIC;
		TTypeOutput : out  STD_LOGIC;
		TWriteOutput : out  STD_LOGIC;
		MemReadOutput : out  STD_LOGIC;
		MemWriteOutput : out  STD_LOGIC;
		MemtoRegOutput : out  STD_LOGIC;
		RegWriteInput: in STD_LOGIC;
		RegWriteOutput: out STD_LOGIC;
		DataInput1 : in  STD_LOGIC_VECTOR (15 downto 0);
		DataInput2 : in  STD_LOGIC_VECTOR (15 downto 0);
		ImmediateInput : in  STD_LOGIC_VECTOR (15 downto 0);
		RegResult: out Int16;
		ALUdata1 : out  STD_LOGIC_VECTOR (15 downto 0);
		ALUdata2 : out  STD_LOGIC_VECTOR (15 downto 0);
		RegReadInput1 : in  STD_LOGIC_VECTOR (3 downto 0);
		RegReadInput2 : in  STD_LOGIC_VECTOR (3 downto 0);
		RegWriteToInput : in  STD_LOGIC_VECTOR (3 downto 0);
		RegReadOutput1 : out  STD_LOGIC_VECTOR (3 downto 0);
		RegReadOutput2 : out  STD_LOGIC_VECTOR (3 downto 0);
		RegWriteToOutput : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

--EX 
component ALU is
    Port ( Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
		Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
		Output : out  STD_LOGIC_VECTOR (15 downto 0);
		ALUop : in  STD_LOGIC_VECTOR (2 downto 0));
end component;
component TReg is
    Port ( Input : in  STD_LOGIC_VECTOR (15 downto 0);
		TType : in  STD_LOGIC;
		TWrite : in  STD_LOGIC;
		T : out  STD_LOGIC);
end component;
component Passer is
    Port ( EXMEM_RegWrite : in  STD_LOGIC;
		MEMWB_RegWrite : in  STD_LOGIC;
		EXMEM_W : in  STD_LOGIC_VECTOR (3 downto 0);
		MEMWB_W : in  STD_LOGIC_VECTOR (3 downto 0);
		IDEX_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
		IDEX_R2 : in  STD_LOGIC_VECTOR (3 downto 0);
		ForwardA : out  STD_LOGIC_VECTOR (1 downto 0);
		ForwardB : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component EX_MEM is
	Port ( clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		WriteIn : in  STD_LOGIC;
		MemReadInput : in  STD_LOGIC;
		MemWriteInput : in  STD_LOGIC;
		MemtoRegInput : in  STD_LOGIC;
		RegWriteInput: in STD_LOGIC;
		RegWriteOutput: out STD_LOGIC;
		MemReadOutput : out  STD_LOGIC;
		MemWriteOutput : out  STD_LOGIC;
		MemtoRegOutput : out  STD_LOGIC;
		RegResultInput: in Int16;
		RegResultOutput: out Int16;
		DataInput : in  STD_LOGIC_VECTOR (15 downto 0);
		DataOutput : out  STD_LOGIC_VECTOR (15 downto 0);
		RegReadInput1 : in  STD_LOGIC_VECTOR (3 downto 0);
		RegReadInput2 : in  STD_LOGIC_VECTOR (3 downto 0);
		RegWriteToInput : in  STD_LOGIC_VECTOR (3 downto 0);
		RegReadOutput1 : out  STD_LOGIC_VECTOR (3 downto 0);
		RegReadOutput2 : out  STD_LOGIC_VECTOR (3 downto 0);
		RegWriteToOutput : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- MEM
component DataMem is
    Port ( Address : in  STD_LOGIC_VECTOR (15 downto 0);
		Input : in  STD_LOGIC_VECTOR (15 downto 0);
		Output : out  STD_LOGIC_VECTOR (15 downto 0);
		MemWrite : in  STD_LOGIC;
		MemRead : in  STD_LOGIC);
end component;

component MEM_WB is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           WriteIn : in  STD_LOGIC;
           MemtoRegInput : in  STD_LOGIC;
           MemtoRegOutput : out  STD_LOGIC;
			RegWriteInput: in STD_LOGIC;
			RegWriteOutput: out STD_LOGIC;
           AluResultInput : in  STD_LOGIC_VECTOR (15 downto 0);
           AluResultOutput : out  STD_LOGIC_VECTOR (15 downto 0);
			MemResultInput: in STD_LOGIC_VECTOR (15 downto 0);
			MemResultOutput: out STD_LOGIC_VECTOR (15 downto 0);
			RegReadInput1 : in  STD_LOGIC_VECTOR (3 downto 0);
           RegReadInput2 : in  STD_LOGIC_VECTOR (3 downto 0);
           RegWriteToInput : in  STD_LOGIC_VECTOR (3 downto 0);
           RegReadOutput1 : out  STD_LOGIC_VECTOR (3 downto 0);
           RegReadOutput2 : out  STD_LOGIC_VECTOR (3 downto 0);
           RegWriteToOutput : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component divClk is
	Port ( rst : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		clk0 : out  STD_LOGIC);
end component;


component LED_seg7 is
	Port(
		input : in  STD_LOGIC_VECTOR (3 downto 0);
		output : out  STD_LOGIC_VECTOR (6 downto 0)
	);
end component;


signal pcreg_input: Int16:= Int16_Zero;
signal pcreg_output: Int16:= Int16_Zero;

signal pc_add4: Int16:= Int16_Zero;
signal pc_imm: Int16:= Int16_Zero;
-- signal pc_reg: Int16:= Int16_Zero;

signal instmem_data: Int16:= Int16_Zero;

signal IFID_inst_out: Int16:= Int16_Zero;
signal IFID_pc_out: Int16:= Int16_Zero;
signal IFID_writein: std_logic:= '1';

signal decoder_op: Int5 := Int5_Zero;
signal decoder_reg1: Int4 := Int4_One;
signal decoder_reg2: Int4 := Int4_One;
signal decoder_reg3: Int4 := Int4_One;
signal decoder_imm: Int16 := Int16_Zero;

signal controller_rst: std_logic := '0';

signal regfile_reg1: Int16:= Int16_Zero;
signal regfile_reg2: Int16:= Int16_Zero;
signal regfile_writedata: Int16:= Int16_Zero;

signal IDEX_aluop: Int3 := Int3_Zero;
signal IDEX_alusrc: std_logic:= '0';
signal IDEX_ttype: std_logic:= '0';
signal IDEX_twrite: std_logic:= '0';
signal IDEX_memread: std_logic:= '0';
signal IDEX_memwrite: std_logic:= '0';
signal IDEX_memtoreg: std_logic:= '0';
signal IDEX_regwrite: std_logic:= '0';
signal IDEX_aludata1: Int16 := Int16_Zero;
signal IDEX_aludata2: Int16 := Int16_Zero;
signal IDEX_regread1: Int4 := Int4_One;
signal IDEX_regread2: Int4 := Int4_One;
signal IDEX_regwriteto: Int4 := Int4_One;
signal IDEX_regresult: Int16:= Int16_Zero;
-- EXE
signal T_sign: std_logic:= '0';
signal alu_input1: Int16:= Int16_Zero;
signal alu_input2: Int16:= Int16_Zero;
signal alu_output: Int16:= Int16_Zero;

signal EXMEM_memread: std_logic:= '0';
signal EXMEM_memwrite: std_logic:= '0';
signal EXMEM_memtoreg: std_logic:= '0';
signal EXMEM_regwrite: std_logic:= '0';
signal EXMEM_regread1: Int4 := Int4_One;
signal EXMEM_regread2: Int4 := Int4_One;
signal EXMEM_regwriteto: Int4 := Int4_One;
signal EXMEM_data: Int16:= Int16_Zero;
signal EXMEM_regresult: Int16:= Int16_Zero;

signal MEMWB_regwrite: std_logic:= '0';
signal MEMWB_regread1: Int4 := Int4_One;
signal MEMWB_regread2: Int4 := Int4_One;
signal MEMWB_regwriteto: Int4 := Int4_One;
signal MEMWB_aluresult: Int16:= Int16_Zero;
signal MEMWB_memresult: Int16:= Int16_Zero;
signal MEMWB_memtoreg: std_logic:= '0';

--MEM
signal DataMem_output: Int16:= Int16_Zero;

-- control signal
signal pcwrite: std_logic:= '1';
signal branch: std_logic_vector(1 downto 0):= "00";
signal aluop: Int3:= Int3_Zero;
signal alusrc: std_logic:= '0';
signal ttype: std_logic:= '0';
signal twrite: std_logic:= '0';
signal memread: std_logic:= '0';
signal memwrite: std_logic:= '0';
signal memtoreg: std_logic:= '0';
signal regwrite: std_logic:= '0';

signal forwardA: std_logic_vector(1 downto 0):= "00";
signal forwardB: std_logic_vector(1 downto 0):= "00";

signal clk0: std_logic:='0';
signal fuck: std_logic_vector(15 downto 0):=Int16_Zero;
begin
	PCReg_1: PCReg port map(
		Input => pcreg_input,
		Output => pcreg_output,
		clk => clk0,
		rst => rst,
		PCWrite => pcwrite
		);
	Mux_PC: Mux port map(
		choice => branch,
		Input1 => pc_add4,
		Input2 => pc_imm,
		Input3 => regfile_reg1,
		Output => pcreg_input
		);
	Add_PC: Add port map(
		Input1 => pcreg_output,
		Input2 => "0000000000000001",
		Output => pc_add4
		);
	InstructionMem_1: InstructionMem port map(
		clk => clk,
		rst => rst,
		Address => pcreg_output,
		Data => instmem_data,
		ramaddr => Ram1Addr,
		ramdata => Ram1Data,
		OE => Ram1OE,
		WE => Ram1WE,
		EN => Ram1EN
		);
		
	IF_ID_1: IF_ID port map(
		Instruction_in => instmem_data,
		Instruction_out => IFID_inst_out,
		PC_in => pcreg_output,
		PC_out => IFID_pc_out,
		clk => clk0, 
		rst => rst, 
		WriteIn => IFID_writein
		);
	Decoder_1: Decoder port map(
		Instruction => IFID_inst_out,
		Op => decoder_op,
		Reg1 => decoder_reg1,
		Reg2 => decoder_reg2,
		Reg3 => decoder_reg3,
		Imm => decoder_imm
		);
		
	Add_imm: Add port map(
		Input1 => decoder_imm,
		Input2 => pcreg_output,
		Output => pc_imm
		);
	Controller_1: Controller port map(
		Op => decoder_op,
		rst => controller_rst,
		ALUop => aluop,
		ALUsrc => alusrc,
		TType => ttype,
		TWrite => twrite,
		MemRead => memread,
		MemWrite => memwrite,
		MemToReg => memtoreg,
		RegWrite => regwrite
		);
	BranchSelector_1: BranchSelector port map(
		Op => decoder_op,
		RegInput => regfile_reg1,
		T => T_sign,
		Branch => branch
		);	
	RegFile_1: RegFile port map(
		ReadAddress1 => decoder_reg1,
		ReadAddress2 => decoder_reg2,
		WriteAddress => MEMWB_regwriteto,
		WriteData => regfile_writedata,
		Reg1 => regfile_reg1,
		Reg2 => regfile_reg2,
		RegWrite => MEMWB_regwrite,
		clk => clk0,
		rst => rst,
		sel => KEY16_INPUT,
		LED_output => LED_output,
		debug => fuck
		);
	RiskChecker_1: RiskChecker port map(
		PCWrite => pcwrite, 
		IFIDWrite => IFID_writein,
		ControlRst => controller_rst,
		IDEX_MemWrite => IDEX_memwrite,
		IDEX_W => IDEX_regwriteto,
		IFID_R1 => decoder_reg1,
		IFID_R2 => decoder_reg2
		);
	
	ID_EX_1: ID_EX port map(
		clk => clk0,
		rst => rst,
		WriteIn => '1',
		ALUopInput => aluop,
		ALUsrcInput => alusrc,
		TTypeInput => ttype,
		TWriteInput => twrite,
		MemReadInput => memread,
		MemWriteInput => memwrite,
		MemtoRegInput => memtoreg,
		RegWriteInput => regwrite,
		RegWriteOutput => IDEX_regwrite,
		ALUopOutput => IDEX_aluop,
		ALUsrcOutput => IDEX_alusrc,
		TTypeOutput => IDEX_ttype,
		TWriteOutput => IDEX_twrite,
		MemReadOutput => IDEX_memread,
		MemWriteOutput => IDEX_memwrite,
		MemtoRegOutput => IDEX_memtoreg,
		DataInput1 => regfile_reg1,
		DataInput2 => regfile_reg2,
		ImmediateInput => decoder_imm,
		ALUdata1 => IDEX_aludata1,
		ALUdata2 => IDEX_aludata2,
		RegResult => IDEX_regresult,
		RegReadInput1 => decoder_reg1,
		RegReadInput2 => decoder_reg2,
		RegWriteToInput => decoder_reg3,
		RegReadOutput1 => IDEX_regread1,
		RegReadOutput2 => IDEX_regread2,
		RegWriteToOutput => IDEX_regwriteto
		);
	
	ALU_1: ALU port map(
		Input1 => alu_input1, 
		Input2 => alu_input2,
		Output => alu_output,
		ALUOp => IDEX_aluop
		);
	TReg_1: TReg port map(
		Input => alu_output,
		TType => IDEX_ttype,
		TWrite => IDEX_twrite,
		T => T_sign
		);
	Mux_alusrc1: Mux port map(
		choice => forwardA,
		Input1 => IDEX_aludata1,
		Input2 => regfile_writedata,
		Input3 => EXMEM_data,
		Output => alu_input1
		);
	Mux_alusrc2: Mux port map(
		choice => forwardB,
		Input1 => IDEX_aludata2,
		Input2 => regfile_writedata,
		Input3 => EXMEM_data,
		Output => alu_input2
		);
	Passer_1: Passer port map(
		EXMEM_RegWrite => EXMEM_regwrite,
		MEMWB_RegWrite => MEMWB_regwrite,
		EXMEM_W => EXMEM_regwriteto,
		MEMWB_W => MEMWB_regwriteto,
		IDEX_R1 => IDEX_regread1,
		IDEX_R2 => IDEX_regread2,
		ForwardA => forwardA,
		ForwardB => forwardB
		);
	
	EX_MEM_1: EX_MEM port map(
		clk => clk0,
		rst => rst,
		WriteIn => '1',
		MemReadInput => IDEX_memread,
		MemWriteInput => IDEX_memwrite,
		MemtoRegInput => IDEX_memtoreg,
		MemReadOutput => EXMEM_memread,
		MemWriteOutput => EXMEM_memwrite,
		MemtoRegOutput => EXMEM_memtoreg,
		RegWriteInput => IDEX_regwrite,
		RegWriteOutput => EXMEM_regwrite,
		DataInput => alu_output,
		DataOutput => EXMEM_data,
		RegResultInput => IDEX_regresult,
		RegResultOutput => EXMEM_regresult,
		RegReadInput1 => IDEX_regread1,
		RegReadInput2 => IDEX_regread2,
		RegWriteToInput => IDEX_regwriteto,
		RegReadOutput1 => EXMEM_regread1,
		RegReadOutput2 => EXMEM_regread2,
		RegWriteToOutput => EXMEM_regwriteto
		);
	
	DataMem_1: DataMem port map(
		Address => EXMEM_data,
		Input => EXMEM_regresult,
		Output => DataMem_output,
		MemWrite => EXMEM_memwrite,
		MemRead => EXMEM_memread
		);
	
	MEM_WB_1: MEM_WB port map(
		clk => clk0,
		rst => rst,
		WriteIn => '1',
		RegWriteInput => EXMEM_regwrite,
		RegWriteOutput => MEMWB_regwrite,
		MemtoRegInput => EXMEM_memtoreg,
		MemtoRegOutput => MEMWB_memtoreg,
		AluResultInput => EXMEM_data,
		AluResultOutput => MEMWB_aluresult,
		MemResultInput => DataMem_output,
		MemResultOutput => MEMWB_memresult,
		RegReadInput1 => EXMEM_regread1,
		RegReadInput2 => EXMEM_regread2,
		RegWriteToInput => EXMEM_regwriteto,
		RegReadOutput1 => MEMWB_regread1,
		RegReadOutput2 => MEMWB_regread2,
		RegWriteToOutput => MEMWB_regwriteto
		);
	
	Mux_wb: Mux2 port map(
		choice => MEMWB_memtoreg,
		Input1 => MEMWB_aluresult,
		Input2 => MEMWB_memresult,
		Output => regfile_writedata
		);
	divClk_1: divClk port map(
		rst => rst,
		clk => clk,
		clk0 => clk0
		);
	LED_left: LED_seg7 port map(
		input => pcreg_output(3 downto 0),
		output => ledseg2
		);
	LED_right: LED_seg7 port map(
		input => alu_output(3 downto 0),
		output => ledseg1
		);
	fuck <= alu_input1(3 downto 0) & alu_input2(3 downto 0) & alu_output(3 downto 0) & decoder_imm(3 downto 0);
end Behavioral;

