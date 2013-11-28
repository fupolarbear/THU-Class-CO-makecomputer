----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    00:12:35 11/25/2013 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
    Port(
		choice : in  STD_LOGIC;
		Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
		Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
		Output : out  STD_LOGIC_VECTOR (15 downto 0)
	);
end Mux2;

architecture Behavioral of Mux2 is

begin

with choice select
Output <=
	Input1 when '0',
	Input2 when '1',
	"0000000000000000" when others;

end Behavioral;

