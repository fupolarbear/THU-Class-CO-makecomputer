----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:34 11/21/2013 
-- Design Name: 
-- Module Name:    PCReg - Behavioral 
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
use Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCReg is
	Port ( 
		Input : in  Int16;
		Output : out  Int16;
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		PCWrite : in  STD_LOGIC
	);
end PCReg;

architecture Behavioral of PCReg is

begin
	process(CLK, RST)
	begin
		if (rst = '0') then 
			Output <= Int16_Zero;
		elsif (clk'event and clk = '1') then
			if (PCwrite = '1') then
				Output <= Input;
			end if;
		end if;
	end process;
end Behavioral;

