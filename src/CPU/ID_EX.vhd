----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:13 11/21/2013 
-- Design Name: 
-- Module Name:    ID_EX - Behavioral 
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
use work.Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ID_EX is
	Port(
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		WriteIn : in  STD_LOGIC;
		ALUopInput : in  STD_LOGIC_VECTOR (2 downto 0);
		ALUsrcInput : in  STD_LOGIC;
		TTypeInput : in  STD_LOGIC;
		TWriteInput : in  STD_LOGIC;
		MemReadInput : in  STD_LOGIC;
		MemWriteInput : in  STD_LOGIC;
		MemtoRegInput : in  STD_LOGIC;
		RegWriteInput: in STD_LOGIC;
		RegWriteOutput: out STD_LOGIC;
		ALUopOutput : out  STD_LOGIC_VECTOR (2 downto 0);
		ALUsrcOutput : out  STD_LOGIC;
		TTypeOutput : out  STD_LOGIC;
		TWriteOutput : out  STD_LOGIC;
		MemReadOutput : out  STD_LOGIC;
		MemWriteOutput : out  STD_LOGIC;
		MemtoRegOutput : out  STD_LOGIC;
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
		RegWriteToOutput : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end ID_EX;

architecture Behavioral of ID_EX is

begin
	process (rst, clk)
	begin
		if (rst = '0') then 
			ALUopOutput <= Int3_Zero;
			RegWriteOutput <= '0';
			ALUsrcOutput <= '0';
			TTypeOutput <= '0';
			TWriteOutput <= '0';
			MemReadOutput <= '0';
			MemWriteOutput <= '0';
			MemtoRegOutput <= '0';
		elsif (clk'event and clk = '1') then
			if (WriteIn = '1') then
				ALUopOutput <= ALUopInput;
				RegWriteOutput <= RegWriteInput;
				ALUsrcOutput <= ALUsrcInput;
				TTypeOutput <= TTypeInput;
				TWriteOutput <= TWriteInput;
				MemReadOutput <= MemReadInput;
				MemWriteOutput <= MemWriteInput;
				MemtoRegOutput <= MemtoRegInput;
				ALUdata1 <= DataInput1;
				if  ALUsrcInput = '0' then
					ALUdata2 <= DataInput2;
				else
					ALUdata2 <= ImmediateInput;
				end if;
				RegReadOutput1 <= RegReadInput1;
				RegReadOutput2 <= RegReadInput2;
				RegWriteToOutput <= RegWriteToInput;
			end if;
		end if;
	end process;

end Behavioral;

