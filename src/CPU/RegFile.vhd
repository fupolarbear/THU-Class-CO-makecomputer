----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:13:23 11/21/2013 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
    Port ( ReadAddress1 : in  STD_LOGIC_VECTOR (3 downto 0);
           ReadAddress2 : in  STD_LOGIC_VECTOR (3 downto 0);
           WriteAddress : in  STD_LOGIC_VECTOR (3 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : out  STD_LOGIC_VECTOR (15 downto 0);
           RegWrite : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end RegFile;

architecture Behavioral of RegFile is

begin


end Behavioral;

