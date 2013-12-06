process(ALUop, a, b)
begin
 case ALUop is
  when "000" =>
   res <= a + b;
  when "001" =>
   res <= a - b;
  when "010" =>
   res <= a and b;
  when "011" =>
   res <= a or b;
  when "100" =>
   res <= not a;
  when others =>
   res <= (others => '0');
 end case;
end process;