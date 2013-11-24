----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:24 11/24/2013 
-- Design Name: 
-- Module Name:    BranchSelector - Behavioral 
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

entity BranchSelector is
    Port ( Op : in  STD_LOGIC_VECTOR (4 downto 0);
           RegInput : in  STD_LOGIC_VECTOR (15 downto 0);
           T : in  STD_LOGIC;
           Branch : out  STD_LOGIC_VECTOR (1 downto 0));
end BranchSelector;

architecture Behavioral of BranchSelector is

begin


end Behavioral;

