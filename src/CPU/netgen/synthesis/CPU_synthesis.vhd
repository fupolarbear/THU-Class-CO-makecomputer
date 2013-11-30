--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: CPU_synthesis.vhd
-- /___/   /\     Timestamp: Sat Nov 30 23:59:56 2013
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
    Ram1WE : out STD_LOGIC; 
    rst : in STD_LOGIC := 'X'; 
    Ram1EN : out STD_LOGIC; 
    Ram1OE : out STD_LOGIC; 
    Ram1Data : inout STD_LOGIC_VECTOR ( 15 downto 0 ); 
    Ram1Addr : out STD_LOGIC_VECTOR ( 17 downto 0 ) 
  );
end CPU;

architecture Structure of CPU is
  signal ALU_1_Mmux_Output_45 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_10_rt_2 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_11_rt_4 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_12_rt_6 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_13_rt_8 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_14_rt_10 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_3_rt_13 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_4_rt_15 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_5_rt_17 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_6_rt_19 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_7_rt_21 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_8_rt_23 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy_9_rt_25 : STD_LOGIC; 
  signal Add_PC_Madd_Output_xor_15_rt_27 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_EN_28 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_EN_mux0000 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_flag_FSM_FFd1_31 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_flag_FSM_FFd2_32 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_flag_FSM_FFd3_33 : STD_LOGIC; 
  signal InstructionMem_1_Inst_RAM_ramaddr_and0000 : STD_LOGIC; 
  signal Ram1Addr_0_OBUF_81 : STD_LOGIC; 
  signal clk0 : STD_LOGIC; 
  signal clk_BUFGP_103 : STD_LOGIC; 
  signal divClk_1_Mcount_num : STD_LOGIC; 
  signal divClk_1_Mcount_num1 : STD_LOGIC; 
  signal divClk_1_temp_108 : STD_LOGIC; 
  signal divClk_1_temp_and0000 : STD_LOGIC; 
  signal divClk_1_temp_not0001 : STD_LOGIC; 
  signal rst_IBUF_126 : STD_LOGIC; 
  signal Add_PC_Madd_Output_cy : STD_LOGIC_VECTOR ( 14 downto 2 ); 
  signal Add_PC_Madd_Output_lut : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal InstructionMem_1_Inst_RAM_ramaddr : STD_LOGIC_VECTOR ( 15 downto 2 ); 
  signal PCReg_1_Output : STD_LOGIC_VECTOR ( 15 downto 2 ); 
  signal divClk_1_num : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal pc_add4 : STD_LOGIC_VECTOR ( 15 downto 2 ); 
