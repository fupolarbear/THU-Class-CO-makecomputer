----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:32 12/5/2013
-- Design Name: 
-- Module Name:    TContrl - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity KeyTop is
	port(
		datain,clkin,clk50,rst_in: in std_logic;
		dataready_out: out std_logic;
		datareceived: in std_logic;
		out_char: out std_logic_vector(7 downto 0)
	);
end KeyTop;

architecture behave of KeyTop is
component Keyboard is
	port (
		-- PS2 clk and data
		datain, clkin: in std_logic ; 
		-- filter clock :5M
		fclk: in std_logic ;
		rst: in std_logic;
		--	fok : out std_logic ;  -- data output enable signal
		-- scan code signal output
		scancode : out std_logic_vector(7 downto 0) 
	) ;
end component;

component divEven is 
	port(clk: in std_logic; 
		 div: out std_logic);
end component;

component KeySignaltoChar is
	PORT
	(
		key: in std_logic_vector(7 downto 0);
		char: out std_logic_vector(7 downto 0)
	);
end component;

signal scancode : std_logic_vector(7 downto 0);
signal rst : std_logic;
signal fclk: std_logic;
signal st:	std_logic_vector(3 downto 0):="0000";
signal dataready : std_logic := '0';
signal char: std_logic_vector(7 downto 0);
signal chartmp: std_logic_vector(7 downto 0):="00000000";

begin

	rst <= not rst_in;
	
	u0: Keyboard port map(datain,clkin,fclk,rst,scancode);
	
	u2: KeySignaltoChar port map(scancode,char);
	
	u3: divEven port map(clk50,fclk);
	
	out_char<=chartmp;
	
	dataready_out <= dataready;

process(char,datareceived,clk50)
begin
	if clk50'event and clk50 = '1' then
		if char = "11110000" then -- scancode = F0
			st <= "0001";
		else 
			case st is
				when "0001" =>
					dataready <= '1';
					chartmp <= char;
					st <= "0000";
				when others =>
					st<="0000";
			end case;
		end if;
		if datareceived = '1' then 
			dataready <= '0';
		end if;
	end if;	
end process;
end behave;
