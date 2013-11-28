----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:19 11/21/2013 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    Port(
		choice : in  STD_LOGIC_VECTOR (1 downto 0);
		Input1 : in  Int16;
		Input2 : in  Int16;
		Input3 : in  Int16;
		Output : out  Int16
	);
end Mux;

architecture Behavioral of Mux is

begin

with choice select
Output <=
	Input1 when "00",
	Input2 when "01",
	Input3 when "10",
	Int16_Zero when others;

end Behavioral;

