----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    17:12:10 11/26/2013 
-- Design Name: 
-- Module Name:    VGA_play - Behavioral 
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
		CLK_0: in std_logic; -- must 50M
		reset: in std_logic;
		R: out std_logic_vector(2 downto 0) := "000";
		G: out std_logic_vector(2 downto 0) := "000";
		B: out std_logic_vector(2 downto 0) := "000";
		Hs: out std_logic := '0';
		Vs: out std_logic := '0';
		-- hclk: in std_logic; -- hand-clock, for debug
		wctrl: in std_logic_vector(0 downto 0);
		waddr: in std_logic_vector(10 downto 0);
		wdata : in std_logic_vector(7 downto 0)
	);
end VGA_play;

architecture Behavioral of VGA_play is
	signal clk: std_logic; -- div 50M to 25M
	signal vector_x : std_logic_vector(9 downto 0);		--X 10b 640
	signal vector_y : std_logic_vector(8 downto 0);		--Y 9b 480
	signal r0 : std_logic_vector(2 downto 0);
	signal g0 : std_logic_vector(2 downto 0);
	signal b0 : std_logic_vector(2 downto 0);
	signal hs1 : std_logic;
	signal vs1 : std_logic;
	
	component char_mem
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	end component;
	
	component fifo_mem
		PORT (
			-- a for write
			clka : IN STD_LOGIC;
			-- enable, 1 is write signal
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			-- b for read
			clkb : IN STD_LOGIC;
			addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
	signal char: std_logic_vector(7 downto 0) := "00000000";
	signal pr: STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal char_addr: std_logic_vector(14 downto 0);
	signal caddr: std_logic_vector(10 downto 0);
	
begin

	-- store char
	ram: char_mem port map(clka => clk, addra => char_addr, douta => pr);
	
	-- display cache
	cache: fifo_mem port map(
		-- a for write
		clka => clk,
		-- enable, 1 is write signal
		wea => wctrl,
		addra => waddr,
		dina => wdata,
		-- b for read
		clkb => clk,
		addrb => caddr,
		doutb => char
	);
	
	-- cache addr 5 + 6 = 11
	caddr <= vector_y(8 downto 4) & vector_x(9 downto 4);
	
	-- char acess addr 7 + 4 + 4 = 15
	-- last 2 control the display(x, y)
	-- first char control which char
	char_addr <=  char(6 downto 0) & vector_y(3 downto 0) & vector_x(3 downto 0);

-- -- this is only for debug
-- process(reset, hclk)
-- begin
	-- if reset = '0' then
		-- char <= (others => '0');
	-- elsif hclk'event and hclk = '1' then
		-- char <= char + 1;
	-- end if;
-- end process;

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
			-- play-ground		
			-- play-ground
			
			if pr(0) = '1' then
				r0 <= "111";
				g0 <= "000";
				b0 <= "000";
			else
				r0 <= "000";
				g0 <= "001";
				b0 <= "001";
			end if;
			
			-- play-ground
			-- play-ground
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

