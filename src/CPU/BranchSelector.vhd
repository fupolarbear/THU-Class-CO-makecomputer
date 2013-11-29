----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:24 11/24/2013 
-- Design Name: 
-- Module Name:    BranchSelector - Behavioral 
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

entity BranchSelector is
	Port(
		Op : in  STD_LOGIC_VECTOR (4 downto 0);
		RegInput : in  STD_LOGIC_VECTOR (15 downto 0);
		T : in  STD_LOGIC;
		Branch : out  STD_LOGIC_VECTOR (1 downto 0)
	);
end BranchSelector;

architecture Behavioral of BranchSelector is

begin
	process(Op, RegInput, T)
	begin 
		Branch <= "00";
		case Op is
			when "11000" => -- B
				Branch <= "01";
			when "11001" => -- BTEQZ
				if T = '0' then 
					Branch <= "01";
				end if;
			when "11010" => -- BEQZ
				if RegInput = Int16_zero then 
					Branch <= "01";
				end if;
			when "11011" => --BNEZ
				if RegInput /= Int16_zero then 
					Branch <= "01";
				end if;
			when "11101" => --JR
				Branch <= "10";
			when "11100" => --JRRA*
				Branch <= "10";
			when others => null;
		end case;
	end process;
end Behavioral;

