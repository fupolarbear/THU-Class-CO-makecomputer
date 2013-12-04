----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:11 11/21/2013 
-- Design Name: 
-- Module Name:    Passer - Behavioral 
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

entity Passer is
	Port(
		EXMEM_RegWrite : in  STD_LOGIC;
		MEMWB_RegWrite : in  STD_LOGIC;
		EXMEM_W : in  STD_LOGIC_VECTOR (3 downto 0);
		MEMWB_W : in  STD_LOGIC_VECTOR (3 downto 0);
		IDEX_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
		IDEX_R2 : in  STD_LOGIC_VECTOR (3 downto 0);
		ForwardA : out  STD_LOGIC_VECTOR (1 downto 0);
		ForwardB : out  STD_LOGIC_VECTOR (1 downto 0)
	);
end Passer;

architecture Behavioral of Passer is

begin
 -- TODO
	process(EXMEM_RegWrite, MEMWB_RegWrite, EXMEM_W, MEMWB_W, IDEX_R1, IDEX_R2)
	begin
	ForwardB <= "00";
	ForwardA <= "00";
	if (EXMEM_RegWrite = '1' and EXMEM_W /= Zero_Reg and EXMEM_W = IDEX_R1) then
		ForwardA <= "10";
	end if;
	if (EXMEM_RegWrite = '1' and EXMEM_W /= Zero_Reg and EXMEM_W = IDEX_R2) then
		ForwardB <= "10";
	end if;
	if (MEMWB_RegWrite = '1' and MEMWB_W /= Zero_Reg and EXMEM_W /= IDEX_R1 and MEMWB_W = IDEX_R1) then 
		ForwardA <= "01";
	end if;
	if (MEMWB_RegWrite = '1' and MEMWB_W /= Zero_Reg and EXMEM_W /= IDEX_R2 and MEMWB_W = IDEX_R2) then 
		ForwardA <= "01";
	end if;
	end process;
end Behavioral;

