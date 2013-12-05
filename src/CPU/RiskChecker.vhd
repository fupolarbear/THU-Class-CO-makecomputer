----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:18 11/21/2013 
-- Design Name: 
-- Module Name:    RiskChecker - Behavioral 
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

entity RiskChecker is
	Port(
		PCWrite : out  STD_LOGIC;
		IFIDWrite : out  STD_LOGIC;
		ControlRst : out  STD_LOGIC;
		IDEX_MemWrite : in  STD_LOGIC;
		IDEX_W : in  Int4;
		IFID_R1 : in  Int4;
		IFID_R2 : in  Int4;
		op : in Int5;
		forwardBEQZ: out std_logic
	);
end RiskChecker;

architecture Behavioral of RiskChecker is

begin
-- TODO
	PCWrite <= '1';
	IFIDWrite <= '1';
	ControlRst <= '1';
	process(op, IDEX_W, IFID_R1)
	begin
		forwardBEQZ <= '0';
		if ((op = "11010" or op = "11011") and IDEX_W /= Zero_reg and IDEX_W = IFID_R1) then
			forwardBEQZ <= '1';
		end if;
	end process;
end Behavioral;

