--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
package Common is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
	subtype Int16 is std_logic_vector(15 downto 0);
	subtype Int15 is std_logic_vector(14 downto 0);
	subtype Int5 is std_logic_vector(4 downto 0);
	subtype Int4 is std_logic_vector(3 downto 0);
	subtype Int3 is std_logic_vector(2 downto 0);
	
	constant Int16_Zero : Int16 := "0000000000000000";
	constant Int15_Zero : Int15 := "000000000000000";
	constant Int5_Zero : Int5 := "00000";
	constant Int4_Zero : Int4 := "0000";
	constant Int4_One : Int4 := "1111";
	constant Int3_Zero : Int3 := "000";
	
	function sll_2(imm: Int16) return Int16;
end Common;

package body Common is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 function sll_2(imm: Int16) return Int16 is
	variable i : integer := 2;
	variable n1: bit_vector(15 downto 0);
	begin 
		i := 2;
		n1 := TO_BITVECTOR(imm);
		return TO_STDLOGICVECTOR(n1 sll i);
	end sll_2;
end Common;
