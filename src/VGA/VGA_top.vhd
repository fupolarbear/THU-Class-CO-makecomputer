----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    19:57:07 12/03/2013 
-- Design Name: 
-- Module Name:    VGA_top - Behavioral 
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

entity VGA_top is
	port(
		KEY16_INPUT: in std_logic_vector(15 downto 0);
		
		CLK_0: in std_logic; -- must 50M
		clk_out: out std_logic; -- used to sync
		reset: in std_logic;
		
		-- vga port
		R: out std_logic_vector(2 downto 0) := "000";
		G: out std_logic_vector(2 downto 0) := "000";
		B: out std_logic_vector(2 downto 0) := "000";
		Hs: out std_logic := '0';
		Vs: out std_logic := '0'
	);
end VGA_top;

architecture Behavioral of VGA_top is
	component VGA_play
		Port(
			-- common port
			CLK_0: in std_logic; -- must 50M
			clkout: out std_logic; -- used to sync
			reset: in std_logic;
			
			-- vga port
			R: out std_logic_vector(2 downto 0) := "000";
			G: out std_logic_vector(2 downto 0) := "000";
			B: out std_logic_vector(2 downto 0) := "000";
			Hs: out std_logic := '0';
			Vs: out std_logic := '0';
			
			-- fifo memory
			wctrl: in std_logic_vector(0 downto 0); -- 1 is write
			waddr: in std_logic_vector(10 downto 0);
			wdata : in std_logic_vector(7 downto 0)
		);
	end component;
	
	-- display memory control
	signal dwctrl: std_logic_vector(0 downto 0);
	signal dwaddr : std_logic_vector(10 downto 0);
	signal dwdata : std_logic_vector(7 downto 0);
	
	signal dclk : std_logic;

	
	type data is (
		d1,
		d2,
		d3,
		d4
	);
	type step is (
		s1,
		s2,
		s3,
		s4
	);
	
	signal datain : data := d1;
	signal datast : step := s1;
begin

	
	clk_out <= dclk;

vga : VGA_play port map(
	CLK_0 => CLK_0,
	clkout=> dclk,
	reset=> reset,

	-- vga port
	R=> R,
	G=> G,
	B=> B,
	Hs=> Hs,
	Vs=> Vs,

	-- fifo memory
	wctrl=> dwctrl,
	waddr=> dwaddr,
	wdata => dwdata

);

process(dclk)
begin
	if dclk'event and dclk = '1' then
		dwctrl(0) <= '1';
		case datain is
			when d1 =>
				case datast is
					when s1 =>
						dwaddr <= "0000000" & "0000";
						dwdata <= "0001" & input(15 downto 12);
						datast <= s2;
					when s2 =>
						dwaddr <= "0000000" & "0001";
						dwdata <= "0001" & input(11 downto 8);
						datast <= s3;
					when s3 =>
						dwaddr <= "0000000" & "0010";
						dwdata <= "0000000" & KEY16_INPUT(2);
						datast <= s4;
					when s4 =>
						dwaddr <= "0000000" & "0011";
						dwdata <= "0000000" & KEY16_INPUT(3);
						datast <= s1;
						datain <= d2;
				end case;
			
			when d2 =>
				case datast is
					when s1 =>
						dwaddr <= "0000000" & "0100";
						dwdata <= "0000000" & KEY16_INPUT(4);
						datast <= s2;
					when s2 =>
						dwaddr <= "0000000" & "0101";
						dwdata <= "0000000" & KEY16_INPUT(5);
						datast <= s3;
					when s3 =>
						dwaddr <= "0000000" & "0110";
						dwdata <= "0000000" & KEY16_INPUT(6);
						datast <= s4;
					when s4 =>
						dwaddr <= "0000000" & "0111";
						dwdata <= "0000000" & KEY16_INPUT(7);
						datast <= s1;
						datain <= d3;
				end case;
				
			when d3 =>
				case datast is
					when s1 =>
						dwaddr <= "0000000" & "1000";
						dwdata <= "0000000" & KEY16_INPUT(8);
						datast <= s2;
					when s2 =>
						dwaddr <= "0000000" & "1001";
						dwdata <= "0000000" & KEY16_INPUT(9);
						datast <= s3;
					when s3 =>
						dwaddr <= "0000000" & "1010";
						dwdata <= "0000000" & KEY16_INPUT(10);
						datast <= s4;
					when s4 =>
						dwaddr <= "0000000" & "1011";
						dwdata <= "0000000" & KEY16_INPUT(11);
						datast <= s1;
						datain <= d4;
				end case;
			
			when d4 =>
				case datast is
					when s1 =>
						dwaddr <= "0000000" & "1100";
						dwdata <= "0000000" & KEY16_INPUT(12);
						datast <= s2;
					when s2 =>
						dwaddr <= "0000000" & "1101";
						dwdata <= "0000000" & KEY16_INPUT(13);
						datast <= s3;
					when s3 =>
						dwaddr <= "0000000" & "1110";
						dwdata <= "0000000" & KEY16_INPUT(14);
						datast <= s4;
					when s4 =>
						dwaddr <= "0000000" & "1111";
						dwdata <= "0000000" & KEY16_INPUT(15);
						datast <= s1;
						datain <= d1;
				end case;
		end case;
	end if;
end process;

end Behavioral;

