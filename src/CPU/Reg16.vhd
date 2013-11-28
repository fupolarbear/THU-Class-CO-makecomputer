----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    18:01:00 11/28/2013 
-- Design Name: 
-- Module Name:    Reg16 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg16 is
	port(
		input: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(15 downto 0);
		wrn: in std_logic;
		clock: in std_logic
	);
end Reg16;

architecture Behavioral of Reg16 is
	signal mem : std_logic_vector(15 downto 0);
begin
	output <= mem;
	
	process(wrn, clock)
	begin
		-- at droping edge of clock 
		-- and when chosen(wrn) then change mem
		if clock'event and clock = '0' then
			if wrn = '1' then
				mem <= input;
			end if;
		end if;
	end process;

end Behavioral;

