----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:46 11/21/2013 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
	Port ( 
		Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
		Op : out  STD_LOGIC_VECTOR (4 downto 0);
		Reg1 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg2 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg3 : out  STD_LOGIC_VECTOR (3 downto 0);
		Imm : out  STD_LOGIC_VECTOR (15 downto 0)
	);
end Decoder;

architecture Behavioral of Decoder is
begin
	process(Instruction)
	begin
		op <= Instruction(15 downto 11);
		Reg1 <= Zero_Reg;
		Reg2 <= Zero_Reg;
		Reg3 <= Zero_Reg;
		Imm <= Int16_Zero;
		case Instruction(15 downto 11) is
			when "00000" | "11100" => null; --NOP, JRRA
			when "00001" | "00010" | "00011" | "00100" => 
				Reg1 <= '0' & Instruction(10 downto 8);
			when "00101" | "00110" | "00111" | "01000" | "01001" =>
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
			when "01010" | "01011" =>
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Imm <= extend("0000000000000" & Instruction(4 downto 2), "0011", '1');
			when "01100" | "01101" => 
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Reg3 <= '0' & Instruction(4 downto 2);
			when "01110" =>
				Imm <= extend(Int8_zero & Instruction(10 downto 3), "1000", '1');
			when "01111" | "10000" | "10001" | "10010" | "10011" =>
				Reg1 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "10100" =>
				Reg1 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '0');
			when "10101" => --ADDIU3
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Imm <= extend("000000000000" & Instruction(3 downto 0), "0100", '1');
			when "10110" | "10111" =>
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Imm <= extend("00000000000" & Instruction(4 downto 0), "0101", '1');
			when "11000" => 
				Imm <= extend(Int5_Zero & Instruction(10 downto 0), "1011", '1');
			when "11001" => 
				Imm <= extend(Int8_Zero & Instruction(10 downto 3), "1000", '1');
			when "11010" | "11011"=> 
				Reg1 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "11101" => 
				Reg1 <= '0' & Instruction(10 downto 8);
			when others => null;
		end case;
	end process;
end Behavioral;

