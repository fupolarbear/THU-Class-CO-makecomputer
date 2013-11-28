----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:46 11/21/2013 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
	Port ( 
		Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
		Op : out  STD_LOGIC_VECTOR (4 downto 0);
		Reg1 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg2 : out  STD_LOGIC_VECTOR (3 downto 0);
		Reg3 : out  STD_LOGIC_VECTOR (3 downto 0);
		Imm : out  STD_LOGIC_VECTOR (15 downto 0)
	);
end Decoder;

architecture Behavioral of Decoder is

begin


end Behavioral;

