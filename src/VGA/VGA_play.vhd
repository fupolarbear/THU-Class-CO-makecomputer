----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:10 11/26/2013 
-- Design Name: 
-- Module Name:    VGA-play - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_play is
	Port(
		CLK_0: in std_logic;
		reset: in std_logic;
		R: out std_logic_vector(2 downto 0) := "000";
		G: out std_logic_vector(2 downto 0) := "000";
		B: out std_logic_vector(2 downto 0) := "000";
		Hs: out std_logic := '0';
		Vs: out std_logic := '0'		
	);
end VGA_play;

architecture Behavioral of VGA_play is
	signal clk: std_logic;
	signal vector_x : std_logic_vector(9 downto 0);		--X
	signal vector_y : std_logic_vector(8 downto 0);		--Y
	signal r0 : std_logic_vector(2 downto 0);
	signal g0 : std_logic_vector(2 downto 0);
	signal b0 : std_logic_vector(2 downto 0);
	signal hs1 : std_logic;
	signal vs1 : std_logic;
begin


-- 50 MHz -> 25 MHz
process(CLK_0)
begin
	if(CLK_0'event and CLK_0 = '1') then
		clk <= not clk;
	end if;
end process;

process(clk, reset)	-- 行区间像素数 (800)
begin
	if reset = '0' then
		vector_x <= (others => '0');
	elsif clk'event and clk = '1' then
		if vector_x = 799 then
			vector_x <= (others => '0');
		else
			vector_x <= vector_x + 1;
		end if;
	end if;
end process;

process(clk, reset)	-- 场区间行数 (525)
begin
	if reset = '0' then
		vector_y <= (others => '0');
	elsif clk'event and clk = '1' then
		if vector_x = 799 then
			if vector_y = 524 then
				vector_y <= (others => '0');
			else
				vector_y <= vector_y + 1;
			end if;
		end if;
	end if;
end process;

process(clk, reset) -- 行同步信号（640+消隐区：16空+96低+48空）
begin
	if reset='0' then
		hs1 <= '1';
	elsif clk'event and clk='1' then
		if vector_x >= 656 and vector_x < 752 then
			hs1 <= '0';
		else
			hs1 <= '1';
		end if;
	end if;
end process;

process(clk, reset) -- 场同步信号（480+消隐区：10空+2低+33空）
begin
	if reset = '0' then
		vs1 <= '1';
	elsif clk'event and clk = '1' then
		if vector_y >= 490 and vector_y < 492 then
			vs1 <= '0';
		else
			vs1 <= '1';
		end if;
	end if;
end process;

process(clk, reset)
begin
	if reset = '0' then
		hs <= '0';
		vs <= '0';
	elsif clk'event and clk = '1' then
		hs <= hs1;
		vs <= vs1;
	end if;
end process;

process(reset, clk, vector_x, vector_y) -- X, Y 坐标控制
begin
	if reset = '0' then
		r0 <= "000";
		g0 <= "000";
		b0 <= "000";
	elsif clk'event and clk = '1' then
		if vector_x > 639 or vector_y > 479 then
			r0 <= "000";
			g0 <= "000";
			b0 <= "000";
		else		
			-- play around		
			if vector_x < 320 and vector_y < 240 then
				r0 <= "111";
				g0 <= "000";
				b0 <= "000";
			elsif vector_x >= 320 and vector_y < 240 then
				r0 <= "111";
				g0 <= "111";
				b0 <= "000";
			elsif vector_x < 320 and vector_y >= 240 then
				r0 <= "111";
				g0 <= "000";
				b0 <= "111";
			elsif vector_x >= 320 and vector_y >= 240 then
				r0 <= "000";
				g0 <= "111";
				b0 <= "111";
			end if;
		end if;
	end if;
end process;

process(hs1, vs1, r0, g0, b0) -- 最低的色彩输出
begin
	if hs1 = '1' and vs1 = '1' then
		R <= r0;
		G <= g0;
		B <= b0;
	else
		R <= (others => '0');
		G <= (others => '0');
		B <= (others => '0');
	end if;
end process;

end Behavioral;

