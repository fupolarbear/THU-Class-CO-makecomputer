----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    10:08:05 12/01/2013 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
	port(
		-- 字模式下为22-1，字节模式为22-0
		flash_addr: in std_logic_vector(22 downto 1);
		datain: in std_logic_vector(15 downto 0);
		dataout: out std_logic_vector(15 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		
		flash_byte : out std_logic;
		flash_vpen : out std_logic;
		flash_ce : out std_logic;
		flash_oe : out std_logic;
		flash_we : out std_logic;
		flash_rp : out std_logic;
		flash_addr : out std_logic_vector(22 downto 1);
		flash_data : inout std_logic_vector(15 downto 0);
		
		ctl_read : in  std_logic;
		ctl_write : in  std_logic;
		ctl_erase : in std_logic
	);
end top;

architecture Behavioral of top is

begin


end Behavioral;

