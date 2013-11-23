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
use Common.all;
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
signal pcreg_input: Int16:= Int16_Zero;
signal pcreg_output: Int16:= Int16_Zero;

signal pc_add4: Int16:= Int16_Zero;
signal pc_imm: Int16:= Int16_Zero;
signal pc_reg: Int16:= Int16_Zero;

signal instmem_data: Int16:= Int16_Zero;

signal IFID_inst_out: Int16:= Int16_Zero;
signal IFID_pc_out: Int16:= Int16_Zero;
-- control signal
signal pcwrite: std_logic:= '1';
signal branch: std_logic_vector(1 downto 0):= "00";
signal writein: std_logic:= '1';

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
		WriteIn => writein
		);
end Behavioral;

