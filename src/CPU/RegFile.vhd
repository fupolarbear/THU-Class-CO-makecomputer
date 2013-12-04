----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
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
use work.Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegFile is
    Port (
		ReadAddress1 : in  STD_LOGIC_VECTOR (3 downto 0);
		ReadAddress2 : in  STD_LOGIC_VECTOR (3 downto 0);
		WriteAddress : in  STD_LOGIC_VECTOR (3 downto 0);
		WriteData : in  STD_LOGIC_VECTOR (15 downto 0);
		Reg1 : out  STD_LOGIC_VECTOR (15 downto 0);
		Reg2 : out  STD_LOGIC_VECTOR (15 downto 0);
		RegWrite : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		sel: in std_logic_vector(3 downto 0);
		LED_output: out std_logic_vector(15 downto 0);
		debug: in std_logic_vector(15 downto 0);
		vga_reg1: out std_logic_vector(15 downto 0)
	);
end RegFile;

architecture Behavioral of RegFile is
	signal control : std_logic_vector (15 downto 0);
	signal opt0, opt1, opt2, opt3, opt4, opt5, opt6, opt7, opt8 : std_logic_vector (15 downto 0);
	signal opt9, opt10, opt11, opt12, opt13, opt14, opt15 : std_logic_vector (15 downto 0);
	component Reg16
		port(
			input: in std_logic_vector(15 downto 0);
			output: out std_logic_vector(15 downto 0);
			wrn: in std_logic;
			clock: in std_logic;
			reset: in std_logic
		);
	end component;
	
	signal debug_output: std_logic_vector(15 downto 0):= Int16_Zero;
	
component LED16 is
	Port(
		LED_output : out std_logic_vector(15 downto 0);
		input : in std_logic_vector(15 downto 0)
	);
end component;
begin

r0	: Reg16 port map(input => WriteData, output => opt0, wrn => control(0), clock => clk, reset => rst);
r1	: Reg16 port map(input => WriteData, output => opt1, wrn => control(1), clock => clk, reset => rst);
r2	: Reg16 port map(input => WriteData, output => opt2, wrn => control(2), clock => clk, reset => rst);
r3	: Reg16 port map(input => WriteData, output => opt3, wrn => control(3), clock => clk, reset => rst);
r4	: Reg16 port map(input => WriteData, output => opt4, wrn => control(4), clock => clk, reset => rst);
r5	: Reg16 port map(input => WriteData, output => opt5, wrn => control(5), clock => clk, reset => rst);
r6	: Reg16 port map(input => WriteData, output => opt6, wrn => control(6), clock => clk, reset => rst);
r7	: Reg16 port map(input => WriteData, output => opt7, wrn => control(7), clock => clk, reset => rst);
-- r8 Zero register
r9	: Reg16 port map(input => WriteData, output => opt9, wrn => control(9), clock => clk, reset => rst);
-- r10 PC register
r10	: Reg16 port map(input => WriteData, output => opt10, wrn => control(10), clock => clk, reset => rst);
-- r11 IH register (interrput ÖÐ¶Ï)
r11	: Reg16 port map(input => WriteData, output => opt11, wrn => control(11), clock => clk, reset => rst);
-- r12 RA register (return address)
r12	: Reg16 port map(input => WriteData, output => opt12, wrn => control(12), clock => clk, reset => rst);
-- r13 SP register (stack point)
r13	: Reg16 port map(input => WriteData, output => opt13, wrn => control(13), clock => clk, reset => rst);
r14	: Reg16 port map(input => WriteData, output => opt14, wrn => control(14), clock => clk, reset => rst);
r15 : Reg16 port map(input => WriteData, output => opt15, wrn => control(15), clock => clk, reset => rst);

-- because it's forever zero output (but can still write)
opt8 <= (others => '0');	--ZERO

with ReadAddress1 select
	Reg1<=  
		opt0	when "0000",
		opt1	when "0001",
		opt2	when "0010",
		opt3	when "0011",
		opt4	when "0100",
		opt5	when "0101",
		opt6	when "0110",
		opt7	when "0111",
		opt8	when "1000",
		opt9	when "1001",
		opt10	when "1010",
		opt11	when "1011",
		opt12	when "1100",
		opt13	when "1101",
		opt14	when "1110",
		opt15	when "1111",
		opt0	when others;

with ReadAddress2 select
	Reg2<=  
		opt0	when "0000",
		opt1	when "0001",
		opt2	when "0010",
		opt3	when "0011",
		opt4	when "0100",
		opt5	when "0101",
		opt6	when "0110",
		opt7	when "0111",
		opt8	when "1000",
		opt9	when "1001",
		opt10	when "1010",
		opt11	when "1011",
		opt12	when "1100",
		opt13	when "1101",
		opt14	when "1110",
		opt15	when "1111",
		opt0	when others;

with WriteAddress select control(0) <= (RegWrite) when "0000", '0' when others;
with WriteAddress select control(1) <= (RegWrite) when "0001", '0' when others;
with WriteAddress select control(2) <= (RegWrite) when "0010", '0' when others;
with WriteAddress select control(3) <= (RegWrite) when "0011", '0' when others;
with WriteAddress select control(4) <= (RegWrite) when "0100", '0' when others;
with WriteAddress select control(5) <= (RegWrite) when "0101", '0' when others;
with WriteAddress select control(6) <= (RegWrite) when "0110", '0' when others;
with WriteAddress select control(7) <= (RegWrite) when "0111", '0' when others;
with WriteAddress select control(8) <= (RegWrite) when "1000", '0' when others;
with WriteAddress select control(9) <= (RegWrite) when "1001", '0' when others;
with WriteAddress select control(10) <= (RegWrite) when "1010", '0' when others;
with WriteAddress select control(11) <= (RegWrite) when "1011", '0' when others;
with WriteAddress select control(12) <= (RegWrite) when "1100", '0' when others;
with WriteAddress select control(13) <= (RegWrite) when "1101", '0' when others;
with WriteAddress select control(14) <= (RegWrite) when "1110", '0' when others;
with WriteAddress select control(15) <= (RegWrite) when "1111", '0' when others;

LED16_test: LED16 port map(
	LED_output => LED_output,
	input => debug_output
	);
vga_reg1 <= opt1;
with sel select 
	debug_output <=opt0 when "0000",
						opt1	when "0001",
						opt2	when "0010",
						opt3	when "0011",
						opt4	when "0100",
						opt5	when "0101",
						opt6	when "0110",
						opt7	when "0111",
						opt8	when "1000",
						opt9	when "1001",
						opt10	when "1010",
						opt11	when "1011",
						opt12	when "1100",
						opt13	when "1101",
						opt14	when "1110",
						opt15	when "1111",
						opt0	when others;
end Behavioral;

