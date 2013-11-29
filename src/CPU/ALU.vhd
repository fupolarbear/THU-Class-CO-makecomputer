----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    19:15:30 11/21/2013 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	Port(
		Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
		Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
		Output : out  STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
		ALUop : in  STD_LOGIC_VECTOR (2 downto 0)
	);
end ALU;

architecture Behavioral of ALU is

begin

	process(ALUop, Input1, Input2)
	begin
		case ALUop is
			when "000" =>
				output <= input1 + input2;
			when "001" =>
				output <= input1 - input2;
			when "010" =>
				output <= input1 and input2;
			when "011" =>
				output <= input1 or input2;
			when "100" =>
				output <= not input1;
			when "101" =>
				output <= TO_STDLOGICVECTOR(TO_BITVECTOR(input1) sll CONV_INTEGER(input2));
			when "110" =>
				output <= TO_STDLOGICVECTOR(TO_BITVECTOR(input1) srl CONV_INTEGER(input2));
			when "111" =>
				output <= (others => '0');
		end case;
	end process;

end Behavioral;

