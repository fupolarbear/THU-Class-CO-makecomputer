----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:29 11/21/2013 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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

entity Controller is
	Port(
		Op : in  STD_LOGIC_VECTOR(4 downto 0);
		rst : in  STD_LOGIC;
		ALUop : out  STD_LOGIC_VECTOR(2 downto 0);
		ALUsrc : out STD_LOGIC;
		TType : out  STD_LOGIC;
		TWrite : out  STD_LOGIC;
		MemRead : out  STD_LOGIC;
		MemWrite : out  STD_LOGIC;
		MemtoReg : out  STD_LOGIC;
		RegWrite: out STD_LOGIC
	);
end Controller;

architecture Behavioral of Controller is

begin 
	process(Op, rst)
	begin
		if rst = '0' then
			ALUop <= "000";
			TType <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			MemtoReg <= '0';
			RegWrite <= '0';
		else
			case Op is 
				when "01000" | "01001" | "01101" | "10010" => 
					ALUop <= "001";
				when "00101" =>
					ALUop <= "010";
				when "00110" =>
					ALUop <= "011";
				when "00111" =>
					ALUop <= "100";
				when "01010" =>
					ALUop <= "101";
				when "01011" =>
					ALUop <= "110";
				when others =>
					ALUop <= "000";
			end case;
			if Op = "01010" or Op = "01011" or (Op >= "01110" and Op <= "10111") then
				ALUsrc <= '1';
			else 
				ALUsrc <= '0';
			end if;
			
			if Op = "01001" then 
				TType <= '1';
			else
				TType <= '0';
			end if;
			
			if Op =  "01000" or Op = "01001" or Op = "10010" then 
				TWrite <= '1';
			else
				TWrite <= '0';
			end if;
			
			if Op =  "01000" or Op = "10110" then 
				MemRead <= '1';
			else
				MemRead <= '0';
			end if;
			
			if Op =  "10000" or Op = "10111" then 
				MemWrite <= '1';
			else
				MemWrite <= '0';
			end if; 
			
			if Op =  "01000" or Op = "10110" then 
				MemtoReg <= '1';
			else
				MemtoReg <= '0';
			end if;
			
			if (Op >= "00001" and Op <= "00011") or (Op >= "00101" and Op <= "00111") or 
				(Op >= "01010" and Op <= "01111") or (Op = "10001") or 
				(Op >= "10011" and Op <= "10110") then
				RegWrite <= '1';
			else 
				RegWrite <= '0';
			end if;
		end if;
	end process;
end Behavioral;

