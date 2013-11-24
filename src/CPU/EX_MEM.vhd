----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:31 11/21/2013 
-- Design Name: 
-- Module Name:    EX_MEM - Behavioral 
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

entity EX_MEM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           WriteIn : in  STD_LOGIC;
           MemReadInput : in  STD_LOGIC;
           MemWriteInput : in  STD_LOGIC;
           MemtoRegInput : in  STD_LOGIC;
			  RegWriteInput: in STD_LOGIC;
			  RegWriteOutput: out STD_LOGIC;
           MemReadOutput : out  STD_LOGIC;
           MemWriteOutput : out  STD_LOGIC;
           MemtoRegOutput : out  STD_LOGIC;
			  RegResultInput: in Int16;
			  RegResultOutput: out Int16;
           DataInput : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOutput : out  STD_LOGIC_VECTOR (15 downto 0);
			  RegReadInput1 : in  STD_LOGIC_VECTOR (3 downto 0);
           RegReadInput2 : in  STD_LOGIC_VECTOR (3 downto 0);
           RegWriteToInput : in  STD_LOGIC_VECTOR (3 downto 0);
           RegReadOutput1 : out  STD_LOGIC_VECTOR (3 downto 0);
           RegReadOutput2 : out  STD_LOGIC_VECTOR (3 downto 0);
           RegWriteToOutput : out  STD_LOGIC_VECTOR (3 downto 0));
end EX_MEM;

architecture Behavioral of EX_MEM is

begin


end Behavioral;

