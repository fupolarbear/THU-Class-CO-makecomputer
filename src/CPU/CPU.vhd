----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
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
           Output : in  Int16);
end component;
component Add is
    Port ( Input1 : in  Int16;
           Input2 : in  Int16;
           Output : out Int16);
end component;
component InstructionMem is
    Port ( Address : in  Int16;
           Data : out  Int16);
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
           rst : in  STD_LOGIC);
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


signal pcreg_input: Int16:= Int16_Zero;
signal pcreg_output: Int16:= Int16_Zero;

signal pc_add4: Int16:= Int16_Zero;
signal pc_imm: Int16:= Int16_Zero;
signal pc_reg: Int16:= Int16_Zero;

signal instmem_data: Int16:= Int16_Zero;

signal IFID_inst_out: Int16:= Int16_Zero;
signal IFID_pc_out: Int16:= Int16_Zero;
signal IFID_writein: std_logic:= '0';

signal decoder_op: Int5 := Int5_Zero;
signal decoder_reg1: Int4 := Int4_One;
signal decoder_reg2: Int4 := Int4_One;
signal decoder_reg3: Int4 := Int4_One;
signal decoder_imm: Int16 := Int16_Zero;

signal controller_rst: std_logic := '0';

signal regfile_reg1: Int16:= Int16_Zero;
signal regfile_reg2: Int16:= Int16_Zero;
signal regfile_writedata: Int16:= Int16_Zero;

signal IDEX_memwrite: std_logic:= '0';
signal IDEX_regwriteoutput: Int4 := Int4_One;
-- EXE
signal T: std_logic:= '0';

-- control signal
signal pcwrite: std_logic:= '1';
signal branch: std_logic_vector(1 downto 0):= "00";
signal aluop: Int3:= Int3_Zero;
signal ttype: std_logic:= '0';
signal twrite: std_logic:= '0';
signal memread: std_logic:= '0';
signal memwrite: std_logic:= '0';
signal memtoreg: std_logic:= '0';
signal regwrite: std_logic:= '0';

begin
	PCReg_1: PCReg port map(
		Input => pcreg_input,
		Output => pcreg_output,
		clk => clk,
		rst => rst,
		PCWrite => pcwrite
		);
	Mux_PC: Mux port map(
		choice => branch,
		Input1 => pc_add4,
		Input2 => pc_imm,
		Input3 => pc_reg,
		Output => pcreg_input
		);
	Add_PC: Add port map(
		Input1 => pcreg_output,
		Input2 => "0000000000000100",
		Output => pc_add4
		);
	InstructionMem_1: InstructionMem port map(
		Address => pcreg_output,
		Data => instmem_data
		);
		
	IF_ID_1: IF_ID port map(
		Instruction_in => instmem_data,
		Instruction_out => IFID_inst_out,
		PC_in => pcreg_output,
		PC_out => IFID_pc_out,
		clk => clk, 
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
		Input1 => sll_2(decoder_imm),
		Input2 => pcreg_output,
		Output => pc_imm
		);
	Controller_1: Controller port map(
		Op => decoder_op,
		rst => controller_rst,
		ALUop => aluop,
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
		T => T,
		Branch => branch
		);
	RegFile_1: RegFile port map(
		ReadAddress1 => decoder_reg1,
		ReadAddress2 => decoder_reg2,
		WriteAddress => decoder_reg3,
		WriteData => regfile_writedata,
		Reg1 => regfile_reg1,
		Reg2 => regfile_reg2,
		RegWrite => regwrite,
		clk => clk,
		rst => rst
		);
	RiskChecker_1: RiskChecker port map(
		PCWrite => pcwrite, 
		IFIDWrite => IFID_writein,
		ControlRst => controller_rst,
		IDEX_MemWrite => IDEX_memwrite,
		IDEX_W => IDEX_regwriteoutput,
		IFID_R1 => decoder_reg1,
		IFID_R2 => decoder_reg2
		);
end Behavioral;

