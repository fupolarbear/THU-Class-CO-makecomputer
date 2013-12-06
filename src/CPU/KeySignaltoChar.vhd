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
		char: out std_logic_vector(7 downto 0)
	);
END KeySignaltoChar ;


ARCHITECTURE behave OF KeySignaltoChar IS
begin
process(key)
begin
	case key is
		when "01000101"=>
			char <= "00010000"; -- 0
		when "00010110"=>
			char <= "00010001"; -- 1
		when "00011110"=>
			char <= "00010010"; -- 2
		when "00100110"=>
			char <= "00010011"; -- 3
		when "00100101"=>
			char <= "00010100"; -- 4
		when "00101110"=>
			char <=	"00010101"; -- 5
		when "00110110"=>
			char <= "00010110"; -- 6
		when "00111101"=>
			char <= "00010111"; -- 7
		when "00111110"=>
			char <= "00011000"; -- 8
		when "01000110"=>
			char <=	"00011001"; -- 9
		when "00011100"=>
			char <= "00100001"; -- A
		when "00110010"=>
			char <= "00100010"; -- B
		when "00100001"=>
			char <= "00100011"; -- C
		when "00100011"=>
			char <=	"00100100"; -- D
		when "00100100"=>
			char <= "00100101"; -- E
		when "00101011"=>
			char <= "00100110"; -- F
		when "00110100"=>
			char <= "00100111"; -- G
		when "00110011"=>
			char <=	"00101000"; -- H
		when "01000011"=>
			char <= "00101001"; -- I
		when "00111011"=>
			char <= "00101010"; -- J
		when "01000010"=>
			char <= "00101011"; -- K
		when "01001011"=>
			char <=	"00101100"; -- L
		when "00110001"=>
			char <= "00101101"; -- M
		when "00111010"=>
			char <= "00101110"; -- N
		when "01000100"=>
			char <= "00101111"; -- O
		when "01001101"=>
			char <=	"00110000"; -- P
		when "00010101"=>
			char <= "00110001"; -- Q
		when "00101101"=>
			char <= "00110010"; -- R
		when "00011011"=>
			char <= "00110011"; -- S
		when "00101100"=>
			char <=	"00110100"; -- T
		when "00111100"=>
			char <= "00110101"; -- U
		when "00101010"=>
			char <= "00110110"; -- V
		when "00011101"=>
			char <= "00110111"; -- W
		when "00100010"=>
			char <=	"00111000"; -- X
		when "00110101"=>
			char <= "00111001"; -- Y
		when "00011010"=>
			char <= "00111010"; -- Z
		when "00101001"=>
			char <= "00000000"; -- space
		when "01000001"=>
			char <= "00001100"; -- ,
		when "01011010"=>
			char <= "11111100"; -- enter
		when "11110000"=>
			char <= "11110000"; -- F0
		when others =>
			char <= "11111111";
	end case;
end process;
end behave;
