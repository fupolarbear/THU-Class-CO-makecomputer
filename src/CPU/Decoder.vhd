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
		Reg1 : out  STD_LOGIC_VECTOR (3 downto 0); --for read
		Reg2 : out  STD_LOGIC_VECTOR (3 downto 0); --for read
		Reg3 : out  STD_LOGIC_VECTOR (3 downto 0); --for write
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
			when "00000" => null; --NOP
			when "00001" => --MFIH
				Reg1 <= IH_reg;
				Reg3 <= '0' & Instruction(10 downto 8);
			when "00010" => --MFPC
				Reg1 <= PC_reg;
				Reg3 <= '0' & Instruction(10 downto 8);
			when "00011" => --MTIH
				Reg3 <= IH_reg;
				Reg1 <= '0' & Instruction(10 downto 8);
			when "00100" => --MTSP
				Reg3 <= SP_reg;
				Reg1 <= '0' & Instruction(10 downto 8);
			when "00101" | "00110" => --AND, OR
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Reg3 <= '0' & Instruction(10 downto 8);
			when "00111" => --NOT*
				Reg1 <= '0' & Instruction(7 downto 5);
				Reg3 <= '0' & Instruction(10 downto 8);
			when "01000" | "01001" => --SLT*, CMP
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
			when "01010" | "01011" => --SLL, SRA
				Reg3 <= '0' & Instruction(10 downto 8);
				Reg1 <= '0' & Instruction(7 downto 5);
				if Instruction(4 downto 2) /= "000" then 
					Imm <= extend("0000000000000" & Instruction(4 downto 2), "0011", '0');
				else 
					Imm <= Int16_eight;
				end if;
			when "01100" | "01101" => 
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Reg3 <= '0' & Instruction(4 downto 2);
			when "01110" => --ADDSP
				Reg1 <= SP_reg;
				Reg3 <= SP_reg;
				Imm <= extend(Int8_zero & Instruction(10 downto 3), "1000", '1');
			when "01111" | "10011" => -- LW_SP, ADDSP3*
				Reg3 <= '0' & Instruction(10 downto 8);
				Reg1 <= SP_reg;
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "10000" => --SW_SP
				Reg2 <= '0' & Instruction(10 downto 8);
				Reg1 <= SP_reg;
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "10001" => --ADDIU
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg3 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "10010" => --SLTI
				Reg1 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "10100" =>
				Reg3 <= '0' & Instruction(10 downto 8);
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '0');
			when "10101" => --ADDIU3
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg3 <= '0' & Instruction(7 downto 5);
				Imm <= extend("000000000000" & Instruction(3 downto 0), "0100", '1');
			when "10110" => --LW
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg3 <= '0' & Instruction(7 downto 5);
				Imm <= extend("00000000000" & Instruction(4 downto 0), "0101", '1');
			when "10111" => --SW
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= '0' & Instruction(7 downto 5);
				Imm <= extend("00000000000" & Instruction(4 downto 0), "0101", '1');
			when "11000" => --B
				Reg1 <= PC_reg;
				Reg3 <= PC_reg;
				Imm <= extend(Int5_Zero & Instruction(10 downto 0), "1011", '1');
			when "11001" => --BTEQZ
				Reg1 <= PC_reg;
				Reg3 <= PC_reg;
				Imm <= extend(Int8_Zero & Instruction(10 downto 3), "1000", '1');
			when "11010" | "11011"=> --BEQZ, BNEZ 
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg2 <= PC_reg;
				Reg3 <= PC_reg;
				Imm <= extend(Int8_zero & Instruction(7 downto 0), "1000", '1');
			when "11100" => --JRRA*
				Reg1 <= RA_reg;
				Reg3 <= PC_reg;
			when "11101" => --JR
				Reg1 <= '0' & Instruction(10 downto 8);
				Reg3 <= PC_reg;
			when others => null;
		end case;
	end process;
end Behavioral;

