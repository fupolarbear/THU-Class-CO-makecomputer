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
use Common.all;
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
	COMPONENT RAM
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		addr : IN std_logic_vector(15 downto 0);
		data : IN std_logic_vector(15 downto 0);
		r : IN std_logic;    
		ramdata : INOUT std_logic_vector(15 downto 0);      
		ramaddr : OUT std_logic_vector(17 downto 0);
		OE : OUT std_logic;
		WE : OUT std_logic;
		EN : OUT std_logic;
		dataout : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
begin
	Inst_RAM: RAM PORT MAP(
		clk => clk,
		rst => rst,
		ramaddr => ramaddr,
		ramdata => ramdata,
		OE => OE,
		WE => WE,
		EN => EN,
		addr => Address,
		data => Int16_Zero,
		dataout => Data,
		r => '1'
	);

end Behavioral;

