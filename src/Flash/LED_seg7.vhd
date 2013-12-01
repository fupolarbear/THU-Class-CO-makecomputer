----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    23:05:31 11/30/2013 
-- Design Name: 
-- Module Name:    LED_seg7 - Behavioral 
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

entity LED_seg7 is
	Port(
		input : in  STD_LOGIC_VECTOR (3 downto 0);
		output : out  STD_LOGIC_VECTOR (6 downto 0)
	);
end LED_seg7;

architecture Behavioral of LED_seg7 is
	signal flip : std_logic_vector(6 downto 0);
begin

with input select
	flip <=	
		"0111111" when "0000",		--0
		"0000110" when "0001",		--1
		"1011011" when "0010",		--2
		"1001111" when "0011",		--
		"1100110" when "0100",		--4
		"1101101" when "0101",		--5
		"1111100" when "0110",		--6
		"0000111" when "0111",		--7
		"1111111" when "1000",		--8
		"1100111" when "1001",		--9
		"1110111" when "1010",		--A
		"1111100" when "1011",		--b
		"0111001" when "1100",		--C
		"1011110" when "1101",		--d
		"1111001" when "1110",		--E
		"1110001" when "1111",		--F
		"1010101" when others;		--strange char to show strange condition

Output <= flip;

end Behavioral;

