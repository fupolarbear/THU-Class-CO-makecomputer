----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:29 11/21/2013 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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

entity Controller is
	Port(
		Op : in  STD_LOGIC_VECTOR(4 downto 0);
		rst : in  STD_LOGIC;
		ALUop : out  STD_LOGIC_VECTOR(2 downto 0);
		TType : out  STD_LOGIC;
		TWrite : out  STD_LOGIC;
		MemRead : out  STD_LOGIC;
		MemWrite : out  STD_LOGIC;
		MemtoReg : out  STD_LOGIC;
		RegWrite: out STD_LOGIC
	);
end Controller;

architecture Behavioral of Controller is

begin

end Behavioral;

