----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:34 11/30/2013 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is
	Port ( clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		ramaddr : out  STD_LOGIC_VECTOR (15 downto 0);
		ramdata : inout  STD_LOGIC_VECTOR (15 downto 0);
		OE : out  STD_LOGIC;
		WE : out  STD_LOGIC;
		EN : out  STD_LOGIC;
		addr : in  STD_LOGIC_VECTOR (15 downto 0);
		data : in  STD_LOGIC_VECTOR (15 downto 0);
		dataout: out STD_LOGIC_VECTOR (15 downto 0);
		r: in std_logic); --为1即为读，否则为写 
end RAM;
architecture Behavioral of RAM is
signal flag: std_logic_vector(1 downto 0):= "00";
begin
	process(clk, rst)
	begin
		if rst = '0' then
			OE <= '1';
			WE <= '1';
			EN <= '1';
			flag <= "00";
			ramdata <= Int16_Zero;
		elsif (clk'event and clk = '1') then
			if r = '1' then
				case flag is
					when "00" =>
						EN <= '0';
						OE <= '1';
						WE <= '1';
						ramaddr <= addr;
						ramdata <= data;
						flag <= "01";
					when "01" => 
						WE <= '0';
						flag <= "10";
					when "10" =>
						WE <= '1';
						EN <= '1';
						flag <= "00";
					when others => 
						flag <= "00";
				end case;
			else
				case flag is
					when "00" =>
						EN <= '0';
						OE <= '0';
						WE <= '1';
						ramaddr <= addr;
						flag <= "01";
					when "01" => 
						dataout <= ramdata;
						flag <= "10";
					when "10" =>
						OE <= '1';
						EN <= '1';
						flag <= "00";
					when others => 
						flag <= "00";
				end case;
			end if;
		end if;
	end process;
end Behavioral;

