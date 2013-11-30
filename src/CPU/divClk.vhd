----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:40 11/30/2013 
-- Design Name: 
-- Module Name:    divClk - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divClk is
	Port ( rst : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		clk0 : out  STD_LOGIC);
end divClk;

architecture Behavioral of divClk is
begin
	process(rst, clk)
	variable num : std_logic_vector(1 downto 0) := "00";
	variable temp :std_logic:= '0';
	begin
		clk0 <= temp;
		if rst = '0' then
			num := "00";
			clk0 <= '0';
		elsif (clk'event and clk = '1') then
			num := num+1;
			if num = "11" then 
				num := "00";
				temp := not temp;
			end if;
		end if;
	end process;
end Behavioral;
