----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:34 11/21/2013 
-- Design Name: 
-- Module Name:    InstructionMem - Behavioral 
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

entity InstructionMem is
	Port(
		clk : in std_logic;
		rst : in std_logic;
		Address : in  Int16;
		Data : out  Int16;
		ramdata : INOUT std_logic_vector(15 downto 0);      
		ramaddr : OUT std_logic_vector(17 downto 0);
		OE : OUT std_logic;
		WE : OUT std_logic;
		EN : OUT std_logic
	);
end InstructionMem;

architecture Behavioral of InstructionMem is
signal flag: std_logic:= '0';
begin
	process(rst, clk)
	begin
	if rst = '0' then
		flag <= '0';
		ramdata <= Int16_Z;
		OE <= '1';
		WE <= '1';
		EN <= '1';
		Data <= Int16_Zero;
		ramaddr <= "00" & Int16_Zero;
	elsif falling_edge(clk) then
			case flag is
					when '0' =>
						EN <= '0';
						OE <= '0';
						WE <= '1';
						ramaddr <= "00" & Address;
						ramdata <= Int16_Z;
						flag <= '1';
					when '1' => 
						data <= ramdata;
						flag <= '0';
					when others => flag <= '0';
			end case;
	end if;
	end process;
end Behavioral;