begin
  XST_GND : GND
    port map (
      G => Ram1Addr_0_OBUF_81
    );
  XST_VCC : VCC
    port map (
      P => ALU_1_Mmux_Output_45
    );
  divClk_1_temp : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_103,
      CE => divClk_1_temp_and0000,
      D => divClk_1_temp_not0001,
      Q => divClk_1_temp_108
    );
  divClk_1_num_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_103,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => divClk_1_Mcount_num,
      Q => divClk_1_num(0)
    );
  divClk_1_num_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_103,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => divClk_1_Mcount_num1,
      Q => divClk_1_num(1)
    );
  Add_PC_Madd_Output_cy_2_Q : MUXCY
    port map (
      CI => Ram1Addr_0_OBUF_81,
      DI => ALU_1_Mmux_Output_45,
      S => Add_PC_Madd_Output_lut(2),
      O => Add_PC_Madd_Output_cy(2)
    );
  Add_PC_Madd_Output_xor_2_Q : XORCY
    port map (
      CI => Ram1Addr_0_OBUF_81,
      LI => Add_PC_Madd_Output_lut(2),
      O => pc_add4(2)
    );
  Add_PC_Madd_Output_cy_3_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(2),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_3_rt_13,
      O => Add_PC_Madd_Output_cy(3)
    );
  Add_PC_Madd_Output_xor_3_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(2),
      LI => Add_PC_Madd_Output_cy_3_rt_13,
      O => pc_add4(3)
    );
  Add_PC_Madd_Output_cy_4_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(3),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_4_rt_15,
      O => Add_PC_Madd_Output_cy(4)
    );
  Add_PC_Madd_Output_xor_4_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(3),
      LI => Add_PC_Madd_Output_cy_4_rt_15,
      O => pc_add4(4)
    );
  Add_PC_Madd_Output_cy_5_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(4),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_5_rt_17,
      O => Add_PC_Madd_Output_cy(5)
    );
  Add_PC_Madd_Output_xor_5_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(4),
      LI => Add_PC_Madd_Output_cy_5_rt_17,
      O => pc_add4(5)
    );
  Add_PC_Madd_Output_cy_6_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(5),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_6_rt_19,
      O => Add_PC_Madd_Output_cy(6)
    );
  Add_PC_Madd_Output_xor_6_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(5),
      LI => Add_PC_Madd_Output_cy_6_rt_19,
      O => pc_add4(6)
    );
  Add_PC_Madd_Output_cy_7_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(6),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_7_rt_21,
      O => Add_PC_Madd_Output_cy(7)
    );
  Add_PC_Madd_Output_xor_7_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(6),
      LI => Add_PC_Madd_Output_cy_7_rt_21,
      O => pc_add4(7)
    );
  Add_PC_Madd_Output_cy_8_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(7),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_8_rt_23,
      O => Add_PC_Madd_Output_cy(8)
    );
  Add_PC_Madd_Output_xor_8_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(7),
      LI => Add_PC_Madd_Output_cy_8_rt_23,
      O => pc_add4(8)
    );
  Add_PC_Madd_Output_cy_9_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(8),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_9_rt_25,
      O => Add_PC_Madd_Output_cy(9)
    );
  Add_PC_Madd_Output_xor_9_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(8),
      LI => Add_PC_Madd_Output_cy_9_rt_25,
      O => pc_add4(9)
    );
  Add_PC_Madd_Output_cy_10_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(9),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_10_rt_2,
      O => Add_PC_Madd_Output_cy(10)
    );
  Add_PC_Madd_Output_xor_10_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(9),
      LI => Add_PC_Madd_Output_cy_10_rt_2,
      O => pc_add4(10)
    );
  Add_PC_Madd_Output_cy_11_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(10),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_11_rt_4,
      O => Add_PC_Madd_Output_cy(11)
    );
  Add_PC_Madd_Output_xor_11_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(10),
      LI => Add_PC_Madd_Output_cy_11_rt_4,
      O => pc_add4(11)
    );
  Add_PC_Madd_Output_cy_12_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(11),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_12_rt_6,
      O => Add_PC_Madd_Output_cy(12)
    );
  Add_PC_Madd_Output_xor_12_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(11),
      LI => Add_PC_Madd_Output_cy_12_rt_6,
      O => pc_add4(12)
    );
  Add_PC_Madd_Output_cy_13_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(12),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_13_rt_8,
      O => Add_PC_Madd_Output_cy(13)
    );
  Add_PC_Madd_Output_xor_13_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(12),
      LI => Add_PC_Madd_Output_cy_13_rt_8,
      O => pc_add4(13)
    );
  Add_PC_Madd_Output_cy_14_Q : MUXCY
    port map (
      CI => Add_PC_Madd_Output_cy(13),
      DI => Ram1Addr_0_OBUF_81,
      S => Add_PC_Madd_Output_cy_14_rt_10,
      O => Add_PC_Madd_Output_cy(14)
    );
  Add_PC_Madd_Output_xor_14_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(13),
      LI => Add_PC_Madd_Output_cy_14_rt_10,
      O => pc_add4(14)
    );
  Add_PC_Madd_Output_xor_15_Q : XORCY
    port map (
      CI => Add_PC_Madd_Output_cy(14),
      LI => Add_PC_Madd_Output_xor_15_rt_27,
      O => pc_add4(15)
    );
  PCReg_1_Output_15 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(15),
      Q => PCReg_1_Output(15)
    );
  PCReg_1_Output_14 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(14),
      Q => PCReg_1_Output(14)
    );
  PCReg_1_Output_13 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(13),
      Q => PCReg_1_Output(13)
    );
  PCReg_1_Output_12 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(12),
      Q => PCReg_1_Output(12)
    );
  PCReg_1_Output_11 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(11),
      Q => PCReg_1_Output(11)
    );
  PCReg_1_Output_10 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(10),
      Q => PCReg_1_Output(10)
    );
  PCReg_1_Output_9 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(9),
      Q => PCReg_1_Output(9)
    );
  PCReg_1_Output_8 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(8),
      Q => PCReg_1_Output(8)
    );
  PCReg_1_Output_7 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(7),
      Q => PCReg_1_Output(7)
    );
  PCReg_1_Output_6 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(6),
      Q => PCReg_1_Output(6)
    );
  PCReg_1_Output_5 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(5),
      Q => PCReg_1_Output(5)
    );
  PCReg_1_Output_4 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(4),
      Q => PCReg_1_Output(4)
    );
  PCReg_1_Output_3 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(3),
      Q => PCReg_1_Output(3)
    );
  PCReg_1_Output_2 : FDCE
    port map (
      C => clk0,
      CE => ALU_1_Mmux_Output_45,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => pc_add4(2),
      Q => PCReg_1_Output(2)
    );
  InstructionMem_1_Inst_RAM_flag_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_103,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => InstructionMem_1_Inst_RAM_flag_FSM_FFd2_32,
      Q => InstructionMem_1_Inst_RAM_flag_FSM_FFd1_31
    );
  InstructionMem_1_Inst_RAM_flag_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_103,
      CLR => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      D => InstructionMem_1_Inst_RAM_flag_FSM_FFd3_33,
      Q => InstructionMem_1_Inst_RAM_flag_FSM_FFd2_32
    );
  InstructionMem_1_Inst_RAM_flag_FSM_FFd3 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_103,
      D => InstructionMem_1_Inst_RAM_flag_FSM_FFd1_31,
      PRE => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      Q => InstructionMem_1_Inst_RAM_flag_FSM_FFd3_33
    );
  InstructionMem_1_Inst_RAM_ramaddr_15 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(15),
      Q => InstructionMem_1_Inst_RAM_ramaddr(15)
    );
  InstructionMem_1_Inst_RAM_ramaddr_14 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(14),
      Q => InstructionMem_1_Inst_RAM_ramaddr(14)
    );
  InstructionMem_1_Inst_RAM_ramaddr_13 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(13),
      Q => InstructionMem_1_Inst_RAM_ramaddr(13)
    );
  InstructionMem_1_Inst_RAM_ramaddr_12 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(12),
      Q => InstructionMem_1_Inst_RAM_ramaddr(12)
    );
  InstructionMem_1_Inst_RAM_ramaddr_11 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(11),
      Q => InstructionMem_1_Inst_RAM_ramaddr(11)
    );
  InstructionMem_1_Inst_RAM_ramaddr_10 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(10),
      Q => InstructionMem_1_Inst_RAM_ramaddr(10)
    );
  InstructionMem_1_Inst_RAM_ramaddr_9 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(9),
      Q => InstructionMem_1_Inst_RAM_ramaddr(9)
    );
  InstructionMem_1_Inst_RAM_ramaddr_8 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(8),
      Q => InstructionMem_1_Inst_RAM_ramaddr(8)
    );
  InstructionMem_1_Inst_RAM_ramaddr_7 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(7),
      Q => InstructionMem_1_Inst_RAM_ramaddr(7)
    );
  InstructionMem_1_Inst_RAM_ramaddr_6 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(6),
      Q => InstructionMem_1_Inst_RAM_ramaddr(6)
    );
  InstructionMem_1_Inst_RAM_ramaddr_5 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(5),
      Q => InstructionMem_1_Inst_RAM_ramaddr(5)
    );
  InstructionMem_1_Inst_RAM_ramaddr_4 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(4),
      Q => InstructionMem_1_Inst_RAM_ramaddr(4)
    );
  InstructionMem_1_Inst_RAM_ramaddr_3 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(3),
      Q => InstructionMem_1_Inst_RAM_ramaddr(3)
    );
  InstructionMem_1_Inst_RAM_ramaddr_2 : FDE
    port map (
      C => clk_BUFGP_103,
      CE => InstructionMem_1_Inst_RAM_ramaddr_and0000,
      D => PCReg_1_Output(2),
      Q => InstructionMem_1_Inst_RAM_ramaddr(2)
    );
  InstructionMem_1_Inst_RAM_EN : FDP
    port map (
      C => clk_BUFGP_103,
      D => InstructionMem_1_Inst_RAM_EN_mux0000,
      PRE => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv,
      Q => InstructionMem_1_Inst_RAM_EN_28
    );
  divClk_1_clk01 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => rst_IBUF_126,
      I1 => divClk_1_temp_108,
      O => clk0
    );
  divClk_1_Mcount_num_xor_1_11 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => divClk_1_num(0),
      I1 => divClk_1_num(1),
      O => divClk_1_Mcount_num1
    );
  divClk_1_Mcount_num_xor_0_11 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => divClk_1_num(0),
      I1 => divClk_1_num(1),
      O => divClk_1_Mcount_num
    );
  InstructionMem_1_Inst_RAM_EN_mux00001 : LUT3
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => InstructionMem_1_Inst_RAM_EN_28,
      I1 => InstructionMem_1_Inst_RAM_flag_FSM_FFd3_33,
      I2 => InstructionMem_1_Inst_RAM_flag_FSM_FFd1_31,
      O => InstructionMem_1_Inst_RAM_EN_mux0000
    );
  InstructionMem_1_Inst_RAM_ramaddr_and00001 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => rst_IBUF_126,
      I1 => InstructionMem_1_Inst_RAM_flag_FSM_FFd3_33,
      O => InstructionMem_1_Inst_RAM_ramaddr_and0000
    );
  divClk_1_temp_and00001 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => rst_IBUF_126,
      I1 => divClk_1_num(0),
      I2 => divClk_1_num(1),
      O => divClk_1_temp_and0000
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_126
    );
  Ram1Data_15_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(15)
    );
  Ram1Data_14_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(14)
    );
  Ram1Data_13_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(13)
    );
  Ram1Data_12_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(12)
    );
  Ram1Data_11_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(11)
    );
  Ram1Data_10_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(10)
    );
  Ram1Data_9_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(9)
    );
  Ram1Data_8_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(8)
    );
  Ram1Data_7_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(7)
    );
  Ram1Data_6_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(6)
    );
  Ram1Data_5_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(5)
    );
  Ram1Data_4_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(4)
    );
  Ram1Data_3_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(3)
    );
  Ram1Data_2_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(2)
    );
  Ram1Data_1_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(1)
    );
  Ram1Data_0_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Data(0)
    );
  Ram1WE_OBUF : OBUF
    port map (
      I => ALU_1_Mmux_Output_45,
      O => Ram1WE
    );
  Ram1EN_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_EN_28,
      O => Ram1EN
    );
  Ram1OE_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_EN_28,
      O => Ram1OE
    );
  Ram1Addr_17_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Addr(17)
    );
  Ram1Addr_16_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Addr(16)
    );
  Ram1Addr_15_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(15),
      O => Ram1Addr(15)
    );
  Ram1Addr_14_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(14),
      O => Ram1Addr(14)
    );
  Ram1Addr_13_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(13),
      O => Ram1Addr(13)
    );
  Ram1Addr_12_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(12),
      O => Ram1Addr(12)
    );
  Ram1Addr_11_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(11),
      O => Ram1Addr(11)
    );
  Ram1Addr_10_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(10),
      O => Ram1Addr(10)
    );
  Ram1Addr_9_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(9),
      O => Ram1Addr(9)
    );
  Ram1Addr_8_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(8),
      O => Ram1Addr(8)
    );
  Ram1Addr_7_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(7),
      O => Ram1Addr(7)
    );
  Ram1Addr_6_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(6),
      O => Ram1Addr(6)
    );
  Ram1Addr_5_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(5),
      O => Ram1Addr(5)
    );
  Ram1Addr_4_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(4),
      O => Ram1Addr(4)
    );
  Ram1Addr_3_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(3),
      O => Ram1Addr(3)
    );
  Ram1Addr_2_OBUF : OBUF
    port map (
      I => InstructionMem_1_Inst_RAM_ramaddr(2),
      O => Ram1Addr(2)
    );
  Ram1Addr_1_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Addr(1)
    );
  Ram1Addr_0_OBUF : OBUF
    port map (
      I => Ram1Addr_0_OBUF_81,
      O => Ram1Addr(0)
    );
  Add_PC_Madd_Output_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(3),
      O => Add_PC_Madd_Output_cy_3_rt_13
    );
  Add_PC_Madd_Output_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(4),
      O => Add_PC_Madd_Output_cy_4_rt_15
    );
  Add_PC_Madd_Output_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(5),
      O => Add_PC_Madd_Output_cy_5_rt_17
    );
  Add_PC_Madd_Output_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(6),
      O => Add_PC_Madd_Output_cy_6_rt_19
    );
  Add_PC_Madd_Output_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(7),
      O => Add_PC_Madd_Output_cy_7_rt_21
    );
  Add_PC_Madd_Output_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(8),
      O => Add_PC_Madd_Output_cy_8_rt_23
    );
  Add_PC_Madd_Output_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(9),
      O => Add_PC_Madd_Output_cy_9_rt_25
    );
  Add_PC_Madd_Output_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(10),
      O => Add_PC_Madd_Output_cy_10_rt_2
    );
  Add_PC_Madd_Output_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(11),
      O => Add_PC_Madd_Output_cy_11_rt_4
    );
  Add_PC_Madd_Output_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(12),
      O => Add_PC_Madd_Output_cy_12_rt_6
    );
  Add_PC_Madd_Output_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(13),
      O => Add_PC_Madd_Output_cy_13_rt_8
    );
  Add_PC_Madd_Output_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(14),
      O => Add_PC_Madd_Output_cy_14_rt_10
    );
  Add_PC_Madd_Output_xor_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PCReg_1_Output(15),
      O => Add_PC_Madd_Output_xor_15_rt_27
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_103
    );
  Add_PC_Madd_Output_lut_2_INV_0 : INV
    port map (
      I => PCReg_1_Output(2),
      O => Add_PC_Madd_Output_lut(2)
    );
  rst_inv1_INV_0 : INV
    port map (
      I => rst_IBUF_126,
      O => InstructionMem_1_Inst_RAM_flag_FSM_Acst_FSM_inv
    );
  divClk_1_temp_not00011_INV_0 : INV
    port map (
      I => divClk_1_temp_108,
      O => divClk_1_temp_not0001
    );

end Structure;

