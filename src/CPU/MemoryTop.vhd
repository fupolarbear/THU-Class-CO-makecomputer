----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fu Zuoyou.
-- 
-- Create Date:    19:03:31 11/21/2013 
-- Design Name: 
-- Module Name:    MemoryTop - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.all;
use work.Common.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemoryTop is
    Port(
	-- cpu connect
		-- addr1 is instruction
		address1 : in  STD_LOGIC_VECTOR (15 downto 0);
		output1 : out  STD_LOGIC_VECTOR (15 downto 0);
		-- addr2 is common memory
		address2 : in  STD_LOGIC_VECTOR (15 downto 0);
		output2 : out  STD_LOGIC_VECTOR (15 downto 0);
		
	-- clocks
		-- 50MHz in 
		clock : in STD_LOGIC;
		-- 12.5MHz standard CPU clock out
		cpuclock : out STD_LOGIC;

	-- only for address 2
		dataInput : in  STD_LOGIC_VECTOR (15 downto 0); --only for address2
		MemWrite : in STD_LOGIC;
		MemRead : in STD_LOGIC;

	-- connection with memory
		memoryAddress : out STD_LOGIC_VECTOR (17 downto 0);
		extendDatabus : inout STD_LOGIC_VECTOR(15 downto 0);
		memoryEN : out STD_LOGIC;
		memoryOE : out STD_LOGIC;
		memoryRW : out STD_LOGIC;
	
	-- line with flash
		flash_byte : out std_logic;
		flash_vpen : out std_logic;
		flash_ce : out std_logic;
		flash_oe : out std_logic;
		flash_we : out std_logic;
		flash_rp : out std_logic;
		flash_addr : out std_logic_vector(22 downto 1);
		flash_data : inout std_logic_vector(15 downto 0);
		
	-- connection with serial port
		serial_wrn : out STD_LOGIC;
		serial_rdn : out STD_LOGIC;
		serial_dataready : in STD_LOGIC;
		serial_tsre : in STD_LOGIC;
		serial_tbre : in STD_LOGIC;
		-- basi cdatabus: ram1, serial port
		basicdatabus : inout STD_LOGIC_VECTOR(7 downto 0);
		-- to make ram1 disable not disturb databus (set to 1)
		ram1_en : out STD_LOGIC;
		reset : in STD_LOGIC
	);
end MemoryTop;

architecture Behavioral of MemoryTop is
-------------------------------------
-- CM
	-- condition machine
	type state_type is (
		-- boot CM
		BOOT, BOOT_FLASH, BOOT_RAM1, BOOT_RAM2, BOOT_READY,
		-- work cpu CM
		READ1, IDEL1, RW1, IDEL2
	);
	signal state : state_type := Read1;
	
