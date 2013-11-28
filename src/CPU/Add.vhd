----------------------------------------------------------------------------------
-- Company: 
-- Engineer: tuk
-- 
-- Create Date:    19:04:59 11/21/2013 
-- Design Name: 
-- Module Name:    Add - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add is
	Port(
		Input1 : in  Int16;
		Input2 : in  Int16;
		Output : out Int16
	);
end Add;

architecture Behavioral of Add is

begin
	Output <= Input1 + Input2;
end Behavioral;

