--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: CPU_synthesis.vhd
-- /___/   /\     Timestamp: Sun Nov 24 18:51:59 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm CPU -w -dir netgen/synthesis -ofmt vhdl -sim CPU.ngc CPU_synthesis.vhd 
-- Device	: xc3s1200e-4-fg320
-- Input file	: CPU.ngc
-- Output file	: D:\study\2013fall\ComputerOrganization\lastproject\makecomputer\src\CPU\netgen\synthesis\CPU_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: CPU
-- Xilinx	: D:\mydownload\ISExilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity CPU is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X' 
  );
end CPU;

architecture Structure of CPU is
  component PCReg
    port (
      clk : in STD_LOGIC := 'X'; 
      rst : in STD_LOGIC := 'X'; 
      PCWrite : in STD_LOGIC := 'X'; 
      Output : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
    );
  end component;
  component Mux
    port (
      choice : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
      Output : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input1 : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input2 : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input3 : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
    );
  end component;
  component Add
    port (
      Output : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input1 : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Input2 : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
    );
  end component;
  component InstructionMem
    port (
      Data : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Address : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
    );
  end component;
  component IF_ID
    port (
      clk : in STD_LOGIC := 'X'; 
      WriteIn : in STD_LOGIC := 'X'; 
      rst : in STD_LOGIC := 'X'; 
      Instruction_out : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
      PC_out : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
      PC_in : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      Instruction_in : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
    );
  end component;
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal clk_IBUF_3 : STD_LOGIC; 
  signal rst_IBUF_53 : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_Instruction_out_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_15_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_14_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_13_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_12_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_11_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_10_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_9_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_8_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_7_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_6_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_5_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_4_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_IF_ID_1_PC_out_0_UNCONNECTED : STD_LOGIC; 
  signal instmem_data : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal pc_add4 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal pcreg_output : STD_LOGIC_VECTOR ( 15 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  PCReg_1 : PCReg
    port map (
      clk => clk_IBUF_3,
      rst => rst_IBUF_53,
      PCWrite => N1,
      Output(15) => pcreg_output(15),
      Output(14) => pcreg_output(14),
      Output(13) => pcreg_output(13),
      Output(12) => pcreg_output(12),
      Output(11) => pcreg_output(11),
      Output(10) => pcreg_output(10),
      Output(9) => pcreg_output(9),
      Output(8) => pcreg_output(8),
      Output(7) => pcreg_output(7),
      Output(6) => pcreg_output(6),
      Output(5) => pcreg_output(5),
      Output(4) => pcreg_output(4),
      Output(3) => pcreg_output(3),
      Output(2) => pcreg_output(2),
      Output(1) => pcreg_output(1),
      Output(0) => pcreg_output(0),
      Input(15) => N0,
      Input(14) => N0,
      Input(13) => N0,
      Input(12) => N0,
      Input(11) => N0,
      Input(10) => N0,
      Input(9) => N0,
      Input(8) => N0,
      Input(7) => N0,
      Input(6) => N0,
      Input(5) => N0,
      Input(4) => N0,
      Input(3) => N0,
      Input(2) => N0,
      Input(1) => N0,
      Input(0) => N0
    );
  Mux_PC : Mux
    port map (
      choice(1) => N0,
      choice(0) => N0,
      Output(15) => N0,
      Output(14) => N0,
      Output(13) => N0,
      Output(12) => N0,
      Output(11) => N0,
      Output(10) => N0,
      Output(9) => N0,
      Output(8) => N0,
      Output(7) => N0,
      Output(6) => N0,
      Output(5) => N0,
      Output(4) => N0,
      Output(3) => N0,
      Output(2) => N0,
      Output(1) => N0,
      Output(0) => N0,
      Input1(15) => pc_add4(15),
      Input1(14) => pc_add4(14),
      Input1(13) => pc_add4(13),
      Input1(12) => pc_add4(12),
      Input1(11) => pc_add4(11),
      Input1(10) => pc_add4(10),
      Input1(9) => pc_add4(9),
      Input1(8) => pc_add4(8),
      Input1(7) => pc_add4(7),
      Input1(6) => pc_add4(6),
      Input1(5) => pc_add4(5),
      Input1(4) => pc_add4(4),
      Input1(3) => pc_add4(3),
      Input1(2) => pc_add4(2),
      Input1(1) => pc_add4(1),
      Input1(0) => pc_add4(0),
      Input2(15) => N0,
      Input2(14) => N0,
      Input2(13) => N0,
      Input2(12) => N0,
      Input2(11) => N0,
      Input2(10) => N0,
      Input2(9) => N0,
      Input2(8) => N0,
      Input2(7) => N0,
      Input2(6) => N0,
      Input2(5) => N0,
      Input2(4) => N0,
      Input2(3) => N0,
      Input2(2) => N0,
      Input2(1) => N0,
      Input2(0) => N0,
      Input3(15) => N0,
      Input3(14) => N0,
      Input3(13) => N0,
      Input3(12) => N0,
      Input3(11) => N0,
      Input3(10) => N0,
      Input3(9) => N0,
      Input3(8) => N0,
      Input3(7) => N0,
      Input3(6) => N0,
      Input3(5) => N0,
      Input3(4) => N0,
      Input3(3) => N0,
      Input3(2) => N0,
      Input3(1) => N0,
      Input3(0) => N0
    );
  Add_PC : Add
    port map (
      Output(15) => pc_add4(15),
      Output(14) => pc_add4(14),
      Output(13) => pc_add4(13),
      Output(12) => pc_add4(12),
      Output(11) => pc_add4(11),
      Output(10) => pc_add4(10),
      Output(9) => pc_add4(9),
      Output(8) => pc_add4(8),
      Output(7) => pc_add4(7),
      Output(6) => pc_add4(6),
      Output(5) => pc_add4(5),
      Output(4) => pc_add4(4),
      Output(3) => pc_add4(3),
      Output(2) => pc_add4(2),
      Output(1) => pc_add4(1),
      Output(0) => pc_add4(0),
      Input1(15) => pcreg_output(15),
      Input1(14) => pcreg_output(14),
      Input1(13) => pcreg_output(13),
      Input1(12) => pcreg_output(12),
      Input1(11) => pcreg_output(11),
      Input1(10) => pcreg_output(10),
      Input1(9) => pcreg_output(9),
      Input1(8) => pcreg_output(8),
      Input1(7) => pcreg_output(7),
      Input1(6) => pcreg_output(6),
      Input1(5) => pcreg_output(5),
      Input1(4) => pcreg_output(4),
      Input1(3) => pcreg_output(3),
      Input1(2) => pcreg_output(2),
      Input1(1) => pcreg_output(1),
      Input1(0) => pcreg_output(0),
      Input2(15) => N0,
      Input2(14) => N0,
      Input2(13) => N0,
      Input2(12) => N0,
      Input2(11) => N0,
      Input2(10) => N0,
      Input2(9) => N0,
      Input2(8) => N0,
      Input2(7) => N0,
      Input2(6) => N0,
      Input2(5) => N0,
      Input2(4) => N0,
      Input2(3) => N0,
      Input2(2) => N1,
      Input2(1) => N0,
      Input2(0) => N0
    );
  InstructionMem_1 : InstructionMem
    port map (
      Data(15) => instmem_data(15),
      Data(14) => instmem_data(14),
      Data(13) => instmem_data(13),
      Data(12) => instmem_data(12),
      Data(11) => instmem_data(11),
      Data(10) => instmem_data(10),
      Data(9) => instmem_data(9),
      Data(8) => instmem_data(8),
      Data(7) => instmem_data(7),
      Data(6) => instmem_data(6),
      Data(5) => instmem_data(5),
      Data(4) => instmem_data(4),
      Data(3) => instmem_data(3),
      Data(2) => instmem_data(2),
      Data(1) => instmem_data(1),
      Data(0) => instmem_data(0),
      Address(15) => pcreg_output(15),
      Address(14) => pcreg_output(14),
      Address(13) => pcreg_output(13),
      Address(12) => pcreg_output(12),
      Address(11) => pcreg_output(11),
      Address(10) => pcreg_output(10),
      Address(9) => pcreg_output(9),
      Address(8) => pcreg_output(8),
      Address(7) => pcreg_output(7),
      Address(6) => pcreg_output(6),
      Address(5) => pcreg_output(5),
      Address(4) => pcreg_output(4),
      Address(3) => pcreg_output(3),
      Address(2) => pcreg_output(2),
      Address(1) => pcreg_output(1),
      Address(0) => pcreg_output(0)
    );
  IF_ID_1 : IF_ID
    port map (
      clk => clk_IBUF_3,
      WriteIn => N1,
      rst => rst_IBUF_53,
      Instruction_out(15) => NLW_IF_ID_1_Instruction_out_15_UNCONNECTED,
      Instruction_out(14) => NLW_IF_ID_1_Instruction_out_14_UNCONNECTED,
      Instruction_out(13) => NLW_IF_ID_1_Instruction_out_13_UNCONNECTED,
      Instruction_out(12) => NLW_IF_ID_1_Instruction_out_12_UNCONNECTED,
      Instruction_out(11) => NLW_IF_ID_1_Instruction_out_11_UNCONNECTED,
      Instruction_out(10) => NLW_IF_ID_1_Instruction_out_10_UNCONNECTED,
      Instruction_out(9) => NLW_IF_ID_1_Instruction_out_9_UNCONNECTED,
      Instruction_out(8) => NLW_IF_ID_1_Instruction_out_8_UNCONNECTED,
      Instruction_out(7) => NLW_IF_ID_1_Instruction_out_7_UNCONNECTED,
      Instruction_out(6) => NLW_IF_ID_1_Instruction_out_6_UNCONNECTED,
      Instruction_out(5) => NLW_IF_ID_1_Instruction_out_5_UNCONNECTED,
      Instruction_out(4) => NLW_IF_ID_1_Instruction_out_4_UNCONNECTED,
      Instruction_out(3) => NLW_IF_ID_1_Instruction_out_3_UNCONNECTED,
      Instruction_out(2) => NLW_IF_ID_1_Instruction_out_2_UNCONNECTED,
      Instruction_out(1) => NLW_IF_ID_1_Instruction_out_1_UNCONNECTED,
      Instruction_out(0) => NLW_IF_ID_1_Instruction_out_0_UNCONNECTED,
      PC_out(15) => NLW_IF_ID_1_PC_out_15_UNCONNECTED,
      PC_out(14) => NLW_IF_ID_1_PC_out_14_UNCONNECTED,
      PC_out(13) => NLW_IF_ID_1_PC_out_13_UNCONNECTED,
      PC_out(12) => NLW_IF_ID_1_PC_out_12_UNCONNECTED,
      PC_out(11) => NLW_IF_ID_1_PC_out_11_UNCONNECTED,
      PC_out(10) => NLW_IF_ID_1_PC_out_10_UNCONNECTED,
      PC_out(9) => NLW_IF_ID_1_PC_out_9_UNCONNECTED,
      PC_out(8) => NLW_IF_ID_1_PC_out_8_UNCONNECTED,
      PC_out(7) => NLW_IF_ID_1_PC_out_7_UNCONNECTED,
      PC_out(6) => NLW_IF_ID_1_PC_out_6_UNCONNECTED,
      PC_out(5) => NLW_IF_ID_1_PC_out_5_UNCONNECTED,
      PC_out(4) => NLW_IF_ID_1_PC_out_4_UNCONNECTED,
      PC_out(3) => NLW_IF_ID_1_PC_out_3_UNCONNECTED,
      PC_out(2) => NLW_IF_ID_1_PC_out_2_UNCONNECTED,
      PC_out(1) => NLW_IF_ID_1_PC_out_1_UNCONNECTED,
      PC_out(0) => NLW_IF_ID_1_PC_out_0_UNCONNECTED,
      PC_in(15) => pcreg_output(15),
      PC_in(14) => pcreg_output(14),
      PC_in(13) => pcreg_output(13),
      PC_in(12) => pcreg_output(12),
      PC_in(11) => pcreg_output(11),
      PC_in(10) => pcreg_output(10),
      PC_in(9) => pcreg_output(9),
      PC_in(8) => pcreg_output(8),
      PC_in(7) => pcreg_output(7),
      PC_in(6) => pcreg_output(6),
      PC_in(5) => pcreg_output(5),
      PC_in(4) => pcreg_output(4),
      PC_in(3) => pcreg_output(3),
      PC_in(2) => pcreg_output(2),
      PC_in(1) => pcreg_output(1),
      PC_in(0) => pcreg_output(0),
      Instruction_in(15) => instmem_data(15),
      Instruction_in(14) => instmem_data(14),
      Instruction_in(13) => instmem_data(13),
      Instruction_in(12) => instmem_data(12),
      Instruction_in(11) => instmem_data(11),
      Instruction_in(10) => instmem_data(10),
      Instruction_in(9) => instmem_data(9),
      Instruction_in(8) => instmem_data(8),
      Instruction_in(7) => instmem_data(7),
      Instruction_in(6) => instmem_data(6),
      Instruction_in(5) => instmem_data(5),
      Instruction_in(4) => instmem_data(4),
      Instruction_in(3) => instmem_data(3),
      Instruction_in(2) => instmem_data(2),
      Instruction_in(1) => instmem_data(1),
      Instruction_in(0) => instmem_data(0)
    );
  clk_IBUF : IBUF
    port map (
      I => clk,
      O => clk_IBUF_3
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_53
    );

end Structure;