-------------------------------------
-- flash
	-- flash port
	component FlashIO
		port(
			-- 字模式下为22-1，字节模式为22-0
			addr: in std_logic_vector(22 downto 1);
			datain: in std_logic_vector(15 downto 0);
			dataout: out std_logic_vector(15 downto 0);
			
			clk: in std_logic;
			reset: in std_logic;
			
			-- hard port
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
	end component;
	
	signal ctl_read, ctl_write, ctl_erase : std_logic;
	signal flash_addr_input : std_logic_vector(22 downto 1);
	signal flash_data_input : std_logic_vector(15 downto 0);
	signal flash_data_output : std_logic_vector(15 downto 0);
	-- use for sleep to wait for data actually
	signal flash_addr_count: std_logic_vector(7 downto 0);
	signal flashpc : std_logic_vector(15 downto 0) := x"FFFF";
	signal flash_hold_data : STD_LOGIC_VECTOR(15 downto 0);

-------------------------------------
-- Memory Control
	-- store output1
	signal buffer1:  STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
	-- store output2
	signal buffer2:  STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
	signal bus_flag : STD_LOGIC;
	signal BF01 : STD_LOGIC_VECTOR (15 downto 0);
	signal BF03 : STD_LOGIC_VECTOR (15 downto 0);
	signal readin, holder, addressTemp : STD_LOGIC_VECTOR (15 downto 0);

-------------------------------------
-- Serial port
	signal serial_flag : STD_LOGIC;
	signal serialHolder : STD_LOGIC_VECTOR (7 downto 0);
	
begin

-------------------------------------
-- memory control

	output1 <= buffer1;
	output2 <= buffer2;
	
	memoryEN <= '0';
	memoryRW <= 
		'1' when (address2 = x"BF00" and state = RW1) 
		else NOT MemWrite when state = RW1
		else '0' when (state=BOOT_RAM2)
		else '1';
	
	extendDatabus <= holder when bus_flag = '0' else "ZZZZZZZZZZZZZZZZ";
	basicDatabus <= serialHolder when serial_flag = '0' else "ZZZZZZZZ";
	
	memoryAddress <= "00" & addressTemp;
	with state select
		addressTemp <= 
			address2 when IDEL2 | RW1,
			address1 when IDEL1 | READ1,
			FLASHPC when BOOT_FLASH | BOOT_RAM1 | BOOT_RAM2,
			"0000000000000000" when others;
	
	with state select
		memoryOE <= 
			NOT MemRead when RW1,
			'1' when BOOT_FLASH | BOOT_RAM1 | BOOT_RAM2,
			'0' when others;

	with state select
		bus_flag <= 
			NOT MemWrite when RW1 | IDEL1,
			'0' when BOOT_RAM1 | BOOT_RAM2,
			'1' when others;

	-- special addresss
	BF01(0) <= serial_tsre and serial_tbre;
	BF01(1) <= serial_dataready;
	BF01(15 downto 2) <= "00000000000000";
	--BF03(0) <= Keyboard_Dataready;
	BF03(15 downto 1) <= "000000000000000";

-------------------------------------
-- serial port part

	ram1_en <= '1';	--disable ram1

	with state select
		serial_flag <= 
			NOT MemWrite when RW1 | IDEL1 | IDEL2,
			'1' when others;
	basicDatabus <= 
		serialHolder when serial_flag = '0' else "ZZZZZZZZ";
	
	-- serial port signal
	serial_wrn <= 
		NOT MemWrite when (address2 = x"BF00" and state = RW1) else '1';
	serial_rdn <= 
		NOT MemRead when (address2 = x"BF00" and ((state = IDEL1) or (state = RW1) or (state=IDEL2))) else '1';
	
	serialHolder <= dataInput (7 downto 0);
	
-------------------------------------
-- flash part

	flash: FlashIO port map(
		addr=> flash_addr_input,
		datain=> flash_data_input,
		dataout=> flash_data_output,

		clk=> clock,
		reset=> reset,

		-- hard port
		flash_byte => flash_byte,
		flash_vpen => flash_vpen,
		flash_ce => flash_ce,
		flash_oe => flash_oe,
		flash_we => flash_we,
		flash_rp => flash_rp,
		flash_addr => flash_addr,
		flash_data => flash_data,

		-- signal to vhdl entity
		ctl_read => ctl_read,
		ctl_write => ctl_write,
		ctl_erase => ctl_erase
	);

	-- design: will never write or erase flash
	ctl_write <= '1';
	ctl_erase <= '1';
	
	-- when boot-flash then drop down ctl_read to read data from flash
	with state select
		ctl_read <= 
			'0' when BOOT_FLASH,
			'1' when others;

	-- when booting, data is from flash
	with state select
		holder <=
			flash_hold_data when BOOT_FLASH | BOOT_RAM1 | BOOT_RAM2,
			datainput when others;

	-- 50 MHz -> 12.5MHz
	with state select
		cpuclock <= 
			'1' when IDEL1 | READ1,
			'0' when others;

-------------------------------------
-- main machine part

	process(clock, reset)
	begin
		if reset='0' then
			state <= Read1; --TODO
			buffer1 <= extendDatabus;
		elsif clock'event and clock='1' then
			case state is
				-- BOOT from flash loops
				when BOOT =>
					flash_addr_count <= "00000000";
					state <= BOOT_FLASH;
				when BOOT_FLASH =>
					case flash_addr_count is
						when "00000000" =>
							flash_addr_input <= flashpc + 1;
							flashpc <= flashpc + 1;
							flash_addr_count <= flash_addr_count + 1;
						when "11111111" =>
							flash_hold_data <= flash_data_output;
							flash_addr_count <= "00000000";
							state <= BOOT_RAM1;
						when others =>
							flash_addr_count <= flash_addr_count + 1;
					end case;
				when BOOT_RAM1 =>
					state <= BOOT_RAM2;
				when BOOT_RAM2 =>
					if flashpc < x"0FFF" then
						state <= BOOT_FLASH;
					else
						state <= BOOT_READY;
					end if;
				when BOOT_READY =>
					state <= READ1;
				
				-- normal CPU work loop
				when READ1 =>
					state <= IDEL1;
					buffer1 <= extendDatabus;
				when IDEL1 =>
					state <= RW1;
				when RW1 =>
					state <= IDEL2;
					case address2 is
						when x"BF01" =>
							buffer2 <= BF01;
						when x"BF00" =>
							buffer2 <= "00000000" & basicDatabus;
						when x"BF02" =>
							-- buffer2 <= "0000000000" & Keyboard_Data;
							buffer2 <= (others => '0');
						when x"BF03" =>
							buffer2 <= BF03;
						when others =>
							buffer2 <= extendDatabus;
					end case;
				when others =>
					state <= READ1;
			end case;
		end if;
	end process;
end Behavioral;

