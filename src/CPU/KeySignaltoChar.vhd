----------------------------------------------------------------------------------
-- Company:
-- Engineer: Fu Zuoyou. ZLX
--
-- Create Date:    15:22:18 11/06/2012
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
Library IEEE;
Use IEEE.Std_logic_1164.all;
USe IEEE.Std_logic_unsigned.all;
use IEEE.Std_logic_arith.all;

ENTITY KeySignaltoChar IS
	PORT
	(
		key: in std_logic_vector(7 downto 0);
		rank: out std_logic_vector(7 downto 0)
	);
END KeySignaltoChar ;


ARCHITECTURE behave OF KeySignaltoChar IS
begin
process(key)
begin
	case key is
		when "01000101"=>
			rank <= "00010000"; -- 0
		when "00010110"=>
			rank <= "00010001"; -- 1
		when "00011110"=>
			rank <= "00010010"; -- 2
		when "00100110"=>
			rank <= "00010011"; -- 3
		when "00100101"=>
			rank <= "00010100"; -- 4
		when "00101110"=>
			rank <=	"000101"; -- 5
		when "00110110"=>
			rank <= "00010110"; -- 6
		when "00111101"=>
			rank <= "00010111"; -- 7
		when "00111110"=>
			rank <= "00011000"; -- 8
		when "01000110"=>
			rank <=	"00011001"; -- 9
		when "00011100"=>
			rank <= "00100001"; -- A
		when "00110010"=>
			rank <= "00100010"; -- B
		when "00100001"=>
			rank <= "00100011"; -- C
		when "00100011"=>
			rank <=	"00100100"; -- D
		when "00100100"=>
			rank <= "00100101"; -- E
		when "00101011"=>
			rank <= "00100110"; -- F
		when "00110100"=>
			rank <= "00100111"; -- G
		when "00110011"=>
			rank <=	"00101000"; -- H
		when "01000011"=>
			rank <= "00101001"; -- I
		when "00111011"=>
			rank <= "00101010"; -- J
		when "01000010"=>
			rank <= "00101011"; -- K
		when "01001011"=>
			rank <=	"00101100"; -- L
		when "00110001"=>
			rank <= "00101101"; -- M
		when "00111010"=>
			rank <= "00101110"; -- N
		when "01000100"=>
			rank <= "00101111"; -- O
		when "01001101"=>
			rank <=	"00110000"; -- P
		when "00010101"=>
			rank <= "00110001"; -- Q
		when "00101101"=>
			rank <= "00110010"; -- R
		when "00011011"=>
			rank <= "00110011"; -- S
		when "00101100"=>
			rank <=	"00110100"; -- T
		when "00111100"=>
			rank <= "00110101"; -- U
		when "00101010"=>
			rank <= "00110110"; -- V
		when "00011101"=>
			rank <= "00110111"; -- W
		when "00100010"=>
			rank <=	"00111000"; -- X
		when "00110101"=>
			rank <= "00111001"; -- Y
		when "00011010"=>
			rank <= "00111010"; -- Z
		when "00101001"=>
			rank <= "00000000"; -- space
		when "01000001"=>
			rank <= "00001100"; -- ,
		when "01011010"=>
			rank <= "11111100"; -- enter
		when "11110000"=>
			rank <= "11110000"; -- F0
		when others =>
			rank <= "11111111";
	end case;
end process;
end behave;
