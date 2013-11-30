----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    23:53:21 11/30/2013 
-- Design Name: 
-- Module Name:    LED_top - Behavioral 
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

entity LED_top is
	port(
		input16: in std_logic_vector(15 downto 0);
		clock: in std_logic;
		
	);
end LED_top;

architecture Behavioral of LED_top is
	component LED16
		Port(
			LED_output : out std_logic_vector(15 downto 0);
			input : in std_logic_vector(15 downto 0)
		);
	end component;
	component LED_seg7
		Port(
			input : in  STD_LOGIC_VECTOR (3 downto 0);
			output : out  STD_LOGIC_VECTOR (6 downto 0)
		);
	end component;
begin

	

end Behavioral;

