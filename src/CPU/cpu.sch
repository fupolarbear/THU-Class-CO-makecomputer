# File saved with Nlview version 6.2.4  2012-10-10 bk=1.2632 VDI=32 GEI=33
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 3
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property decorate 1
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instdrag 15
property maxbuttonzoom 3
property maxfontzoom 2
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc000
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 15
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new CPU work:Behavioral:CPU.vhd -nosplit
load symbol PCReg work BOX port clk input.left port rst input.left port PCWrite input.left fillcolor 1
load symbol Mux work:Behavioral:Mux.vhd HIERBOX portBus choice input.left [1:0] portBus Input1 input.left [15:0] portBus Input2 input.left [15:0] portBus Input3 input.left [15:0] portBus Output output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Add work BOX fillcolor 1
load symbol IF_ID work BOX port clk input.left port rst input.left port WriteIn input.left fillcolor 1
load symbol Decoder work:Behavioral:Decoder.vhd HIERBOX portBus Instruction input.left [15:0] portBus Op output.right [4:0] portBus Reg1 output.right [3:0] portBus Reg2 output.right [3:0] portBus Reg3 output.right [3:0] portBus Imm output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Controller work:Behavioral:Controller.vhd HIERBOX port rst input.left port ALUsrc output.right port TType output.right port TWrite output.right port MemRead output.right port MemWrite output.right port MemtoReg output.right port RegWrite output.right port ret output.right portBus Op input.left [4:0] portBus ALUop output.right [2:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol BranchSelector work:Behavioral:BranchSelector.vhd HIERBOX port T input.left portBus Op input.left [4:0] portBus RegInput input.left [15:0] portBus Branch output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RegFile work:Behavioral:RegFile.vhd HIERBOX port RegWrite input.left port clk input.left port rst input.left portBus ReadAddress1 input.left [3:0] portBus ReadAddress2 input.left [3:0] portBus WriteAddress input.left [3:0] portBus WriteData input.left [15:0] portBus PCinput input.left [15:0] portBus Reg1 output.right [15:0] portBus Reg2 output.right [15:0] portBus sel input.left [3:0] portBus LED_output output.right [15:0] portBus debug input.left [15:0] portBus vga_reg1 output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RiskChecker work:Behavioral:RiskChecker.vhd HIERBOX port PCWrite output.right port IFIDWrite output.right port ControlRst output.right port IDEX_MemWrite input.left portBus IDEX_W input.left [3:0] portBus IFID_R1 input.left [3:0] portBus IFID_R2 input.left [3:0] portBus op input.left [4:0] portBus forwardBEQZ output.right [1:0] portBus EXMEM_W input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ID_EX work:Behavioral:ID_EX.vhd HIERBOX port clk input.left port rst input.left port WriteIn input.left port ALUsrcInput input.left port TTypeInput input.left port TWriteInput input.left port MemReadInput input.left port MemWriteInput input.left port MemtoRegInput input.left port RegWriteInput input.left port RegWriteOutput output.right port ALUsrcOutput output.right port TTypeOutput output.right port TWriteOutput output.right port MemReadOutput output.right port MemWriteOutput output.right port MemtoRegOutput output.right port retinput input.left port retoutput output.right portBus ALUopInput input.left [2:0] portBus ALUopOutput output.right [2:0] portBus DataInput1 input.left [15:0] portBus DataInput2 input.left [15:0] portBus ImmediateInput input.left [15:0] portBus RegResult output.right [15:0] portBus ALUdata1 output.right [15:0] portBus ALUdata2 output.right [15:0] portBus RegReadInput1 input.left [3:0] portBus RegReadInput2 input.left [3:0] portBus RegWriteToInput input.left [3:0] portBus RegReadOutput1 output.right [3:0] portBus RegReadOutput2 output.right [3:0] portBus RegWriteToOutput output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ALU work:Behavioral:ALU.vhd HIERBOX portBus Input1 input.left [15:0] portBus Input2 input.left [15:0] portBus Output output.right [15:0] portBus ALUop input.left [2:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol TReg work:Behavioral:TReg.vhd HIERBOX port TType input.left port TWrite input.left port T output.right portBus Input input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Mux work:abstract:Mux.vhd HIERBOX portBus choice input.left [1:0] portBus Input1 input.left [15:0] portBus Input2 input.left [15:0] portBus Input3 input.left [15:0] portBus Output output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Passer work:Behavioral:Passer.vhd HIERBOX port IDEX_alusrc input.left port EXMEM_RegWrite input.left port MEMWB_RegWrite input.left portBus EXMEM_W input.left [3:0] portBus MEMWB_W input.left [3:0] portBus IDEX_R1 input.left [3:0] portBus IDEX_R2 input.left [3:0] portBus ForwardA output.right [1:0] portBus ForwardB output.right [1:0] portBus ForwardC output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol EX_MEM work:Behavioral:EX_MEM.vhd HIERBOX port clk input.left port rst input.left port WriteIn input.left port MemReadInput input.left port MemWriteInput input.left port MemtoRegInput input.left port RegWriteInput input.left port RegWriteOutput output.right port MemReadOutput output.right port MemWriteOutput output.right port MemtoRegOutput output.right port retinput input.left port retoutput output.right portBus RegResultInput input.left [15:0] portBus RegResultOutput output.right [15:0] portBus DataInput input.left [15:0] portBus DataOutput output.right [15:0] portBus RegReadInput1 input.left [3:0] portBus RegReadInput2 input.left [3:0] portBus RegWriteToInput input.left [3:0] portBus RegReadOutput1 output.right [3:0] portBus RegReadOutput2 output.right [3:0] portBus RegWriteToOutput output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MEM_WB work:Behavioral:MEM_WB.vhd HIERBOX port clk input.left port rst input.left port WriteIn input.left port MemtoRegInput input.left port MemtoRegOutput output.right port RegWriteInput input.left port RegWriteOutput output.right port retinput input.left port retoutput output.right portBus AluResultInput input.left [15:0] portBus AluResultOutput output.right [15:0] portBus MemResultInput input.left [15:0] portBus MemResultOutput output.right [15:0] portBus RegReadInput1 input.left [3:0] portBus RegReadInput2 input.left [3:0] portBus RegWriteToInput input.left [3:0] portBus RegReadOutput1 output.right [3:0] portBus RegReadOutput2 output.right [3:0] portBus RegWriteToOutput output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Mux2 work:Behavioral:Mux2.vhd HIERBOX port choice input.left portBus Input1 input.left [15:0] portBus Input2 input.left [15:0] portBus Output output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol divClk work:Behavioral:divClk.vhd HIERBOX port rst input.left port clk input.left port clk0 output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol LED_seg7 work:Behavioral:LED_seg7.vhd HIERBOX portBus input input.left [3:0] portBus output output.right [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol LED_seg7 work:abstract:LED_seg7.vhd HIERBOX portBus input input.left [3:0] portBus output output.right [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol VGA_play work:Behavioral:VGA_play.vhd HIERBOX port CLK_0 input.left port clkout output.right port reset input.left port Hs output.right port Vs output.right portBus R output.right [2:0] portBus G output.right [2:0] portBus B output.right [2:0] portBus wctrl input.left [0:0] portBus waddr input.left [10:0] portBus wdata input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_INV Primitives INV port i input port o output fillcolor 1
load symbol RTL_AND Primitives AND port a0 input port a1 input port o output fillcolor 1
load symbol MemoryTop work:Behavioral:MemoryTop.vhd HIERBOX port clock input.left port cpuclock output.right port MemWrite input.left port MemRead input.left port memoryEN output.right port memoryOE output.right port memoryRW output.right port flash_byte output.right port flash_vpen output.right port flash_ce output.right port flash_oe output.right port flash_we output.right port flash_rp output.right port serial_wrn output.right port serial_rdn output.right port serial_dataready input.left port serial_tsre input.left port serial_tbre input.left port ram1_en output.right port reset input.left port Keyboard_Dataready input.left port Keyboard_wrn output.right portBus address1 input.left [15:0] portBus output1 output.right [15:0] portBus address2 input.left [15:0] portBus output2 output.right [15:0] portBus dataInput input.left [15:0] portBus memoryAddress output.right [17:0] portBus extendDatabus inout.left [15:0] portBus flash_addr output.right [22:1] portBus flash_data inout.left [15:0] portBus basicdatabus inout.left [7:0] portBus Keyboard_Data input.left [7:0] portBus VGA_addr output.right [10:0] portBus VGA_write output.right [0:0] portBus VGA_char output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol KeyTop work:behave:KeyTop.vhd HIERBOX port datain input.left port clkin input.left port clk50 input.left port rst_in input.left port dataready_out output.right port datareceived input.left portBus out_char output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_equal_1 Operators RTL(=) port o output.right portBus a input.left [0:0] portBus b input.left [0:0] fillcolor 1
load symbol RTL_MUX Primitives MUX port a0 input.left port a1 input.left port c input.bot port o output.right fillcolor 1
load port clk input -pg 1 -y 1660
load port Ram2EN output -pg 1 -y 1700
load port Ram1EN output -pg 1 -y 1800
load port rst input -pg 1 -y 1360
load port serialWRN output -pg 1 -y 1840
load port serialRDN output -pg 1 -y 1820
load port flash_we output -pg 1 -y 1660
load port flash_byte output -pg 1 -y 1560
load port flash_oe output -pg 1 -y 1600
load port serialTBRE input -pg 1 -y 1900
load port Hs output -pg 1 -y 1420
load port keydatain input -pg 1 -y 1620
load port flash_vpen output -pg 1 -y 1640
load port Ram2WE output -pg 1 -y 1740
load port serialTSRE input -pg 1 -y 1920
load port Ram2OE output -pg 1 -y 1720
load port CLK_0 input -pg 1 -y 1800
load port Ram1WE output -pg 1 -y 2100
load port Vs output -pg 1 -y 1460
load port Ram1OE output -pg 1 -y 2080
load port flash_rp output -pg 1 -y 1620
load port DATAREADY input -pg 1 -y 1780
load port keyclkin input -pg 1 -y 1600
load port flash_ce output -pg 1 -y 1580
load portBus flash_data inout [15:0] -attr @name flash_data[15:0] -pg 1 -y 2040
load portBus B output [2:0] -attr @name B[2:0] -pg 1 -y 1380
load portBus Ram2Addr output [17:0] -attr @name Ram2Addr[17:0] -pg 1 -y 1680
load portBus LED_output output [15:0] -attr @name LED_output[15:0] -pg 1 -y 1010
load portBus R output [2:0] -attr @name R[2:0] -pg 1 -y 1440
load portBus KEY16_INPUT input [4:0] -attr @name KEY16_INPUT[4:0] -pg 1 -y 1550
load portBus Ram1Data inout [7:0] -attr @name Ram1Data[7:0] -pg 1 -y 1520
load portBus basicDatabus inout [7:0] -attr @name basicDatabus[7:0] -pg 1 -y 20
load portBus G output [2:0] -attr @name G[2:0] -pg 1 -y 1400
load portBus flash_addr output [22:1] -attr @name flash_addr[22:1] -pg 1 -y 1540
load portBus ledseg1 output [6:0] -attr @name ledseg1[6:0] -pg 1 -y 1900
load portBus Ram2Data inout [15:0] -attr @name Ram2Data[15:0] -pg 1 -y 2020
load portBus ledseg2 output [6:0] -attr @name ledseg2[6:0] -pg 1 -y 1980
load inst Mux_BEQZ Mux work:abstract:Mux.vhd -autohide -attr @cell(#000000) Mux -pinBusAttr choice @name choice[1:0] -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Input3 @name Input3[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 5 -y 620
load inst clk1_clk_MUX_729 RTL_MUX Primitives -attr @cell(#000000) RTL_MUX -pg 1 -lvl 7 -y 1700
load inst Passer_1 Passer work:Behavioral:Passer.vhd -autohide -attr @cell(#000000) Passer -pinBusAttr EXMEM_W @name EXMEM_W[3:0] -pinBusAttr MEMWB_W @name MEMWB_W[3:0] -pinBusAttr IDEX_R1 @name IDEX_R1[3:0] -pinBusAttr IDEX_R2 @name IDEX_R2[3:0] -pinBusAttr ForwardA @name ForwardA[1:0] -pinBusAttr ForwardB @name ForwardB[1:0] -pinBusAttr ForwardC @name ForwardC[1:0] -pg 1 -lvl 2 -y 640
load inst Add_PC Add work -attr @cell(#000000) Add -pg 1 -lvl 1 -y 1960
load inst PCReg_1 PCReg work -attr @cell(#000000) PCReg -pg 1 -lvl 4 -y 1490
load inst board KeyTop work:behave:KeyTop.vhd -autohide -attr @cell(#000000) KeyTop -pinBusAttr out_char @name out_char[7:0] -pg 1 -lvl 7 -y 1490
load inst Mux_wb Mux2 work:Behavioral:Mux2.vhd -autohide -attr @cell(#000000) Mux2 -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 2 -y 1130
load inst BranchSelector_1 BranchSelector work:Behavioral:BranchSelector.vhd -autohide -attr @cell(#000000) BranchSelector -pinBusAttr Op @name Op[4:0] -pinBusAttr RegInput @name RegInput[15:0] -pinBusAttr Branch @name Branch[1:0] -pg 1 -lvl 6 -y 1310
load inst Mux_alusrc1 Mux work:abstract:Mux.vhd -autohide -attr @cell(#000000) Mux -pinBusAttr choice @name choice[1:0] -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Input3 @name Input3[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 3 -y 60
load inst ALU_1 ALU work:Behavioral:ALU.vhd -autohide -attr @cell(#000000) ALU -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Output @name Output[15:0] -pinBusAttr ALUop @name ALUop[2:0] -pg 1 -lvl 3 -y 1330
load inst IF_ID_1 IF_ID work -attr @cell(#000000) IF_ID -pg 1 -lvl 4 -y 800
load inst LED_left LED_seg7 work:Behavioral:LED_seg7.vhd -autohide -attr @cell(#000000) LED_seg7 -pinBusAttr input @name input[3:0] -pinBusAttr output @name output[6:0] -pg 1 -lvl 9 -y 1970
load inst Mux_alusrc2 Mux work:abstract:Mux.vhd -autohide -attr @cell(#000000) Mux -pinBusAttr choice @name choice[1:0] -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Input3 @name Input3[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 3 -y 260
load inst RiskChecker_1 RiskChecker work:Behavioral:RiskChecker.vhd -autohide -attr @cell(#000000) RiskChecker -pinBusAttr IDEX_W @name IDEX_W[3:0] -pinBusAttr IFID_R1 @name IFID_R1[3:0] -pinBusAttr IFID_R2 @name IFID_R2[3:0] -pinBusAttr op @name op[4:0] -pinBusAttr forwardBEQZ @name forwardBEQZ[1:0] -pinBusAttr EXMEM_W @name EXMEM_W[3:0] -pg 1 -lvl 3 -y 500
load inst RegFile_1 RegFile work:Behavioral:RegFile.vhd -autohide -attr @cell(#000000) RegFile -pinBusAttr ReadAddress1 @name ReadAddress1[3:0] -pinBusAttr ReadAddress2 @name ReadAddress2[3:0] -pinBusAttr WriteAddress @name WriteAddress[3:0] -pinBusAttr WriteData @name WriteData[15:0] -pinBusAttr PCinput @name PCinput[15:0] -pinBusAttr Reg1 @name Reg1[15:0] -pinBusAttr Reg2 @name Reg2[15:0] -pinBusAttr sel @name sel[3:0] -pinBusAttr LED_output @name LED_output[15:0] -pinBusAttr debug @name debug[15:0] -pinBusAttr vga_reg1 @name vga_reg1[15:0] -pg 1 -lvl 4 -y 940
load inst Inst_MemoryTop MemoryTop work:Behavioral:MemoryTop.vhd -autohide -attr @cell(#000000) MemoryTop -pinBusAttr address1 @name address1[15:0] -pinBusAttr output1 @name output1[15:0] -pinBusAttr address2 @name address2[15:0] -pinBusAttr output2 @name output2[15:0] -pinBusAttr dataInput @name dataInput[15:0] -pinBusAttr memoryAddress @name memoryAddress[17:0] -pinBusAttr extendDatabus @name extendDatabus[15:0] -pinBusAttr flash_addr @name flash_addr[22:1] -pinBusAttr flash_data @name flash_data[15:0] -pinBusAttr basicdatabus @name basicdatabus[7:0] -pinBusAttr Keyboard_Data @name Keyboard_Data[7:0] -pinBusAttr VGA_addr @name VGA_addr[10:0] -pinBusAttr VGA_write @name VGA_write -pinBusAttr VGA_char @name VGA_char[7:0] -pg 1 -lvl 8 -y 1430
load inst clk0_S_MEMWB_ret_AND_70 RTL_AND Primitives -attr @cell(#000000) RTL_AND -pg 1 -lvl 3 -y 1500
load inst ID_EX_1 ID_EX work:Behavioral:ID_EX.vhd -autohide -attr @cell(#000000) ID_EX -pinBusAttr ALUopInput @name ALUopInput[2:0] -pinBusAttr ALUopOutput @name ALUopOutput[2:0] -pinBusAttr DataInput1 @name DataInput1[15:0] -pinBusAttr DataInput2 @name DataInput2[15:0] -pinBusAttr ImmediateInput @name ImmediateInput[15:0] -pinBusAttr RegResult @name RegResult[15:0] -pinBusAttr ALUdata1 @name ALUdata1[15:0] -pinBusAttr ALUdata2 @name ALUdata2[15:0] -pinBusAttr RegReadInput1 @name RegReadInput1[3:0] -pinBusAttr RegReadInput2 @name RegReadInput2[3:0] -pinBusAttr RegWriteToInput @name RegWriteToInput[3:0] -pinBusAttr RegReadOutput1 @name RegReadOutput1[3:0] -pinBusAttr RegReadOutput2 @name RegReadOutput2[3:0] -pinBusAttr RegWriteToOutput @name RegWriteToOutput[3:0] -pg 1 -lvl 5 -y 140
load inst Controller_1 Controller work:Behavioral:Controller.vhd -autohide -attr @cell(#000000) Controller -pinBusAttr Op @name Op[4:0] -pinBusAttr ALUop @name ALUop[2:0] -pg 1 -lvl 4 -y 320
load inst Inst_VGA_play VGA_play work:Behavioral:VGA_play.vhd -autohide -attr @cell(#000000) VGA_play -pinBusAttr R @name R[2:0] -pinBusAttr G @name G[2:0] -pinBusAttr B @name B[2:0] -pinBusAttr wctrl @name wctrl -pinBusAttr waddr @name waddr[10:0] -pinBusAttr wdata @name wdata[7:0] -pg 1 -lvl 9 -y 1370
load inst GND_6_o_KEY16_INPUT[4]_equal_1 RTL_equal_1 Operators -attr @cell(#000000) RTL_equal_1 -pinBusAttr a @name a -pinBusAttr b @name b -pg 1 -lvl 6 -y 1710
load inst EX_MEM_1 EX_MEM work:Behavioral:EX_MEM.vhd -autohide -attr @cell(#000000) EX_MEM -pinBusAttr RegResultInput @name RegResultInput[15:0] -pinBusAttr RegResultOutput @name RegResultOutput[15:0] -pinBusAttr DataInput @name DataInput[15:0] -pinBusAttr DataOutput @name DataOutput[15:0] -pinBusAttr RegReadInput1 @name RegReadInput1[3:0] -pinBusAttr RegReadInput2 @name RegReadInput2[3:0] -pinBusAttr RegWriteToInput @name RegWriteToInput[3:0] -pinBusAttr RegReadOutput1 @name RegReadOutput1[3:0] -pinBusAttr RegReadOutput2 @name RegReadOutput2[3:0] -pinBusAttr RegWriteToOutput @name RegWriteToOutput[3:0] -pg 1 -lvl 7 -y 540
load inst divClk_1 divClk work:Behavioral:divClk.vhd -autohide -attr @cell(#000000) divClk -pg 1 -lvl 6 -y 1830
load inst MEM_WB_1 MEM_WB work:Behavioral:MEM_WB.vhd -autohide -attr @cell(#000000) MEM_WB -pinBusAttr AluResultInput @name AluResultInput[15:0] -pinBusAttr AluResultOutput @name AluResultOutput[15:0] -pinBusAttr MemResultInput @name MemResultInput[15:0] -pinBusAttr MemResultOutput @name MemResultOutput[15:0] -pinBusAttr RegReadInput1 @name RegReadInput1[3:0] -pinBusAttr RegReadInput2 @name RegReadInput2[3:0] -pinBusAttr RegWriteToInput @name RegWriteToInput[3:0] -pinBusAttr RegReadOutput1 @name RegReadOutput1[3:0] -pinBusAttr RegReadOutput2 @name RegReadOutput2[3:0] -pinBusAttr RegWriteToOutput @name RegWriteToOutput[3:0] -pg 1 -lvl 1 -y 1150
load inst Decoder_1 Decoder work:Behavioral:Decoder.vhd -autohide -attr @cell(#000000) Decoder -pinBusAttr Instruction @name Instruction[15:0] -pinBusAttr Op @name Op[4:0] -pinBusAttr Reg1 @name Reg1[3:0] -pinBusAttr Reg2 @name Reg2[3:0] -pinBusAttr Reg3 @name Reg3[3:0] -pinBusAttr Imm @name Imm[15:0] -pg 1 -lvl 2 -y 300
load inst Mux_regsultsrc Mux work:abstract:Mux.vhd -autohide -attr @cell(#000000) Mux -pinBusAttr choice @name choice[1:0] -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Input3 @name Input3[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 6 -y 520
load inst TReg_1 TReg work:Behavioral:TReg.vhd -autohide -attr @cell(#000000) TReg -pinBusAttr Input @name Input[15:0] -pg 1 -lvl 4 -y 1370
load inst Add_imm Add work -attr @cell(#000000) Add -pg 1 -lvl 9 -y 2080
load inst MEMWB_ret_INV_104 RTL_INV Primitives -attr @cell(#000000) RTL_INV -pg 1 -lvl 2 -y 1510
load inst LED_right LED_seg7 work:abstract:LED_seg7.vhd -autohide -attr @cell(#000000) LED_seg7 -pinBusAttr input @name input[3:0] -pinBusAttr output @name output[6:0] -pg 1 -lvl 9 -y 1890
load inst Mux_PC Mux work:Behavioral:Mux.vhd -autohide -attr @cell(#000000) Mux -pinBusAttr choice @name choice[1:0] -pinBusAttr Input1 @name Input1[15:0] -pinBusAttr Input2 @name Input2[15:0] -pinBusAttr Input3 @name Input3[15:0] -pinBusAttr Output @name Output[15:0] -pg 1 -lvl 7 -y 1310
load net pcreg_input[15] -attr @rip(#000000) Output[15] -pin Mux_PC Output[15]
load net Ram2Addr[0] -attr @rip(#000000) memoryAddress[0] -pin Inst_MemoryTop memoryAddress[0] -port Ram2Addr[0]
load net Hs -port Hs -pin Inst_VGA_play Hs
netloc Hs 1 9 1 N
load net regfile_reg2[9] -attr @rip(#000000) Reg2[9] -pin ID_EX_1 DataInput2[9] -pin RegFile_1 Reg2[9]
load net vgawaddr[6] -attr @rip(#000000) VGA_addr[6] -pin Inst_MemoryTop VGA_addr[6] -pin Inst_VGA_play waddr[6]
load net pc_imm[3] -attr @rip(#000000) 3 -pin Mux_PC Input2[3]
load net vga_reg1[13] -attr @rip(#000000) vga_reg1[13] -pin RegFile_1 vga_reg1[13]
load net LED_output[10] -attr @rip(#000000) LED_output[10] -port LED_output[10] -pin RegFile_1 LED_output[10]
load net MEMWB_regwriteto[2] -attr @rip(#000000) RegWriteToOutput[2] -pin MEM_WB_1 RegWriteToOutput[2] -pin Passer_1 MEMWB_W[2] -pin RegFile_1 WriteAddress[2]
load net IDEX_aludata1[14] -attr @rip(#000000) ALUdata1[14] -pin ID_EX_1 ALUdata1[14] -pin Mux_alusrc1 Input1[14]
load net EXMEM_regresult[3] -attr @rip(#000000) RegResultOutput[3] -pin EX_MEM_1 RegResultOutput[3] -pin Inst_MemoryTop dataInput[3]
load net vga_reg1[2] -attr @rip(#000000) vga_reg1[2] -pin RegFile_1 vga_reg1[2]
load net clk0_S -pin Inst_MemoryTop cpuclock -pin clk0_S_MEMWB_ret_AND_70 a0
netloc clk0_S 1 2 7 1190 1460 N 1460 N 1460 N 1460 3520 1440 3880 1340 4440
load net pc_imm[12] -attr @rip(#000000) 12 -pin Mux_PC Input2[12]
load net memtoreg -pin Controller_1 MemtoReg -pin ID_EX_1 MemtoRegInput
netloc memtoreg 1 4 1 2320
load net Ram2Data[9] -attr @rip(#000000) extendDatabus[9] -pin Inst_MemoryTop extendDatabus[9] -port Ram2Data[9]
load net pcreg_input[4] -attr @rip(#000000) Output[4] -pin Mux_PC Output[4]
load net IDEX_aludata2[6] -attr @rip(#000000) ALUdata2[6] -pin ID_EX_1 ALUdata2[6] -pin Mux_alusrc2 Input1[6]
load net regfile_reg1[5] -attr @rip(#000000) Reg1[5] -pin ID_EX_1 DataInput1[5] -pin Mux_BEQZ Input1[5] -pin Mux_PC Input3[5] -pin RegFile_1 Reg1[5]
load net alu_input1[8] -attr @rip(#000000) Output[8] -pin ALU_1 Input1[8] -pin Mux_alusrc1 Output[8]
load net EXMEM_regresultinput[7] -attr @rip(#000000) Output[7] -pin EX_MEM_1 RegResultInput[7] -pin Mux_regsultsrc Output[7]
load net Ram2Addr[16] -attr @rip(#000000) memoryAddress[16] -pin Inst_MemoryTop memoryAddress[16] -port Ram2Addr[16]
load net fuck[0] -ground -attr @rip(#000000) 0 -pin GND_6_o_KEY16_INPUT[4]_equal_1 a[0] -pin RegFile_1 debug[0]
load net pcreg_output[12] -attr @rip(#000000) 12 -pin Inst_MemoryTop address1[12]
load net BranchReg[2] -attr @rip(#000000) Output[2] -pin BranchSelector_1 RegInput[2] -pin Mux_BEQZ Output[2]
load net Ram1Data[7] -attr @rip(#000000) basicdatabus[7] -pin Inst_MemoryTop basicdatabus[7] -port Ram1Data[7]
load net IDEX_regresult[0] -attr @rip(#000000) RegResult[0] -pin ID_EX_1 RegResult[0] -pin Mux_regsultsrc Input1[0]
load net serialWRN -pin Inst_MemoryTop serial_wrn -port serialWRN
netloc serialWRN 1 8 2 N 1840 N
load net MEMWB_memresult[3] -attr @rip(#000000) MemResultOutput[3] -pin MEM_WB_1 MemResultOutput[3] -pin Mux_wb Input2[3]
load net IDEX_aludata1[2] -attr @rip(#000000) ALUdata1[2] -pin ID_EX_1 ALUdata1[2] -pin Mux_alusrc1 Input1[2]
load net MEMWB_regread1[0] -attr @rip(#000000) RegReadOutput1[0] -pin MEM_WB_1 RegReadOutput1[0]
load net instmem_data[1] -attr @rip(#000000) output1[1] -pin Inst_MemoryTop output1[1]
load net flash_data[4] -attr @rip(#000000) flash_data[4] -pin Inst_MemoryTop flash_data[4] -port flash_data[4]
load net B[0] -attr @rip(#000000) B[0] -port B[0] -pin Inst_VGA_play B[0]
load net flash_addr[22] -attr @rip(#000000) flash_addr[22] -pin Inst_MemoryTop flash_addr[22] -port flash_addr[22]
load net alu_input2[1] -attr @rip(#000000) Output[1] -pin ALU_1 Input2[1] -pin Mux_alusrc2 Output[1] -pin RegFile_1 debug[9]
load net IFID_inst_out[13] -attr @rip(#000000) 13 -pin Decoder_1 Instruction[13]
load net regfile_writedata[5] -attr @rip(#000000) Output[5] -pin Mux_alusrc1 Input2[5] -pin Mux_alusrc2 Input2[5] -pin Mux_regsultsrc Input2[5] -pin Mux_wb Output[5] -pin RegFile_1 WriteData[5]
load net decoder_op[4] -attr @rip(#000000) Op[4] -pin BranchSelector_1 Op[4] -pin Controller_1 Op[4] -pin Decoder_1 Op[4] -pin RiskChecker_1 op[4]
load net ledseg1[4] -attr @rip(#000000) output[4] -pin LED_right output[4] -port ledseg1[4]
load net pc_add4[14] -attr @rip(#000000) 14 -pin Mux_PC Input1[14]
load net alu_output[1] -attr @rip(#000000) Output[1] -pin ALU_1 Output[1] -pin EX_MEM_1 DataInput[1] -pin Mux_BEQZ Input2[1] -pin RegFile_1 debug[5] -pin TReg_1 Input[1]
load net basicDatabus[3] -attr @rip(#000000) basicDatabus[3] -port basicDatabus[3]
load net vgawdata[4] -attr @rip(#000000) VGA_char[4] -pin Inst_MemoryTop VGA_char[4] -pin Inst_VGA_play wdata[4]
load net MEMWB_aluresult[1] -attr @rip(#000000) AluResultOutput[1] -pin MEM_WB_1 AluResultOutput[1] -pin Mux_wb Input1[1]
load net rst -pin EX_MEM_1 rst -pin ID_EX_1 rst -pin IF_ID_1 rst -pin Inst_MemoryTop reset -pin Inst_VGA_play reset -pin MEM_WB_1 rst -pin PCReg_1 rst -pin RegFile_1 rst -pin board rst_in -pin divClk_1 rst -port rst
netloc rst 1 0 9 180 1440 N 1440 N 1440 1780 1580 2480 1820 2980 1440 3460 1620 4040 1380 4460
load net clk_out -pin Inst_MemoryTop clock -pin clk1_clk_MUX_729 o
netloc clk_out 1 7 1 3940
load net decoder_reg1[1] -attr @rip(#000000) Reg1[1] -pin Decoder_1 Reg1[1] -pin ID_EX_1 RegReadInput1[1] -pin RegFile_1 ReadAddress1[1] -pin RiskChecker_1 IFID_R1[1]
load net EXMEM_regread1[1] -attr @rip(#000000) RegReadOutput1[1] -pin EX_MEM_1 RegReadOutput1[1] -pin MEM_WB_1 RegReadInput1[1]
load net controller_rst -pin Controller_1 rst -pin RiskChecker_1 ControlRst
netloc controller_rst 1 3 1 1660
load net flash_addr[17] -attr @rip(#000000) flash_addr[17] -pin Inst_MemoryTop flash_addr[17] -port flash_addr[17]
load net EXMEM_regresult[13] -attr @rip(#000000) RegResultOutput[13] -pin EX_MEM_1 RegResultOutput[13] -pin Inst_MemoryTop dataInput[13]
load net regfile_writedata[12] -attr @rip(#000000) Output[12] -pin Mux_alusrc1 Input2[12] -pin Mux_alusrc2 Input2[12] -pin Mux_regsultsrc Input2[12] -pin Mux_wb Output[12] -pin RegFile_1 WriteData[12]
load net IDEX_regread1[3] -attr @rip(#000000) RegReadOutput1[3] -pin EX_MEM_1 RegReadInput1[3] -pin ID_EX_1 RegReadOutput1[3] -pin Passer_1 IDEX_R1[3]
load net pcreg_output[1] -attr @rip(#000000) 1 -pin Inst_MemoryTop address1[1]
load net regfile_reg2[14] -attr @rip(#000000) Reg2[14] -pin ID_EX_1 DataInput2[14] -pin RegFile_1 Reg2[14]
load net pc_add4[1] -attr @rip(#000000) 1 -pin Mux_PC Input1[1]
load net decoder_imm[14] -attr @rip(#000000) Imm[14] -pin Decoder_1 Imm[14] -pin ID_EX_1 ImmediateInput[14]
load net flash_addr[7] -attr @rip(#000000) flash_addr[7] -pin Inst_MemoryTop flash_addr[7] -port flash_addr[7]
load net IFID_inst_out[1] -attr @rip(#000000) 1 -pin Decoder_1 Instruction[1]
load net KEY16_INPUT[4] -attr @rip(#000000) KEY16_INPUT[4] -pin GND_6_o_KEY16_INPUT[4]_equal_1 b[0] -port KEY16_INPUT[4]
load net decoder_imm[1] -attr @rip(#000000) Imm[1] -pin Decoder_1 Imm[1] -pin ID_EX_1 ImmediateInput[1]
load net EXMEM_data[1] -attr @rip(#000000) DataOutput[1] -pin EX_MEM_1 DataOutput[1] -pin Inst_MemoryTop address2[1] -pin MEM_WB_1 AluResultInput[1] -pin Mux_BEQZ Input3[1] -pin Mux_alusrc1 Input3[1] -pin Mux_alusrc2 Input3[1] -pin Mux_regsultsrc Input3[1]
load net IDEX_aludata2[14] -attr @rip(#000000) ALUdata2[14] -pin ID_EX_1 ALUdata2[14] -pin Mux_alusrc2 Input1[14]
load net EXMEM_data[13] -attr @rip(#000000) DataOutput[13] -pin EX_MEM_1 DataOutput[13] -pin Inst_MemoryTop address2[13] -pin MEM_WB_1 AluResultInput[13] -pin Mux_BEQZ Input3[13] -pin Mux_alusrc1 Input3[13] -pin Mux_alusrc2 Input3[13] -pin Mux_regsultsrc Input3[13]
load net regfile_reg1[15] -attr @rip(#000000) Reg1[15] -pin ID_EX_1 DataInput1[15] -pin Mux_BEQZ Input1[15] -pin Mux_PC Input3[15] -pin RegFile_1 Reg1[15]
load net Ram2Addr[1] -attr @rip(#000000) memoryAddress[1] -pin Inst_MemoryTop memoryAddress[1] -port Ram2Addr[1]
load net vgawaddr[7] -attr @rip(#000000) VGA_addr[7] -pin Inst_MemoryTop VGA_addr[7] -pin Inst_VGA_play waddr[7]
load net pc_imm[4] -attr @rip(#000000) 4 -pin Mux_PC Input2[4]
load net vga_reg1[14] -attr @rip(#000000) vga_reg1[14] -pin RegFile_1 vga_reg1[14]
load net LED_output[11] -attr @rip(#000000) LED_output[11] -port LED_output[11] -pin RegFile_1 LED_output[11]
load net MEMWB_regwriteto[3] -attr @rip(#000000) RegWriteToOutput[3] -pin MEM_WB_1 RegWriteToOutput[3] -pin Passer_1 MEMWB_W[3] -pin RegFile_1 WriteAddress[3]
load net IDEX_aludata1[15] -attr @rip(#000000) ALUdata1[15] -pin ID_EX_1 ALUdata1[15] -pin Mux_alusrc1 Input1[15]
load net EXMEM_regresult[4] -attr @rip(#000000) RegResultOutput[4] -pin EX_MEM_1 RegResultOutput[4] -pin Inst_MemoryTop dataInput[4]
load net forwardB[0] -attr @rip(#000000) ForwardB[0] -pin Mux_alusrc2 choice[0] -pin Passer_1 ForwardB[0]
load net vga_reg1[3] -attr @rip(#000000) vga_reg1[3] -pin RegFile_1 vga_reg1[3]
load net pc_imm[13] -attr @rip(#000000) 13 -pin Mux_PC Input2[13]
load net IFID_pc_out[0] -attr @rip(#000000) 0 -pin RegFile_1 PCinput[0]
load net pcreg_input[5] -attr @rip(#000000) Output[5] -pin Mux_PC Output[5]
load net regfile_reg1[6] -attr @rip(#000000) Reg1[6] -pin ID_EX_1 DataInput1[6] -pin Mux_BEQZ Input1[6] -pin Mux_PC Input3[6] -pin RegFile_1 Reg1[6]
load net IDEX_aludata2[7] -attr @rip(#000000) ALUdata2[7] -pin ID_EX_1 ALUdata2[7] -pin Mux_alusrc2 Input1[7]
load net alu_input1[9] -attr @rip(#000000) Output[9] -pin ALU_1 Input1[9] -pin Mux_alusrc1 Output[9]
load net EXMEM_regresultinput[8] -attr @rip(#000000) Output[8] -pin EX_MEM_1 RegResultInput[8] -pin Mux_regsultsrc Output[8]
load net Ram2Addr[17] -attr @rip(#000000) memoryAddress[17] -pin Inst_MemoryTop memoryAddress[17] -port Ram2Addr[17]
load net R[0] -attr @rip(#000000) R[0] -pin Inst_VGA_play R[0] -port R[0]
load net pcreg_output[13] -attr @rip(#000000) 13 -pin Inst_MemoryTop address1[13]
load net BranchReg[3] -attr @rip(#000000) Output[3] -pin BranchSelector_1 RegInput[3] -pin Mux_BEQZ Output[3]
load net IDEX_regresult[1] -attr @rip(#000000) RegResult[1] -pin ID_EX_1 RegResult[1] -pin Mux_regsultsrc Input1[1]
load net MEMWB_memresult[4] -attr @rip(#000000) MemResultOutput[4] -pin MEM_WB_1 MemResultOutput[4] -pin Mux_wb Input2[4]
load net IDEX_aludata1[3] -attr @rip(#000000) ALUdata1[3] -pin ID_EX_1 ALUdata1[3] -pin Mux_alusrc1 Input1[3]
load net MEMWB_regread1[1] -attr @rip(#000000) RegReadOutput1[1] -pin MEM_WB_1 RegReadOutput1[1]
load net instmem_data[2] -attr @rip(#000000) output1[2] -pin Inst_MemoryTop output1[2]
load net flash_data[5] -attr @rip(#000000) flash_data[5] -pin Inst_MemoryTop flash_data[5] -port flash_data[5]
load net alu_input2[2] -attr @rip(#000000) Output[2] -pin ALU_1 Input2[2] -pin Mux_alusrc2 Output[2] -pin RegFile_1 debug[10]
load net IDEX_regresult[10] -attr @rip(#000000) RegResult[10] -pin ID_EX_1 RegResult[10] -pin Mux_regsultsrc Input1[10]
load net IDEX_memtoreg -pin EX_MEM_1 MemtoRegInput -pin ID_EX_1 MemtoRegOutput
netloc IDEX_memtoreg 1 5 2 N 290 3460
load net B[1] -attr @rip(#000000) B[1] -port B[1] -pin Inst_VGA_play B[1]
load net IFID_inst_out[14] -attr @rip(#000000) 14 -pin Decoder_1 Instruction[14]
load net regfile_writedata[6] -attr @rip(#000000) Output[6] -pin Mux_alusrc1 Input2[6] -pin Mux_alusrc2 Input2[6] -pin Mux_regsultsrc Input2[6] -pin Mux_wb Output[6] -pin RegFile_1 WriteData[6]
load net ledseg1[5] -attr @rip(#000000) output[5] -pin LED_right output[5] -port ledseg1[5]
load net alu_output[2] -attr @rip(#000000) Output[2] -pin ALU_1 Output[2] -pin EX_MEM_1 DataInput[2] -pin Mux_BEQZ Input2[2] -pin RegFile_1 debug[6] -pin TReg_1 Input[2]
load net pc_add4[15] -attr @rip(#000000) 15 -pin Mux_PC Input1[15]
load net DataMem_output[10] -attr @rip(#000000) output2[10] -pin Inst_MemoryTop output2[10] -pin MEM_WB_1 MemResultInput[10]
load net basicDatabus[4] -attr @rip(#000000) basicDatabus[4] -port basicDatabus[4]
load net vgawdata[5] -attr @rip(#000000) VGA_char[5] -pin Inst_MemoryTop VGA_char[5] -pin Inst_VGA_play wdata[5]
load net MEMWB_aluresult[2] -attr @rip(#000000) AluResultOutput[2] -pin MEM_WB_1 AluResultOutput[2] -pin Mux_wb Input1[2]
load net decoder_reg1[2] -attr @rip(#000000) Reg1[2] -pin Decoder_1 Reg1[2] -pin ID_EX_1 RegReadInput1[2] -pin RegFile_1 ReadAddress1[2] -pin RiskChecker_1 IFID_R1[2]
load net EXMEM_regread1[2] -attr @rip(#000000) RegReadOutput1[2] -pin EX_MEM_1 RegReadOutput1[2] -pin MEM_WB_1 RegReadInput1[2]
load net flash_addr[18] -attr @rip(#000000) flash_addr[18] -pin Inst_MemoryTop flash_addr[18] -port flash_addr[18]
load net EXMEM_regresult[14] -attr @rip(#000000) RegResultOutput[14] -pin EX_MEM_1 RegResultOutput[14] -pin Inst_MemoryTop dataInput[14]
load net LED_output[0] -attr @rip(#000000) LED_output[0] -port LED_output[0] -pin RegFile_1 LED_output[0]
load net alu_output[10] -attr @rip(#000000) Output[10] -pin ALU_1 Output[10] -pin EX_MEM_1 DataInput[10] -pin Mux_BEQZ Input2[10] -pin TReg_1 Input[10]
load net clk -port clk -pin clk1_clk_MUX_729 a1
netloc clk 1 0 7 N 1660 N 1660 N 1660 N 1660 N 1660 N 1660 3440
load net keyb_data[0] -attr @rip(#000000) out_char[0] -pin Inst_MemoryTop Keyboard_Data[0] -pin LED_right input[0] -pin board out_char[0]
load net pcreg_output[2] -attr @rip(#000000) 2 -pin Inst_MemoryTop address1[2]
load net pc_add4[2] -attr @rip(#000000) 2 -pin Mux_PC Input1[2]
load net regfile_writedata[13] -attr @rip(#000000) Output[13] -pin Mux_alusrc1 Input2[13] -pin Mux_alusrc2 Input2[13] -pin Mux_regsultsrc Input2[13] -pin Mux_wb Output[13] -pin RegFile_1 WriteData[13]
load net serialTBRE -pin Inst_MemoryTop serial_tbre -port serialTBRE
netloc serialTBRE 1 0 8 N 1900 N 1900 N 1900 N 1900 N 1900 N 1900 N 1900 4020
load net regfile_reg2[15] -attr @rip(#000000) Reg2[15] -pin ID_EX_1 DataInput2[15] -pin RegFile_1 Reg2[15]
load net decoder_imm[15] -attr @rip(#000000) Imm[15] -pin Decoder_1 Imm[15] -pin ID_EX_1 ImmediateInput[15]
load net flash_addr[8] -attr @rip(#000000) flash_addr[8] -pin Inst_MemoryTop flash_addr[8] -port flash_addr[8]
load net IFID_inst_out[2] -attr @rip(#000000) 2 -pin Decoder_1 Instruction[2]
load net decoder_imm[2] -attr @rip(#000000) Imm[2] -pin Decoder_1 Imm[2] -pin ID_EX_1 ImmediateInput[2]
load net EXMEM_data[2] -attr @rip(#000000) DataOutput[2] -pin EX_MEM_1 DataOutput[2] -pin Inst_MemoryTop address2[2] -pin MEM_WB_1 AluResultInput[2] -pin Mux_BEQZ Input3[2] -pin Mux_alusrc1 Input3[2] -pin Mux_alusrc2 Input3[2] -pin Mux_regsultsrc Input3[2]
load net EXMEM_data[14] -attr @rip(#000000) DataOutput[14] -pin EX_MEM_1 DataOutput[14] -pin Inst_MemoryTop address2[14] -pin MEM_WB_1 AluResultInput[14] -pin Mux_BEQZ Input3[14] -pin Mux_alusrc1 Input3[14] -pin Mux_alusrc2 Input3[14] -pin Mux_regsultsrc Input3[14]
load net IDEX_aludata2[15] -attr @rip(#000000) ALUdata2[15] -pin ID_EX_1 ALUdata2[15] -pin Mux_alusrc2 Input1[15]
load net Ram2Addr[2] -attr @rip(#000000) memoryAddress[2] -pin Inst_MemoryTop memoryAddress[2] -port Ram2Addr[2]
load net vgawctrl[0] -attr @rip(#000000) VGA_write[0] -pin Inst_MemoryTop VGA_write[0] -pin Inst_VGA_play wctrl[0]
netloc vgawctrl[0] 1 8 1 4560
load net vgawaddr[8] -attr @rip(#000000) VGA_addr[8] -pin Inst_MemoryTop VGA_addr[8] -pin Inst_VGA_play waddr[8]
load net pc_imm[5] -attr @rip(#000000) 5 -pin Mux_PC Input2[5]
load net vga_reg1[15] -attr @rip(#000000) vga_reg1[15] -pin RegFile_1 vga_reg1[15]
load net G[0] -attr @rip(#000000) G[0] -port G[0] -pin Inst_VGA_play G[0]
load net LED_output[12] -attr @rip(#000000) LED_output[12] -port LED_output[12] -pin RegFile_1 LED_output[12]
load net EXMEM_regresult[5] -attr @rip(#000000) RegResultOutput[5] -pin EX_MEM_1 RegResultOutput[5] -pin Inst_MemoryTop dataInput[5]
load net forwardB[1] -attr @rip(#000000) ForwardB[1] -pin Mux_alusrc2 choice[1] -pin Passer_1 ForwardB[1]
load net vga_reg1[4] -attr @rip(#000000) vga_reg1[4] -pin RegFile_1 vga_reg1[4]
load net pc_imm[14] -attr @rip(#000000) 14 -pin Mux_PC Input2[14]
load net IFID_pc_out[1] -attr @rip(#000000) 1 -pin RegFile_1 PCinput[1]
load net pcreg_input[6] -attr @rip(#000000) Output[6] -pin Mux_PC Output[6]
load net regfile_reg1[7] -attr @rip(#000000) Reg1[7] -pin ID_EX_1 DataInput1[7] -pin Mux_BEQZ Input1[7] -pin Mux_PC Input3[7] -pin RegFile_1 Reg1[7]
load net IDEX_aludata2[8] -attr @rip(#000000) ALUdata2[8] -pin ID_EX_1 ALUdata2[8] -pin Mux_alusrc2 Input1[8]
load net EXMEM_regresultinput[9] -attr @rip(#000000) Output[9] -pin EX_MEM_1 RegResultInput[9] -pin Mux_regsultsrc Output[9]
load net R[1] -attr @rip(#000000) R[1] -pin Inst_VGA_play R[1] -port R[1]
load net DataMem_output[0] -attr @rip(#000000) output2[0] -pin Inst_MemoryTop output2[0] -pin MEM_WB_1 MemResultInput[0]
load net pcreg_output[14] -attr @rip(#000000) 14 -pin Inst_MemoryTop address1[14]
load net BranchReg[4] -attr @rip(#000000) Output[4] -pin BranchSelector_1 RegInput[4] -pin Mux_BEQZ Output[4]
load net EXMEM_ret -pin EX_MEM_1 retoutput -pin MEM_WB_1 retinput
netloc EXMEM_ret 1 0 8 300 1400 800 1260 N 1260 N 1260 N 1260 N 1260 N 1260 3900
load net serialTSRE -pin Inst_MemoryTop serial_tsre -port serialTSRE
netloc serialTSRE 1 0 8 N 1920 N 1920 N 1920 N 1920 N 1920 N 1920 N 1920 4080
load net flash_rp -pin Inst_MemoryTop flash_rp -port flash_rp
netloc flash_rp 1 8 2 N 1620 N
load net IDEX_regresult[2] -attr @rip(#000000) RegResult[2] -pin ID_EX_1 RegResult[2] -pin Mux_regsultsrc Input1[2]
load net regfile_reg2[0] -attr @rip(#000000) Reg2[0] -pin ID_EX_1 DataInput2[0] -pin RegFile_1 Reg2[0]
load net MEMWB_memresult[5] -attr @rip(#000000) MemResultOutput[5] -pin MEM_WB_1 MemResultOutput[5] -pin Mux_wb Input2[5]
load net IDEX_aludata1[4] -attr @rip(#000000) ALUdata1[4] -pin ID_EX_1 ALUdata1[4] -pin Mux_alusrc1 Input1[4]
load net MEMWB_regread1[2] -attr @rip(#000000) RegReadOutput1[2] -pin MEM_WB_1 RegReadOutput1[2]
load net instmem_data[3] -attr @rip(#000000) output1[3] -pin Inst_MemoryTop output1[3]
load net flash_data[6] -attr @rip(#000000) flash_data[6] -pin Inst_MemoryTop flash_data[6] -port flash_data[6]
load net B[2] -attr @rip(#000000) B[2] -port B[2] -pin Inst_VGA_play B[2]
load net alu_input2[3] -attr @rip(#000000) Output[3] -pin ALU_1 Input2[3] -pin Mux_alusrc2 Output[3] -pin RegFile_1 debug[11]
load net IDEX_regresult[11] -attr @rip(#000000) RegResult[11] -pin ID_EX_1 RegResult[11] -pin Mux_regsultsrc Input1[11]
load net IFID_inst_out[15] -attr @rip(#000000) 15 -pin Decoder_1 Instruction[15]
load net regfile_writedata[7] -attr @rip(#000000) Output[7] -pin Mux_alusrc1 Input2[7] -pin Mux_alusrc2 Input2[7] -pin Mux_regsultsrc Input2[7] -pin Mux_wb Output[7] -pin RegFile_1 WriteData[7]
load net ledseg1[6] -attr @rip(#000000) output[6] -pin LED_right output[6] -port ledseg1[6]
load net alu_output[3] -attr @rip(#000000) Output[3] -pin ALU_1 Output[3] -pin EX_MEM_1 DataInput[3] -pin Mux_BEQZ Input2[3] -pin RegFile_1 debug[7] -pin TReg_1 Input[3]
load net DataMem_output[11] -attr @rip(#000000) output2[11] -pin Inst_MemoryTop output2[11] -pin MEM_WB_1 MemResultInput[11]
load net Ram2Data[0] -attr @rip(#000000) extendDatabus[0] -pin Inst_MemoryTop extendDatabus[0] -port Ram2Data[0]
load net basicDatabus[5] -attr @rip(#000000) basicDatabus[5] -port basicDatabus[5]
load net vgawdata[6] -attr @rip(#000000) VGA_char[6] -pin Inst_MemoryTop VGA_char[6] -pin Inst_VGA_play wdata[6]
load net MEMWB_aluresult[3] -attr @rip(#000000) AluResultOutput[3] -pin MEM_WB_1 AluResultOutput[3] -pin Mux_wb Input1[3]
load net decoder_reg3[0] -attr @rip(#000000) Reg3[0] -pin Decoder_1 Reg3[0] -pin ID_EX_1 RegWriteToInput[0]
load net decoder_reg1[3] -attr @rip(#000000) Reg1[3] -pin Decoder_1 Reg1[3] -pin ID_EX_1 RegReadInput1[3] -pin RegFile_1 ReadAddress1[3] -pin RiskChecker_1 IFID_R1[3]
load net EXMEM_regread1[3] -attr @rip(#000000) RegReadOutput1[3] -pin EX_MEM_1 RegReadOutput1[3] -pin MEM_WB_1 RegReadInput1[3]
load net Vs -pin Inst_VGA_play Vs -port Vs
netloc Vs 1 9 1 N
load net MEMWB_memresult[10] -attr @rip(#000000) MemResultOutput[10] -pin MEM_WB_1 MemResultOutput[10] -pin Mux_wb Input2[10]
load net MEMWB_memtoreg -pin MEM_WB_1 MemtoRegOutput -pin Mux_wb choice
netloc MEMWB_memtoreg 1 1 1 680
load net EXMEM_regresult[15] -attr @rip(#000000) RegResultOutput[15] -pin EX_MEM_1 RegResultOutput[15] -pin Inst_MemoryTop dataInput[15]
load net flash_addr[19] -attr @rip(#000000) flash_addr[19] -pin Inst_MemoryTop flash_addr[19] -port flash_addr[19]
load net LED_output[1] -attr @rip(#000000) LED_output[1] -port LED_output[1] -pin RegFile_1 LED_output[1]
load net alu_output[11] -attr @rip(#000000) Output[11] -pin ALU_1 Output[11] -pin EX_MEM_1 DataInput[11] -pin Mux_BEQZ Input2[11] -pin TReg_1 Input[11]
load net MEMWB_aluresult[10] -attr @rip(#000000) AluResultOutput[10] -pin MEM_WB_1 AluResultOutput[10] -pin Mux_wb Input1[10]
load net GND_6_o_KEY16_INPUT[4]_equal_1_o -pin GND_6_o_KEY16_INPUT[4]_equal_1 o -pin clk1_clk_MUX_729 c
netloc GND_6_o_KEY16_INPUT[4]_equal_1_o 1 6 1 3400
load net keyb_data[1] -attr @rip(#000000) out_char[1] -pin Inst_MemoryTop Keyboard_Data[1] -pin LED_right input[1] -pin board out_char[1]
load net pcreg_output[3] -attr @rip(#000000) 3 -pin Inst_MemoryTop address1[3]
load net regfile_writedata[14] -attr @rip(#000000) Output[14] -pin Mux_alusrc1 Input2[14] -pin Mux_alusrc2 Input2[14] -pin Mux_regsultsrc Input2[14] -pin Mux_wb Output[14] -pin RegFile_1 WriteData[14]
load net pc_add4[3] -attr @rip(#000000) 3 -pin Mux_PC Input1[3]
load net flash_addr[9] -attr @rip(#000000) flash_addr[9] -pin Inst_MemoryTop flash_addr[9] -port flash_addr[9]
load net IFID_inst_out[3] -attr @rip(#000000) 3 -pin Decoder_1 Instruction[3]
load net decoder_imm[3] -attr @rip(#000000) Imm[3] -pin Decoder_1 Imm[3] -pin ID_EX_1 ImmediateInput[3]
load net EXMEM_data[3] -attr @rip(#000000) DataOutput[3] -pin EX_MEM_1 DataOutput[3] -pin Inst_MemoryTop address2[3] -pin MEM_WB_1 AluResultInput[3] -pin Mux_BEQZ Input3[3] -pin Mux_alusrc1 Input3[3] -pin Mux_alusrc2 Input3[3] -pin Mux_regsultsrc Input3[3]
load net EXMEM_data[15] -attr @rip(#000000) DataOutput[15] -pin EX_MEM_1 DataOutput[15] -pin Inst_MemoryTop address2[15] -pin MEM_WB_1 AluResultInput[15] -pin Mux_BEQZ Input3[15] -pin Mux_alusrc1 Input3[15] -pin Mux_alusrc2 Input3[15] -pin Mux_regsultsrc Input3[15]
load net Ram2Addr[3] -attr @rip(#000000) memoryAddress[3] -pin Inst_MemoryTop memoryAddress[3] -port Ram2Addr[3]
load net vgawaddr[9] -attr @rip(#000000) VGA_addr[9] -pin Inst_MemoryTop VGA_addr[9] -pin Inst_VGA_play waddr[9]
load net pc_imm[6] -attr @rip(#000000) 6 -pin Mux_PC Input2[6]
load net G[1] -attr @rip(#000000) G[1] -port G[1] -pin Inst_VGA_play G[1]
load net LED_output[13] -attr @rip(#000000) LED_output[13] -port LED_output[13] -pin RegFile_1 LED_output[13]
load net EXMEM_regresult[6] -attr @rip(#000000) RegResultOutput[6] -pin EX_MEM_1 RegResultOutput[6] -pin Inst_MemoryTop dataInput[6]
load net vga_reg1[5] -attr @rip(#000000) vga_reg1[5] -pin RegFile_1 vga_reg1[5]
load net pc_imm[15] -attr @rip(#000000) 15 -pin Mux_PC Input2[15]
load net IFID_pc_out[2] -attr @rip(#000000) 2 -pin RegFile_1 PCinput[2]
load net pcreg_input[7] -attr @rip(#000000) Output[7] -pin Mux_PC Output[7]
load net IDEX_aludata2[9] -attr @rip(#000000) ALUdata2[9] -pin ID_EX_1 ALUdata2[9] -pin Mux_alusrc2 Input1[9]
load net regfile_reg1[8] -attr @rip(#000000) Reg1[8] -pin ID_EX_1 DataInput1[8] -pin Mux_BEQZ Input1[8] -pin Mux_PC Input3[8] -pin RegFile_1 Reg1[8]
load net flash_vpen -pin Inst_MemoryTop flash_vpen -port flash_vpen
netloc flash_vpen 1 8 2 N 1640 N
load net R[2] -attr @rip(#000000) R[2] -pin Inst_VGA_play R[2] -port R[2]
load net DataMem_output[1] -attr @rip(#000000) output2[1] -pin Inst_MemoryTop output2[1] -pin MEM_WB_1 MemResultInput[1]
load net pcreg_output[15] -attr @rip(#000000) 15 -pin Inst_MemoryTop address1[15]
load net BranchReg[5] -attr @rip(#000000) Output[5] -pin BranchSelector_1 RegInput[5] -pin Mux_BEQZ Output[5]
load net DATAREADY -port DATAREADY -pin Inst_MemoryTop serial_dataready
netloc DATAREADY 1 0 8 N 1780 N 1780 N 1780 N 1780 N 1780 N 1780 N 1780 3960
load net IDEX_regresult[3] -attr @rip(#000000) RegResult[3] -pin ID_EX_1 RegResult[3] -pin Mux_regsultsrc Input1[3]
load net regfile_reg2[1] -attr @rip(#000000) Reg2[1] -pin ID_EX_1 DataInput2[1] -pin RegFile_1 Reg2[1]
load net MEMWB_memresult[6] -attr @rip(#000000) MemResultOutput[6] -pin MEM_WB_1 MemResultOutput[6] -pin Mux_wb Input2[6]
load net IDEX_aludata1[5] -attr @rip(#000000) ALUdata1[5] -pin ID_EX_1 ALUdata1[5] -pin Mux_alusrc1 Input1[5]
load net MEMWB_regread1[3] -attr @rip(#000000) RegReadOutput1[3] -pin MEM_WB_1 RegReadOutput1[3]
load net instmem_data[4] -attr @rip(#000000) output1[4] -pin Inst_MemoryTop output1[4]
load net flash_data[7] -attr @rip(#000000) flash_data[7] -pin Inst_MemoryTop flash_data[7] -port flash_data[7]
load net alu_input2[4] -attr @rip(#000000) Output[4] -pin ALU_1 Input2[4] -pin Mux_alusrc2 Output[4]
load net IDEX_regresult[12] -attr @rip(#000000) RegResult[12] -pin ID_EX_1 RegResult[12] -pin Mux_regsultsrc Input1[12]
load net regfile_writedata[8] -attr @rip(#000000) Output[8] -pin Mux_alusrc1 Input2[8] -pin Mux_alusrc2 Input2[8] -pin Mux_regsultsrc Input2[8] -pin Mux_wb Output[8] -pin RegFile_1 WriteData[8]
load net Ram1OE -power -pin EX_MEM_1 WriteIn -pin ID_EX_1 WriteIn -pin MEM_WB_1 WriteIn -port Ram1OE -port Ram1WE
load net alu_output[4] -attr @rip(#000000) Output[4] -pin ALU_1 Output[4] -pin EX_MEM_1 DataInput[4] -pin Mux_BEQZ Input2[4] -pin TReg_1 Input[4]
load net DataMem_output[12] -attr @rip(#000000) output2[12] -pin Inst_MemoryTop output2[12] -pin MEM_WB_1 MemResultInput[12]
load net Ram2Data[1] -attr @rip(#000000) extendDatabus[1] -pin Inst_MemoryTop extendDatabus[1] -port Ram2Data[1]
load net basicDatabus[6] -attr @rip(#000000) basicDatabus[6] -port basicDatabus[6]
load net vgawdata[7] -attr @rip(#000000) VGA_char[7] -pin Inst_MemoryTop VGA_char[7] -pin Inst_VGA_play wdata[7]
load net MEMWB_aluresult[4] -attr @rip(#000000) AluResultOutput[4] -pin MEM_WB_1 AluResultOutput[4] -pin Mux_wb Input1[4]
load net decoder_reg3[1] -attr @rip(#000000) Reg3[1] -pin Decoder_1 Reg3[1] -pin ID_EX_1 RegWriteToInput[1]
load net alu_input1[0] -attr @rip(#000000) Output[0] -pin ALU_1 Input1[0] -pin Mux_alusrc1 Output[0] -pin RegFile_1 debug[12]
load net ledseg2[0] -attr @rip(#000000) output[0] -pin LED_left output[0] -port ledseg2[0]
load net flash_data[10] -attr @rip(#000000) flash_data[10] -pin Inst_MemoryTop flash_data[10] -port flash_data[10]
load net MEMWB_memresult[11] -attr @rip(#000000) MemResultOutput[11] -pin MEM_WB_1 MemResultOutput[11] -pin Mux_wb Input2[11]
load net LED_output[2] -attr @rip(#000000) LED_output[2] -port LED_output[2] -pin RegFile_1 LED_output[2]
load net alu_output[12] -attr @rip(#000000) Output[12] -pin ALU_1 Output[12] -pin EX_MEM_1 DataInput[12] -pin Mux_BEQZ Input2[12] -pin TReg_1 Input[12]
load net MEMWB_aluresult[11] -attr @rip(#000000) AluResultOutput[11] -pin MEM_WB_1 AluResultOutput[11] -pin Mux_wb Input1[11]
load net keyb_data[2] -attr @rip(#000000) out_char[2] -pin Inst_MemoryTop Keyboard_Data[2] -pin LED_right input[2] -pin board out_char[2]
load net pcreg_output[4] -attr @rip(#000000) 4 -pin Inst_MemoryTop address1[4]
load net pc_add4[4] -attr @rip(#000000) 4 -pin Mux_PC Input1[4]
load net regfile_writedata[15] -attr @rip(#000000) Output[15] -pin Mux_alusrc1 Input2[15] -pin Mux_alusrc2 Input2[15] -pin Mux_regsultsrc Input2[15] -pin Mux_wb Output[15] -pin RegFile_1 WriteData[15]
load net IFID_inst_out[4] -attr @rip(#000000) 4 -pin Decoder_1 Instruction[4]
load net decoder_imm[4] -attr @rip(#000000) Imm[4] -pin Decoder_1 Imm[4] -pin ID_EX_1 ImmediateInput[4]
load net EXMEM_data[4] -attr @rip(#000000) DataOutput[4] -pin EX_MEM_1 DataOutput[4] -pin Inst_MemoryTop address2[4] -pin MEM_WB_1 AluResultInput[4] -pin Mux_BEQZ Input3[4] -pin Mux_alusrc1 Input3[4] -pin Mux_alusrc2 Input3[4] -pin Mux_regsultsrc Input3[4]
load net Ram2Addr[4] -attr @rip(#000000) memoryAddress[4] -pin Inst_MemoryTop memoryAddress[4] -port Ram2Addr[4]
load net pc_imm[7] -attr @rip(#000000) 7 -pin Mux_PC Input2[7]
load net G[2] -attr @rip(#000000) G[2] -port G[2] -pin Inst_VGA_play G[2]
load net LED_output[14] -attr @rip(#000000) LED_output[14] -port LED_output[14] -pin RegFile_1 LED_output[14]
load net EXMEM_regresult[7] -attr @rip(#000000) RegResultOutput[7] -pin EX_MEM_1 RegResultOutput[7] -pin Inst_MemoryTop dataInput[7]
load net vga_reg1[6] -attr @rip(#000000) vga_reg1[6] -pin RegFile_1 vga_reg1[6]
load net IFID_pc_out[3] -attr @rip(#000000) 3 -pin RegFile_1 PCinput[3]
load net alusrc -pin Controller_1 ALUsrc -pin ID_EX_1 ALUsrcInput
netloc alusrc 1 4 1 2220
load net Ram2Data[10] -attr @rip(#000000) extendDatabus[10] -pin Inst_MemoryTop extendDatabus[10] -port Ram2Data[10]
load net pcreg_input[8] -attr @rip(#000000) Output[8] -pin Mux_PC Output[8]
load net regfile_reg1[9] -attr @rip(#000000) Reg1[9] -pin ID_EX_1 DataInput1[9] -pin Mux_BEQZ Input1[9] -pin Mux_PC Input3[9] -pin RegFile_1 Reg1[9]
load net DataMem_output[2] -attr @rip(#000000) output2[2] -pin Inst_MemoryTop output2[2] -pin MEM_WB_1 MemResultInput[2]
load net BranchReg[6] -attr @rip(#000000) Output[6] -pin BranchSelector_1 RegInput[6] -pin Mux_BEQZ Output[6]
load net IDEX_regresult[4] -attr @rip(#000000) RegResult[4] -pin ID_EX_1 RegResult[4] -pin Mux_regsultsrc Input1[4]
load net regfile_reg2[2] -attr @rip(#000000) Reg2[2] -pin ID_EX_1 DataInput2[2] -pin RegFile_1 Reg2[2]
load net MEMWB_memresult[7] -attr @rip(#000000) MemResultOutput[7] -pin MEM_WB_1 MemResultOutput[7] -pin Mux_wb Input2[7]
load net IDEX_aludata1[6] -attr @rip(#000000) ALUdata1[6] -pin ID_EX_1 ALUdata1[6] -pin Mux_alusrc1 Input1[6]
load net instmem_data[5] -attr @rip(#000000) output1[5] -pin Inst_MemoryTop output1[5]
load net flash_data[8] -attr @rip(#000000) flash_data[8] -pin Inst_MemoryTop flash_data[8] -port flash_data[8]
load net IDEX_regresult[13] -attr @rip(#000000) RegResult[13] -pin ID_EX_1 RegResult[13] -pin Mux_regsultsrc Input1[13]
load net alu_input2[5] -attr @rip(#000000) Output[5] -pin ALU_1 Input2[5] -pin Mux_alusrc2 Output[5]
load net regfile_writedata[9] -attr @rip(#000000) Output[9] -pin Mux_alusrc1 Input2[9] -pin Mux_alusrc2 Input2[9] -pin Mux_regsultsrc Input2[9] -pin Mux_wb Output[9] -pin RegFile_1 WriteData[9]
load net alu_output[5] -attr @rip(#000000) Output[5] -pin ALU_1 Output[5] -pin EX_MEM_1 DataInput[5] -pin Mux_BEQZ Input2[5] -pin TReg_1 Input[5]
load net DataMem_output[13] -attr @rip(#000000) output2[13] -pin Inst_MemoryTop output2[13] -pin MEM_WB_1 MemResultInput[13]
load net Ram2Data[2] -attr @rip(#000000) extendDatabus[2] -pin Inst_MemoryTop extendDatabus[2] -port Ram2Data[2]
load net basicDatabus[7] -attr @rip(#000000) basicDatabus[7] -port basicDatabus[7]
load net MEMWB_aluresult[5] -attr @rip(#000000) AluResultOutput[5] -pin MEM_WB_1 AluResultOutput[5] -pin Mux_wb Input1[5]
load net Ram1Data[0] -attr @rip(#000000) basicdatabus[0] -pin Inst_MemoryTop basicdatabus[0] -port Ram1Data[0]
load net decoder_reg3[2] -attr @rip(#000000) Reg3[2] -pin Decoder_1 Reg3[2] -pin ID_EX_1 RegWriteToInput[2]
load net alu_input1[1] -attr @rip(#000000) Output[1] -pin ALU_1 Input1[1] -pin Mux_alusrc1 Output[1] -pin RegFile_1 debug[13]
load net EXMEM_regresultinput[0] -attr @rip(#000000) Output[0] -pin EX_MEM_1 RegResultInput[0] -pin Mux_regsultsrc Output[0]
load net ledseg2[1] -attr @rip(#000000) output[1] -pin LED_left output[1] -port ledseg2[1]
load net flash_data[11] -attr @rip(#000000) flash_data[11] -pin Inst_MemoryTop flash_data[11] -port flash_data[11]
load net MEMWB_memresult[12] -attr @rip(#000000) MemResultOutput[12] -pin MEM_WB_1 MemResultOutput[12] -pin Mux_wb Input2[12]
load net EXMEM_regresultinput[10] -attr @rip(#000000) Output[10] -pin EX_MEM_1 RegResultInput[10] -pin Mux_regsultsrc Output[10]
load net LED_output[3] -attr @rip(#000000) LED_output[3] -port LED_output[3] -pin RegFile_1 LED_output[3]
load net alu_output[13] -attr @rip(#000000) Output[13] -pin ALU_1 Output[13] -pin EX_MEM_1 DataInput[13] -pin Mux_BEQZ Input2[13] -pin TReg_1 Input[13]
load net MEMWB_aluresult[12] -attr @rip(#000000) AluResultOutput[12] -pin MEM_WB_1 AluResultOutput[12] -pin Mux_wb Input1[12]
load net Ram2WE -pin Inst_MemoryTop memoryRW -port Ram2WE
netloc Ram2WE 1 8 2 N 1740 N
load net keyb_data[3] -attr @rip(#000000) out_char[3] -pin Inst_MemoryTop Keyboard_Data[3] -pin LED_right input[3] -pin board out_char[3]
load net pcreg_output[5] -attr @rip(#000000) 5 -pin Inst_MemoryTop address1[5]
load net pc_add4[5] -attr @rip(#000000) 5 -pin Mux_PC Input1[5]
load net IDEX_alusrc -pin ID_EX_1 ALUsrcOutput -pin Passer_1 IDEX_alusrc
netloc IDEX_alusrc 1 1 5 740 190 N 190 N 190 2160 80 2820
load net alu_input1[10] -attr @rip(#000000) Output[10] -pin ALU_1 Input1[10] -pin Mux_alusrc1 Output[10]
load net IFID_inst_out[5] -attr @rip(#000000) 5 -pin Decoder_1 Instruction[5]
load net IDEX_regread2[0] -attr @rip(#000000) RegReadOutput2[0] -pin EX_MEM_1 RegReadInput2[0] -pin ID_EX_1 RegReadOutput2[0] -pin Passer_1 IDEX_R2[0]
load net decoder_imm[5] -attr @rip(#000000) Imm[5] -pin Decoder_1 Imm[5] -pin ID_EX_1 ImmediateInput[5]
load net EXMEM_data[5] -attr @rip(#000000) DataOutput[5] -pin EX_MEM_1 DataOutput[5] -pin Inst_MemoryTop address2[5] -pin MEM_WB_1 AluResultInput[5] -pin Mux_BEQZ Input3[5] -pin Mux_alusrc1 Input3[5] -pin Mux_alusrc2 Input3[5] -pin Mux_regsultsrc Input3[5]
load net Ram2Addr[5] -attr @rip(#000000) memoryAddress[5] -pin Inst_MemoryTop memoryAddress[5] -port Ram2Addr[5]
load net pc_imm[8] -attr @rip(#000000) 8 -pin Mux_PC Input2[8]
load net flash_addr[10] -attr @rip(#000000) flash_addr[10] -pin Inst_MemoryTop flash_addr[10] -port flash_addr[10]
load net LED_output[15] -attr @rip(#000000) LED_output[15] -port LED_output[15] -pin RegFile_1 LED_output[15]
load net EXMEM_regresult[8] -attr @rip(#000000) RegResultOutput[8] -pin EX_MEM_1 RegResultOutput[8] -pin Inst_MemoryTop dataInput[8]
load net vga_reg1[7] -attr @rip(#000000) vga_reg1[7] -pin RegFile_1 vga_reg1[7]
load net IFID_pc_out[4] -attr @rip(#000000) 4 -pin RegFile_1 PCinput[4]
load net Ram2Data[11] -attr @rip(#000000) extendDatabus[11] -pin Inst_MemoryTop extendDatabus[11] -port Ram2Data[11]
load net pcreg_input[9] -attr @rip(#000000) Output[9] -pin Mux_PC Output[9]
load net DataMem_output[3] -attr @rip(#000000) output2[3] -pin Inst_MemoryTop output2[3] -pin MEM_WB_1 MemResultInput[3]
load net IDEX_ret -pin EX_MEM_1 retinput -pin ID_EX_1 retoutput
netloc IDEX_ret 1 5 2 3020 770 N
load net BranchReg[7] -attr @rip(#000000) Output[7] -pin BranchSelector_1 RegInput[7] -pin Mux_BEQZ Output[7]
load net Ram1EN -pin Inst_MemoryTop ram1_en -port Ram1EN
netloc Ram1EN 1 8 2 N 1800 N
load net forwardA[0] -attr @rip(#000000) ForwardA[0] -pin Mux_alusrc1 choice[0] -pin Passer_1 ForwardA[0]
load net IDEX_regresult[5] -attr @rip(#000000) RegResult[5] -pin ID_EX_1 RegResult[5] -pin Mux_regsultsrc Input1[5]
load net regfile_reg2[3] -attr @rip(#000000) Reg2[3] -pin ID_EX_1 DataInput2[3] -pin RegFile_1 Reg2[3]
load net vgawaddr[0] -attr @rip(#000000) VGA_addr[0] -pin Inst_MemoryTop VGA_addr[0] -pin Inst_VGA_play waddr[0]
load net IDEX_aludata1[7] -attr @rip(#000000) ALUdata1[7] -pin ID_EX_1 ALUdata1[7] -pin Mux_alusrc1 Input1[7]
load net instmem_data[6] -attr @rip(#000000) output1[6] -pin Inst_MemoryTop output1[6]
load net flash_data[9] -attr @rip(#000000) flash_data[9] -pin Inst_MemoryTop flash_data[9] -port flash_data[9]
load net BranchReg[10] -attr @rip(#000000) Output[10] -pin BranchSelector_1 RegInput[10] -pin Mux_BEQZ Output[10]
load net alu_input2[6] -attr @rip(#000000) Output[6] -pin ALU_1 Input2[6] -pin Mux_alusrc2 Output[6]
load net MEMWB_memresult[8] -attr @rip(#000000) MemResultOutput[8] -pin MEM_WB_1 MemResultOutput[8] -pin Mux_wb Input2[8]
load net IDEX_regresult[14] -attr @rip(#000000) RegResult[14] -pin ID_EX_1 RegResult[14] -pin Mux_regsultsrc Input1[14]
load net alu_output[6] -attr @rip(#000000) Output[6] -pin ALU_1 Output[6] -pin EX_MEM_1 DataInput[6] -pin Mux_BEQZ Input2[6] -pin TReg_1 Input[6]
load net DataMem_output[14] -attr @rip(#000000) output2[14] -pin Inst_MemoryTop output2[14] -pin MEM_WB_1 MemResultInput[14]
load net Ram2Data[3] -attr @rip(#000000) extendDatabus[3] -pin Inst_MemoryTop extendDatabus[3] -port Ram2Data[3]
load net IDEX_aludata2[0] -attr @rip(#000000) ALUdata2[0] -pin ID_EX_1 ALUdata2[0] -pin Mux_alusrc2 Input1[0]
load net MEMWB_aluresult[6] -attr @rip(#000000) AluResultOutput[6] -pin MEM_WB_1 AluResultOutput[6] -pin Mux_wb Input1[6]
load net decoder_reg3[3] -attr @rip(#000000) Reg3[3] -pin Decoder_1 Reg3[3] -pin ID_EX_1 RegWriteToInput[3]
load net alu_input1[2] -attr @rip(#000000) Output[2] -pin ALU_1 Input1[2] -pin Mux_alusrc1 Output[2] -pin RegFile_1 debug[14]
load net EXMEM_regresultinput[1] -attr @rip(#000000) Output[1] -pin EX_MEM_1 RegResultInput[1] -pin Mux_regsultsrc Output[1]
load net Ram2Addr[10] -attr @rip(#000000) memoryAddress[10] -pin Inst_MemoryTop memoryAddress[10] -port Ram2Addr[10]
load net ledseg2[2] -attr @rip(#000000) output[2] -pin LED_left output[2] -port ledseg2[2]
load net IDEX_regwrite -pin EX_MEM_1 RegWriteInput -pin ID_EX_1 RegWriteOutput
netloc IDEX_regwrite 1 5 2 3060 690 N
load net Ram1Data[1] -attr @rip(#000000) basicdatabus[1] -pin Inst_MemoryTop basicdatabus[1] -port Ram1Data[1]
load net flash_data[12] -attr @rip(#000000) flash_data[12] -pin Inst_MemoryTop flash_data[12] -port flash_data[12]
load net MEMWB_memresult[13] -attr @rip(#000000) MemResultOutput[13] -pin MEM_WB_1 MemResultOutput[13] -pin Mux_wb Input2[13]
load net instmem_data[10] -attr @rip(#000000) output1[10] -pin Inst_MemoryTop output1[10]
load net EXMEM_regresultinput[11] -attr @rip(#000000) Output[11] -pin EX_MEM_1 RegResultInput[11] -pin Mux_regsultsrc Output[11]
load net LED_output[4] -attr @rip(#000000) LED_output[4] -port LED_output[4] -pin RegFile_1 LED_output[4]
load net alu_output[14] -attr @rip(#000000) Output[14] -pin ALU_1 Output[14] -pin EX_MEM_1 DataInput[14] -pin Mux_BEQZ Input2[14] -pin TReg_1 Input[14]
load net MEMWB_aluresult[13] -attr @rip(#000000) AluResultOutput[13] -pin MEM_WB_1 AluResultOutput[13] -pin Mux_wb Input1[13]
load net alu_input2[10] -attr @rip(#000000) Output[10] -pin ALU_1 Input2[10] -pin Mux_alusrc2 Output[10]
load net keyb_data[4] -attr @rip(#000000) out_char[4] -pin Inst_MemoryTop Keyboard_Data[4] -pin LED_left input[0] -pin board out_char[4]
load net pcreg_output[6] -attr @rip(#000000) 6 -pin Inst_MemoryTop address1[6]
load net pc_add4[6] -attr @rip(#000000) 6 -pin Mux_PC Input1[6]
load net alu_input1[11] -attr @rip(#000000) Output[11] -pin ALU_1 Input1[11] -pin Mux_alusrc1 Output[11]
load net IFID_inst_out[6] -attr @rip(#000000) 6 -pin Decoder_1 Instruction[6]
load net IDEX_regread2[1] -attr @rip(#000000) RegReadOutput2[1] -pin EX_MEM_1 RegReadInput2[1] -pin ID_EX_1 RegReadOutput2[1] -pin Passer_1 IDEX_R2[1]
load net memread -pin Controller_1 MemRead -pin ID_EX_1 MemReadInput
netloc memread 1 4 1 2240
load net decoder_imm[6] -attr @rip(#000000) Imm[6] -pin Decoder_1 Imm[6] -pin ID_EX_1 ImmediateInput[6]
load net EXMEM_data[6] -attr @rip(#000000) DataOutput[6] -pin EX_MEM_1 DataOutput[6] -pin Inst_MemoryTop address2[6] -pin MEM_WB_1 AluResultInput[6] -pin Mux_BEQZ Input3[6] -pin Mux_alusrc1 Input3[6] -pin Mux_alusrc2 Input3[6] -pin Mux_regsultsrc Input3[6]
load net Ram2Addr[6] -attr @rip(#000000) memoryAddress[6] -pin Inst_MemoryTop memoryAddress[6] -port Ram2Addr[6]
load net pc_imm[9] -attr @rip(#000000) 9 -pin Mux_PC Input2[9]
load net flash_addr[11] -attr @rip(#000000) flash_addr[11] -pin Inst_MemoryTop flash_addr[11] -port flash_addr[11]
load net EXMEM_regresult[9] -attr @rip(#000000) RegResultOutput[9] -pin EX_MEM_1 RegResultOutput[9] -pin Inst_MemoryTop dataInput[9]
load net vga_reg1[8] -attr @rip(#000000) vga_reg1[8] -pin RegFile_1 vga_reg1[8]
load net EXMEM_regwrite -pin EX_MEM_1 RegWriteOutput -pin MEM_WB_1 RegWriteInput -pin Passer_1 EXMEM_RegWrite
netloc EXMEM_regwrite 1 0 8 260 1090 640 810 N 810 1680 750 2160 850 N 850 N 850 3880
load net IFID_pc_out[5] -attr @rip(#000000) 5 -pin RegFile_1 PCinput[5]
load net IFID_pc_out[10] -attr @rip(#000000) 10 -pin RegFile_1 PCinput[10]
load net Ram2Data[12] -attr @rip(#000000) extendDatabus[12] -pin Inst_MemoryTop extendDatabus[12] -port Ram2Data[12]
load net flash_addr[1] -attr @rip(#000000) flash_addr[1] -pin Inst_MemoryTop flash_addr[1] -port flash_addr[1]
load net DataMem_output[4] -attr @rip(#000000) output2[4] -pin Inst_MemoryTop output2[4] -pin MEM_WB_1 MemResultInput[4]
load net Keyb_dataready -pin Inst_MemoryTop Keyboard_Dataready -pin board dataready_out
netloc Keyb_dataready 1 7 1 N
load net BranchReg[8] -attr @rip(#000000) Output[8] -pin BranchSelector_1 RegInput[8] -pin Mux_BEQZ Output[8]
load net pcreg_input[10] -attr @rip(#000000) Output[10] -pin Mux_PC Output[10]
load net forwardA[1] -attr @rip(#000000) ForwardA[1] -pin Mux_alusrc1 choice[1] -pin Passer_1 ForwardA[1]
load net IDEX_regresult[6] -attr @rip(#000000) RegResult[6] -pin ID_EX_1 RegResult[6] -pin Mux_regsultsrc Input1[6]
load net regfile_reg2[4] -attr @rip(#000000) Reg2[4] -pin ID_EX_1 DataInput2[4] -pin RegFile_1 Reg2[4]
load net vgawaddr[1] -attr @rip(#000000) VGA_addr[1] -pin Inst_MemoryTop VGA_addr[1] -pin Inst_VGA_play waddr[1]
load net IDEX_aludata1[8] -attr @rip(#000000) ALUdata1[8] -pin ID_EX_1 ALUdata1[8] -pin Mux_alusrc1 Input1[8]
load net instmem_data[7] -attr @rip(#000000) output1[7] -pin Inst_MemoryTop output1[7]
load net BranchReg[11] -attr @rip(#000000) Output[11] -pin BranchSelector_1 RegInput[11] -pin Mux_BEQZ Output[11]
load net alu_input2[7] -attr @rip(#000000) Output[7] -pin ALU_1 Input2[7] -pin Mux_alusrc2 Output[7]
load net MEMWB_memresult[9] -attr @rip(#000000) MemResultOutput[9] -pin MEM_WB_1 MemResultOutput[9] -pin Mux_wb Input2[9]
load net IDEX_regresult[15] -attr @rip(#000000) RegResult[15] -pin ID_EX_1 RegResult[15] -pin Mux_regsultsrc Input1[15]
load net pcwrite -pin PCReg_1 PCWrite -pin RiskChecker_1 PCWrite
netloc pcwrite 1 3 1 1660
load net alu_output[7] -attr @rip(#000000) Output[7] -pin ALU_1 Output[7] -pin EX_MEM_1 DataInput[7] -pin Mux_BEQZ Input2[7] -pin TReg_1 Input[7]
load net DataMem_output[15] -attr @rip(#000000) output2[15] -pin Inst_MemoryTop output2[15] -pin MEM_WB_1 MemResultInput[15]
load net vgawaddr[10] -attr @rip(#000000) VGA_addr[10] -pin Inst_MemoryTop VGA_addr[10] -pin Inst_VGA_play waddr[10]
load net Ram2Data[4] -attr @rip(#000000) extendDatabus[4] -pin Inst_MemoryTop extendDatabus[4] -port Ram2Data[4]
load net IDEX_aludata2[1] -attr @rip(#000000) ALUdata2[1] -pin ID_EX_1 ALUdata2[1] -pin Mux_alusrc2 Input1[1]
load net MEMWB_aluresult[7] -attr @rip(#000000) AluResultOutput[7] -pin MEM_WB_1 AluResultOutput[7] -pin Mux_wb Input1[7]
load net regfile_reg1[0] -attr @rip(#000000) Reg1[0] -pin ID_EX_1 DataInput1[0] -pin Mux_BEQZ Input1[0] -pin Mux_PC Input3[0] -pin RegFile_1 Reg1[0]
load net alu_input1[3] -attr @rip(#000000) Output[3] -pin ALU_1 Input1[3] -pin Mux_alusrc1 Output[3] -pin RegFile_1 debug[15]
load net EXMEM_regresultinput[2] -attr @rip(#000000) Output[2] -pin EX_MEM_1 RegResultInput[2] -pin Mux_regsultsrc Output[2]
load net Ram2Addr[11] -attr @rip(#000000) memoryAddress[11] -pin Inst_MemoryTop memoryAddress[11] -port Ram2Addr[11]
load net ledseg2[3] -attr @rip(#000000) output[3] -pin LED_left output[3] -port ledseg2[3]
load net Ram1Data[2] -attr @rip(#000000) basicdatabus[2] -pin Inst_MemoryTop basicdatabus[2] -port Ram1Data[2]
load net flash_we -pin Inst_MemoryTop flash_we -port flash_we
netloc flash_we 1 8 2 N 1660 N
load net flash_data[13] -attr @rip(#000000) flash_data[13] -pin Inst_MemoryTop flash_data[13] -port flash_data[13]
load net MEMWB_memresult[14] -attr @rip(#000000) MemResultOutput[14] -pin MEM_WB_1 MemResultOutput[14] -pin Mux_wb Input2[14]
load net instmem_data[11] -attr @rip(#000000) output1[11] -pin Inst_MemoryTop output1[11]
load net regfile_writedata[0] -attr @rip(#000000) Output[0] -pin Mux_alusrc1 Input2[0] -pin Mux_alusrc2 Input2[0] -pin Mux_regsultsrc Input2[0] -pin Mux_wb Output[0] -pin RegFile_1 WriteData[0]
load net decoder_reg2[0] -attr @rip(#000000) Reg2[0] -pin Decoder_1 Reg2[0] -pin ID_EX_1 RegReadInput2[0] -pin RegFile_1 ReadAddress2[0] -pin RiskChecker_1 IFID_R2[0]
load net EXMEM_regresultinput[12] -attr @rip(#000000) Output[12] -pin EX_MEM_1 RegResultInput[12] -pin Mux_regsultsrc Output[12]
load net LED_output[5] -attr @rip(#000000) LED_output[5] -port LED_output[5] -pin RegFile_1 LED_output[5]
load net EXMEM_regread2[0] -attr @rip(#000000) RegReadOutput2[0] -pin EX_MEM_1 RegReadOutput2[0] -pin MEM_WB_1 RegReadInput2[0]
load net alu_output[15] -attr @rip(#000000) Output[15] -pin ALU_1 Output[15] -pin EX_MEM_1 DataInput[15] -pin Mux_BEQZ Input2[15] -pin TReg_1 Input[15]
load net MEMWB_aluresult[14] -attr @rip(#000000) AluResultOutput[14] -pin MEM_WB_1 AluResultOutput[14] -pin Mux_wb Input1[14]
load net alu_input2[11] -attr @rip(#000000) Output[11] -pin ALU_1 Input2[11] -pin Mux_alusrc2 Output[11]
load net keyb_data[5] -attr @rip(#000000) out_char[5] -pin Inst_MemoryTop Keyboard_Data[5] -pin LED_left input[1] -pin board out_char[5]
load net pcreg_output[7] -attr @rip(#000000) 7 -pin Inst_MemoryTop address1[7]
load net EXMEM_regwriteto[0] -attr @rip(#000000) RegWriteToOutput[0] -pin EX_MEM_1 RegWriteToOutput[0] -pin MEM_WB_1 RegWriteToInput[0] -pin Passer_1 EXMEM_W[0] -pin RiskChecker_1 EXMEM_W[0]
load net pc_add4[7] -attr @rip(#000000) 7 -pin Mux_PC Input1[7]
load net forwardBEQZ[0] -attr @rip(#000000) forwardBEQZ[0] -pin Mux_BEQZ choice[0] -pin RiskChecker_1 forwardBEQZ[0]
load net alu_input1[12] -attr @rip(#000000) Output[12] -pin ALU_1 Input1[12] -pin Mux_alusrc1 Output[12]
load net IFID_inst_out[7] -attr @rip(#000000) 7 -pin Decoder_1 Instruction[7]
load net IDEX_regread2[2] -attr @rip(#000000) RegReadOutput2[2] -pin EX_MEM_1 RegReadInput2[2] -pin ID_EX_1 RegReadOutput2[2] -pin Passer_1 IDEX_R2[2]
load net decoder_imm[7] -attr @rip(#000000) Imm[7] -pin Decoder_1 Imm[7] -pin ID_EX_1 ImmediateInput[7]
load net EXMEM_data[7] -attr @rip(#000000) DataOutput[7] -pin EX_MEM_1 DataOutput[7] -pin Inst_MemoryTop address2[7] -pin MEM_WB_1 AluResultInput[7] -pin Mux_BEQZ Input3[7] -pin Mux_alusrc1 Input3[7] -pin Mux_alusrc2 Input3[7] -pin Mux_regsultsrc Input3[7]
load net IDEX_regwriteto[0] -attr @rip(#000000) RegWriteToOutput[0] -pin EX_MEM_1 RegWriteToInput[0] -pin ID_EX_1 RegWriteToOutput[0] -pin RiskChecker_1 IDEX_W[0]
load net Ram2Addr[7] -attr @rip(#000000) memoryAddress[7] -pin Inst_MemoryTop memoryAddress[7] -port Ram2Addr[7]
load net flash_addr[12] -attr @rip(#000000) flash_addr[12] -pin Inst_MemoryTop flash_addr[12] -port flash_addr[12]
load net keyclkin -pin board clkin -port keyclkin
netloc keyclkin 1 0 7 N 1600 N 1600 N 1600 N 1600 N 1600 2880 1520 3400
load net branch[0] -attr @rip(#000000) Branch[0] -pin BranchSelector_1 Branch[0] -pin Mux_PC choice[0]
load net regwrite -pin Controller_1 RegWrite -pin ID_EX_1 RegWriteInput
netloc regwrite 1 4 1 2340
load net IDEX_aluop[0] -attr @rip(#000000) ALUopOutput[0] -pin ALU_1 ALUop[0] -pin ID_EX_1 ALUopOutput[0] -pin RegFile_1 debug[1]
load net vga_reg1[9] -attr @rip(#000000) vga_reg1[9] -pin RegFile_1 vga_reg1[9]
load net ttype -pin Controller_1 TType -pin ID_EX_1 TTypeInput
netloc ttype 1 4 1 2380
load net IFID_pc_out[6] -attr @rip(#000000) 6 -pin RegFile_1 PCinput[6]
load net IFID_pc_out[11] -attr @rip(#000000) 11 -pin RegFile_1 PCinput[11]
load net Ram2Data[13] -attr @rip(#000000) extendDatabus[13] -pin Inst_MemoryTop extendDatabus[13] -port Ram2Data[13]
load net flash_addr[2] -attr @rip(#000000) flash_addr[2] -pin Inst_MemoryTop flash_addr[2] -port flash_addr[2]
load net EXMEM_memwrite -pin EX_MEM_1 MemWriteOutput -pin Inst_MemoryTop MemWrite
netloc EXMEM_memwrite 1 7 1 4000
load net Keyb_wrn -pin Inst_MemoryTop Keyboard_wrn -pin board datareceived
netloc Keyb_wrn 1 6 3 3540 1880 3860 1980 4460
load net DataMem_output[5] -attr @rip(#000000) output2[5] -pin Inst_MemoryTop output2[5] -pin MEM_WB_1 MemResultInput[5]
load net BranchReg[9] -attr @rip(#000000) Output[9] -pin BranchSelector_1 RegInput[9] -pin Mux_BEQZ Output[9]
load net regfile_reg1[10] -attr @rip(#000000) Reg1[10] -pin ID_EX_1 DataInput1[10] -pin Mux_BEQZ Input1[10] -pin Mux_PC Input3[10] -pin RegFile_1 Reg1[10]
load net pcreg_input[11] -attr @rip(#000000) Output[11] -pin Mux_PC Output[11]
load net IDEX_regresult[7] -attr @rip(#000000) RegResult[7] -pin ID_EX_1 RegResult[7] -pin Mux_regsultsrc Input1[7]
load net regfile_reg2[5] -attr @rip(#000000) Reg2[5] -pin ID_EX_1 DataInput2[5] -pin RegFile_1 Reg2[5]
load net vgawaddr[2] -attr @rip(#000000) VGA_addr[2] -pin Inst_MemoryTop VGA_addr[2] -pin Inst_VGA_play waddr[2]
load net IDEX_aludata1[9] -attr @rip(#000000) ALUdata1[9] -pin ID_EX_1 ALUdata1[9] -pin Mux_alusrc1 Input1[9]
load net instmem_data[8] -attr @rip(#000000) output1[8] -pin Inst_MemoryTop output1[8]
load net IDEX_aludata1[10] -attr @rip(#000000) ALUdata1[10] -pin ID_EX_1 ALUdata1[10] -pin Mux_alusrc1 Input1[10]
load net BranchReg[12] -attr @rip(#000000) Output[12] -pin BranchSelector_1 RegInput[12] -pin Mux_BEQZ Output[12]
load net alu_input2[8] -attr @rip(#000000) Output[8] -pin ALU_1 Input2[8] -pin Mux_alusrc2 Output[8]
load net alu_output[8] -attr @rip(#000000) Output[8] -pin ALU_1 Output[8] -pin EX_MEM_1 DataInput[8] -pin Mux_BEQZ Input2[8] -pin TReg_1 Input[8]
load net MEMWB_regread2[0] -attr @rip(#000000) RegReadOutput2[0] -pin MEM_WB_1 RegReadOutput2[0]
load net Ram2Data[5] -attr @rip(#000000) extendDatabus[5] -pin Inst_MemoryTop extendDatabus[5] -port Ram2Data[5]
load net pcreg_input[0] -attr @rip(#000000) Output[0] -pin Mux_PC Output[0]
load net MEMWB_aluresult[8] -attr @rip(#000000) AluResultOutput[8] -pin MEM_WB_1 AluResultOutput[8] -pin Mux_wb Input1[8]
load net regfile_reg1[1] -attr @rip(#000000) Reg1[1] -pin ID_EX_1 DataInput1[1] -pin Mux_BEQZ Input1[1] -pin Mux_PC Input3[1] -pin RegFile_1 Reg1[1]
load net IDEX_aludata2[2] -attr @rip(#000000) ALUdata2[2] -pin ID_EX_1 ALUdata2[2] -pin Mux_alusrc2 Input1[2]
load net alu_input1[4] -attr @rip(#000000) Output[4] -pin ALU_1 Input1[4] -pin Mux_alusrc1 Output[4]
load net EXMEM_regresultinput[3] -attr @rip(#000000) Output[3] -pin EX_MEM_1 RegResultInput[3] -pin Mux_regsultsrc Output[3]
load net Ram2Addr[12] -attr @rip(#000000) memoryAddress[12] -pin Inst_MemoryTop memoryAddress[12] -port Ram2Addr[12]
load net ledseg2[4] -attr @rip(#000000) output[4] -pin LED_left output[4] -port ledseg2[4]
load net Ram1Data[3] -attr @rip(#000000) basicdatabus[3] -pin Inst_MemoryTop basicdatabus[3] -port Ram1Data[3]
load net flash_data[14] -attr @rip(#000000) flash_data[14] -pin Inst_MemoryTop flash_data[14] -port flash_data[14]
load net MEMWB_memresult[15] -attr @rip(#000000) MemResultOutput[15] -pin MEM_WB_1 MemResultOutput[15] -pin Mux_wb Input2[15]
load net instmem_data[12] -attr @rip(#000000) output1[12] -pin Inst_MemoryTop output1[12]
load net flash_data[0] -attr @rip(#000000) flash_data[0] -pin Inst_MemoryTop flash_data[0] -port flash_data[0]
load net regfile_writedata[1] -attr @rip(#000000) Output[1] -pin Mux_alusrc1 Input2[1] -pin Mux_alusrc2 Input2[1] -pin Mux_regsultsrc Input2[1] -pin Mux_wb Output[1] -pin RegFile_1 WriteData[1]
load net decoder_reg2[1] -attr @rip(#000000) Reg2[1] -pin Decoder_1 Reg2[1] -pin ID_EX_1 RegReadInput2[1] -pin RegFile_1 ReadAddress2[1] -pin RiskChecker_1 IFID_R2[1]
load net EXMEM_regresultinput[13] -attr @rip(#000000) Output[13] -pin EX_MEM_1 RegResultInput[13] -pin Mux_regsultsrc Output[13]
load net LED_output[6] -attr @rip(#000000) LED_output[6] -port LED_output[6] -pin RegFile_1 LED_output[6]
load net decoder_op[0] -attr @rip(#000000) Op[0] -pin BranchSelector_1 Op[0] -pin Controller_1 Op[0] -pin Decoder_1 Op[0] -pin RiskChecker_1 op[0]
load net ledseg1[0] -attr @rip(#000000) output[0] -pin LED_right output[0] -port ledseg1[0]
load net EXMEM_regread2[1] -attr @rip(#000000) RegReadOutput2[1] -pin EX_MEM_1 RegReadOutput2[1] -pin MEM_WB_1 RegReadInput2[1]
load net MEMWB_aluresult[15] -attr @rip(#000000) AluResultOutput[15] -pin MEM_WB_1 AluResultOutput[15] -pin Mux_wb Input1[15]
load net alu_input2[12] -attr @rip(#000000) Output[12] -pin ALU_1 Input2[12] -pin Mux_alusrc2 Output[12]
load net pc_add4[10] -attr @rip(#000000) 10 -pin Mux_PC Input1[10]
load net keyb_data[6] -attr @rip(#000000) out_char[6] -pin Inst_MemoryTop Keyboard_Data[6] -pin LED_left input[2] -pin board out_char[6]
load net pcreg_output[8] -attr @rip(#000000) 8 -pin Inst_MemoryTop address1[8]
load net EXMEM_regwriteto[1] -attr @rip(#000000) RegWriteToOutput[1] -pin EX_MEM_1 RegWriteToOutput[1] -pin MEM_WB_1 RegWriteToInput[1] -pin Passer_1 EXMEM_W[1] -pin RiskChecker_1 EXMEM_W[1]
load net vgawdata[0] -attr @rip(#000000) VGA_char[0] -pin Inst_MemoryTop VGA_char[0] -pin Inst_VGA_play wdata[0]
load net pc_add4[8] -attr @rip(#000000) 8 -pin Mux_PC Input1[8]
load net forwardBEQZ[1] -attr @rip(#000000) forwardBEQZ[1] -pin Mux_BEQZ choice[1] -pin RiskChecker_1 forwardBEQZ[1]
load net alu_input1[13] -attr @rip(#000000) Output[13] -pin ALU_1 Input1[13] -pin Mux_alusrc1 Output[13]
load net IDEX_ttype -pin ID_EX_1 TTypeOutput -pin TReg_1 TType
netloc IDEX_ttype 1 3 3 1800 1300 2240 1320 2840
load net IFID_inst_out[8] -attr @rip(#000000) 8 -pin Decoder_1 Instruction[8]
load net flash_byte -pin Inst_MemoryTop flash_byte -port flash_byte
netloc flash_byte 1 8 2 N 1560 N
load net IDEX_regread2[3] -attr @rip(#000000) RegReadOutput2[3] -pin EX_MEM_1 RegReadInput2[3] -pin ID_EX_1 RegReadOutput2[3] -pin Passer_1 IDEX_R2[3]
load net decoder_imm[8] -attr @rip(#000000) Imm[8] -pin Decoder_1 Imm[8] -pin ID_EX_1 ImmediateInput[8]
load net EXMEM_data[8] -attr @rip(#000000) DataOutput[8] -pin EX_MEM_1 DataOutput[8] -pin Inst_MemoryTop address2[8] -pin MEM_WB_1 AluResultInput[8] -pin Mux_BEQZ Input3[8] -pin Mux_alusrc1 Input3[8] -pin Mux_alusrc2 Input3[8] -pin Mux_regsultsrc Input3[8]
load net IDEX_regwriteto[1] -attr @rip(#000000) RegWriteToOutput[1] -pin EX_MEM_1 RegWriteToInput[1] -pin ID_EX_1 RegWriteToOutput[1] -pin RiskChecker_1 IDEX_W[1]
load net Ram2Addr[8] -attr @rip(#000000) memoryAddress[8] -pin Inst_MemoryTop memoryAddress[8] -port Ram2Addr[8]
load net flash_addr[13] -attr @rip(#000000) flash_addr[13] -pin Inst_MemoryTop flash_addr[13] -port flash_addr[13]
load net branch[1] -attr @rip(#000000) Branch[1] -pin BranchSelector_1 Branch[1] -pin Mux_PC choice[1]
load net regfile_reg2[10] -attr @rip(#000000) Reg2[10] -pin ID_EX_1 DataInput2[10] -pin RegFile_1 Reg2[10]
load net IDEX_aluop[1] -attr @rip(#000000) ALUopOutput[1] -pin ALU_1 ALUop[1] -pin ID_EX_1 ALUopOutput[1] -pin RegFile_1 debug[2]
load net Ram2OE -pin Inst_MemoryTop memoryOE -port Ram2OE
netloc Ram2OE 1 8 2 N 1720 N
load net IFID_pc_out[7] -attr @rip(#000000) 7 -pin RegFile_1 PCinput[7]
load net IFID_pc_out[12] -attr @rip(#000000) 12 -pin RegFile_1 PCinput[12]
load net serialRDN -pin Inst_MemoryTop serial_rdn -port serialRDN
netloc serialRDN 1 8 2 N 1820 N
load net Ram2Data[14] -attr @rip(#000000) extendDatabus[14] -pin Inst_MemoryTop extendDatabus[14] -port Ram2Data[14]
load net decoder_imm[10] -attr @rip(#000000) Imm[10] -pin Decoder_1 Imm[10] -pin ID_EX_1 ImmediateInput[10]
load net memwrite -pin Controller_1 MemWrite -pin ID_EX_1 MemWriteInput
netloc memwrite 1 4 1 2300
load net flash_addr[3] -attr @rip(#000000) flash_addr[3] -pin Inst_MemoryTop flash_addr[3] -port flash_addr[3]
load net KEY16_INPUT[0] -attr @rip(#000000) KEY16_INPUT[0] -port KEY16_INPUT[0] -pin RegFile_1 sel[0]
load net forwardC[0] -attr @rip(#000000) ForwardC[0] -pin Mux_regsultsrc choice[0] -pin Passer_1 ForwardC[0]
load net clk25 -pin Inst_VGA_play clkout
netloc clk25 1 9 1 N
load net DataMem_output[6] -attr @rip(#000000) output2[6] -pin Inst_MemoryTop output2[6] -pin MEM_WB_1 MemResultInput[6]
load net regfile_reg1[11] -attr @rip(#000000) Reg1[11] -pin ID_EX_1 DataInput1[11] -pin Mux_BEQZ Input1[11] -pin Mux_PC Input3[11] -pin RegFile_1 Reg1[11]
load net IDEX_aludata2[10] -attr @rip(#000000) ALUdata2[10] -pin ID_EX_1 ALUdata2[10] -pin Mux_alusrc2 Input1[10]
load net pcreg_input[12] -attr @rip(#000000) Output[12] -pin Mux_PC Output[12]
load net IDEX_regresult[8] -attr @rip(#000000) RegResult[8] -pin ID_EX_1 RegResult[8] -pin Mux_regsultsrc Input1[8]
load net regfile_reg2[6] -attr @rip(#000000) Reg2[6] -pin ID_EX_1 DataInput2[6] -pin RegFile_1 Reg2[6]
load net vgawaddr[3] -attr @rip(#000000) VGA_addr[3] -pin Inst_MemoryTop VGA_addr[3] -pin Inst_VGA_play waddr[3]
load net vga_reg1[10] -attr @rip(#000000) vga_reg1[10] -pin RegFile_1 vga_reg1[10]
load net pc_imm[0] -attr @rip(#000000) 0 -pin Mux_PC Input2[0]
load net instmem_data[9] -attr @rip(#000000) output1[9] -pin Inst_MemoryTop output1[9]
load net IDEX_aludata1[11] -attr @rip(#000000) ALUdata1[11] -pin ID_EX_1 ALUdata1[11] -pin Mux_alusrc1 Input1[11]
load net BranchReg[13] -attr @rip(#000000) Output[13] -pin BranchSelector_1 RegInput[13] -pin Mux_BEQZ Output[13]
load net alu_input2[9] -attr @rip(#000000) Output[9] -pin ALU_1 Input2[9] -pin Mux_alusrc2 Output[9]
load net EXMEM_regresult[0] -attr @rip(#000000) RegResultOutput[0] -pin EX_MEM_1 RegResultOutput[0] -pin Inst_MemoryTop dataInput[0]
load net alu_output[9] -attr @rip(#000000) Output[9] -pin ALU_1 Output[9] -pin EX_MEM_1 DataInput[9] -pin Mux_BEQZ Input2[9] -pin TReg_1 Input[9]
load net MEMWB_regread2[1] -attr @rip(#000000) RegReadOutput2[1] -pin MEM_WB_1 RegReadOutput2[1]
load net Ram2Data[6] -attr @rip(#000000) extendDatabus[6] -pin Inst_MemoryTop extendDatabus[6] -port Ram2Data[6]
load net pcreg_input[1] -attr @rip(#000000) Output[1] -pin Mux_PC Output[1]
load net IDEX_aludata2[3] -attr @rip(#000000) ALUdata2[3] -pin ID_EX_1 ALUdata2[3] -pin Mux_alusrc2 Input1[3]
load net MEMWB_aluresult[9] -attr @rip(#000000) AluResultOutput[9] -pin MEM_WB_1 AluResultOutput[9] -pin Mux_wb Input1[9]
load net regfile_reg1[2] -attr @rip(#000000) Reg1[2] -pin ID_EX_1 DataInput1[2] -pin Mux_BEQZ Input1[2] -pin Mux_PC Input3[2] -pin RegFile_1 Reg1[2]
load net alu_input1[5] -attr @rip(#000000) Output[5] -pin ALU_1 Input1[5] -pin Mux_alusrc1 Output[5]
load net EXMEM_regresultinput[4] -attr @rip(#000000) Output[4] -pin EX_MEM_1 RegResultInput[4] -pin Mux_regsultsrc Output[4]
load net Ram2Addr[13] -attr @rip(#000000) memoryAddress[13] -pin Inst_MemoryTop memoryAddress[13] -port Ram2Addr[13]
load net ledseg2[5] -attr @rip(#000000) output[5] -pin LED_left output[5] -port ledseg2[5]
load net Ram1Data[4] -attr @rip(#000000) basicdatabus[4] -pin Inst_MemoryTop basicdatabus[4] -port Ram1Data[4]
load net aluop[0] -attr @rip(#000000) ALUop[0] -pin Controller_1 ALUop[0] -pin ID_EX_1 ALUopInput[0]
load net flash_data[15] -attr @rip(#000000) flash_data[15] -pin Inst_MemoryTop flash_data[15] -port flash_data[15]
load net MEMWB_memresult[0] -attr @rip(#000000) MemResultOutput[0] -pin MEM_WB_1 MemResultOutput[0] -pin Mux_wb Input2[0]
load net instmem_data[13] -attr @rip(#000000) output1[13] -pin Inst_MemoryTop output1[13]
load net flash_data[1] -attr @rip(#000000) flash_data[1] -pin Inst_MemoryTop flash_data[1] -port flash_data[1]
load net IFID_inst_out[10] -attr @rip(#000000) 10 -pin Decoder_1 Instruction[10]
load net regfile_writedata[2] -attr @rip(#000000) Output[2] -pin Mux_alusrc1 Input2[2] -pin Mux_alusrc2 Input2[2] -pin Mux_regsultsrc Input2[2] -pin Mux_wb Output[2] -pin RegFile_1 WriteData[2]
load net decoder_reg2[2] -attr @rip(#000000) Reg2[2] -pin Decoder_1 Reg2[2] -pin ID_EX_1 RegReadInput2[2] -pin RegFile_1 ReadAddress2[2] -pin RiskChecker_1 IFID_R2[2]
load net EXMEM_regresultinput[14] -attr @rip(#000000) Output[14] -pin EX_MEM_1 RegResultInput[14] -pin Mux_regsultsrc Output[14]
load net LED_output[7] -attr @rip(#000000) LED_output[7] -port LED_output[7] -pin RegFile_1 LED_output[7]
load net decoder_op[1] -attr @rip(#000000) Op[1] -pin BranchSelector_1 Op[1] -pin Controller_1 Op[1] -pin Decoder_1 Op[1] -pin RiskChecker_1 op[1]
load net ledseg1[1] -attr @rip(#000000) output[1] -pin LED_right output[1] -port ledseg1[1]
load net EXMEM_regread2[2] -attr @rip(#000000) RegReadOutput2[2] -pin EX_MEM_1 RegReadOutput2[2] -pin MEM_WB_1 RegReadInput2[2]
load net pc_add4[11] -attr @rip(#000000) 11 -pin Mux_PC Input1[11]
load net alu_input2[13] -attr @rip(#000000) Output[13] -pin ALU_1 Input2[13] -pin Mux_alusrc2 Output[13]
load net keyb_data[7] -attr @rip(#000000) out_char[7] -pin Inst_MemoryTop Keyboard_Data[7] -pin LED_left input[3] -pin board out_char[7]
load net pcreg_output[9] -attr @rip(#000000) 9 -pin Inst_MemoryTop address1[9]
load net EXMEM_regwriteto[2] -attr @rip(#000000) RegWriteToOutput[2] -pin EX_MEM_1 RegWriteToOutput[2] -pin MEM_WB_1 RegWriteToInput[2] -pin Passer_1 EXMEM_W[2] -pin RiskChecker_1 EXMEM_W[2]
load net basicDatabus[0] -attr @rip(#000000) basicDatabus[0] -port basicDatabus[0]
load net vgawdata[1] -attr @rip(#000000) VGA_char[1] -pin Inst_MemoryTop VGA_char[1] -pin Inst_VGA_play wdata[1]
load net pc_add4[9] -attr @rip(#000000) 9 -pin Mux_PC Input1[9]
load net alu_input1[14] -attr @rip(#000000) Output[14] -pin ALU_1 Input1[14] -pin Mux_alusrc1 Output[14]
load net IFID_inst_out[9] -attr @rip(#000000) 9 -pin Decoder_1 Instruction[9]
load net CLK_0 -port CLK_0 -pin Inst_VGA_play CLK_0 -pin board clk50 -pin divClk_1 clk
netloc CLK_0 1 0 9 N 1800 N 1800 N 1800 N 1800 N 1800 2840 1940 3500 1860 3880 1960 4540
load net decoder_imm[9] -attr @rip(#000000) Imm[9] -pin Decoder_1 Imm[9] -pin ID_EX_1 ImmediateInput[9]
load net EXMEM_data[9] -attr @rip(#000000) DataOutput[9] -pin EX_MEM_1 DataOutput[9] -pin Inst_MemoryTop address2[9] -pin MEM_WB_1 AluResultInput[9] -pin Mux_BEQZ Input3[9] -pin Mux_alusrc1 Input3[9] -pin Mux_alusrc2 Input3[9] -pin Mux_regsultsrc Input3[9]
load net IDEX_regwriteto[2] -attr @rip(#000000) RegWriteToOutput[2] -pin EX_MEM_1 RegWriteToInput[2] -pin ID_EX_1 RegWriteToOutput[2] -pin RiskChecker_1 IDEX_W[2]
load net Ram2Addr[9] -attr @rip(#000000) memoryAddress[9] -pin Inst_MemoryTop memoryAddress[9] -port Ram2Addr[9]
load net flash_addr[14] -attr @rip(#000000) flash_addr[14] -pin Inst_MemoryTop flash_addr[14] -port flash_addr[14]
load net EXMEM_regresult[10] -attr @rip(#000000) RegResultOutput[10] -pin EX_MEM_1 RegResultOutput[10] -pin Inst_MemoryTop dataInput[10]
load net IDEX_aluop[2] -attr @rip(#000000) ALUopOutput[2] -pin ALU_1 ALUop[2] -pin ID_EX_1 ALUopOutput[2] -pin RegFile_1 debug[3]
load net IDEX_regread1[0] -attr @rip(#000000) RegReadOutput1[0] -pin EX_MEM_1 RegReadInput1[0] -pin ID_EX_1 RegReadOutput1[0] -pin Passer_1 IDEX_R1[0]
load net IFID_pc_out[8] -attr @rip(#000000) 8 -pin RegFile_1 PCinput[8]
load net ret -pin Controller_1 ret -pin ID_EX_1 retinput
netloc ret 1 4 1 2460
load net regfile_reg2[11] -attr @rip(#000000) Reg2[11] -pin ID_EX_1 DataInput2[11] -pin RegFile_1 Reg2[11]
load net IFID_pc_out[13] -attr @rip(#000000) 13 -pin RegFile_1 PCinput[13]
load net Ram2Data[15] -attr @rip(#000000) extendDatabus[15] -pin Inst_MemoryTop extendDatabus[15] -port Ram2Data[15]
load net decoder_imm[11] -attr @rip(#000000) Imm[11] -pin Decoder_1 Imm[11] -pin ID_EX_1 ImmediateInput[11]
load net flash_addr[4] -attr @rip(#000000) flash_addr[4] -pin Inst_MemoryTop flash_addr[4] -port flash_addr[4]
load net KEY16_INPUT[1] -attr @rip(#000000) KEY16_INPUT[1] -port KEY16_INPUT[1] -pin RegFile_1 sel[1]
load net forwardC[1] -attr @rip(#000000) ForwardC[1] -pin Mux_regsultsrc choice[1] -pin Passer_1 ForwardC[1]
load net DataMem_output[7] -attr @rip(#000000) output2[7] -pin Inst_MemoryTop output2[7] -pin MEM_WB_1 MemResultInput[7]
load net flash_ce -pin Inst_MemoryTop flash_ce -port flash_ce
netloc flash_ce 1 8 2 N 1580 N
load net IDEX_aludata2[11] -attr @rip(#000000) ALUdata2[11] -pin ID_EX_1 ALUdata2[11] -pin Mux_alusrc2 Input1[11]
load net EXMEM_data[10] -attr @rip(#000000) DataOutput[10] -pin EX_MEM_1 DataOutput[10] -pin Inst_MemoryTop address2[10] -pin MEM_WB_1 AluResultInput[10] -pin Mux_BEQZ Input3[10] -pin Mux_alusrc1 Input3[10] -pin Mux_alusrc2 Input3[10] -pin Mux_regsultsrc Input3[10]
load net regfile_reg1[12] -attr @rip(#000000) Reg1[12] -pin ID_EX_1 DataInput1[12] -pin Mux_BEQZ Input1[12] -pin Mux_PC Input3[12] -pin RegFile_1 Reg1[12]
load net pcreg_input[13] -attr @rip(#000000) Output[13] -pin Mux_PC Output[13]
load net IDEX_regresult[9] -attr @rip(#000000) RegResult[9] -pin ID_EX_1 RegResult[9] -pin Mux_regsultsrc Input1[9]
load net regfile_reg2[7] -attr @rip(#000000) Reg2[7] -pin ID_EX_1 DataInput2[7] -pin RegFile_1 Reg2[7]
load net vgawaddr[4] -attr @rip(#000000) VGA_addr[4] -pin Inst_MemoryTop VGA_addr[4] -pin Inst_VGA_play waddr[4]
load net pc_imm[1] -attr @rip(#000000) 1 -pin Mux_PC Input2[1]
load net vga_reg1[11] -attr @rip(#000000) vga_reg1[11] -pin RegFile_1 vga_reg1[11]
load net clk0 -pin EX_MEM_1 clk -pin ID_EX_1 clk -pin IF_ID_1 clk -pin MEM_WB_1 clk -pin PCReg_1 clk -pin RegFile_1 clk -pin clk0_S_MEMWB_ret_AND_70 o
netloc clk0 1 0 7 240 1420 N 1420 N 1420 1640 890 2440 770 3000 750 N
load net IDEX_memwrite -pin EX_MEM_1 MemWriteInput -pin ID_EX_1 MemWriteOutput -pin RiskChecker_1 IDEX_MemWrite
netloc IDEX_memwrite 1 2 5 1290 450 1800 550 N 550 2920 270 3480
load net MEMWB_regwriteto[0] -attr @rip(#000000) RegWriteToOutput[0] -pin MEM_WB_1 RegWriteToOutput[0] -pin Passer_1 MEMWB_W[0] -pin RegFile_1 WriteAddress[0]
load net IDEX_aludata1[12] -attr @rip(#000000) ALUdata1[12] -pin ID_EX_1 ALUdata1[12] -pin Mux_alusrc1 Input1[12]
load net BranchReg[14] -attr @rip(#000000) Output[14] -pin BranchSelector_1 RegInput[14] -pin Mux_BEQZ Output[14]
load net EXMEM_regresult[1] -attr @rip(#000000) RegResultOutput[1] -pin EX_MEM_1 RegResultOutput[1] -pin Inst_MemoryTop dataInput[1]
load net clk1 -pin clk1_clk_MUX_729 a0 -pin divClk_1 clk0
netloc clk1 1 6 1 3520
load net vga_reg1[0] -attr @rip(#000000) vga_reg1[0] -pin RegFile_1 vga_reg1[0]
load net pc_imm[10] -attr @rip(#000000) 10 -pin Mux_PC Input2[10]
load net EXMEM_memread -pin EX_MEM_1 MemReadOutput -pin Inst_MemoryTop MemRead
netloc EXMEM_memread 1 7 1 4100
load net MEMWB_regread2[2] -attr @rip(#000000) RegReadOutput2[2] -pin MEM_WB_1 RegReadOutput2[2]
load net Ram2Data[7] -attr @rip(#000000) extendDatabus[7] -pin Inst_MemoryTop extendDatabus[7] -port Ram2Data[7]
load net pcreg_input[2] -attr @rip(#000000) Output[2] -pin Mux_PC Output[2]
load net IDEX_aludata2[4] -attr @rip(#000000) ALUdata2[4] -pin ID_EX_1 ALUdata2[4] -pin Mux_alusrc2 Input1[4]
load net regfile_reg1[3] -attr @rip(#000000) Reg1[3] -pin ID_EX_1 DataInput1[3] -pin Mux_BEQZ Input1[3] -pin Mux_PC Input3[3] -pin RegFile_1 Reg1[3]
load net alu_input1[6] -attr @rip(#000000) Output[6] -pin ALU_1 Input1[6] -pin Mux_alusrc1 Output[6]
load net EXMEM_regresultinput[5] -attr @rip(#000000) Output[5] -pin EX_MEM_1 RegResultInput[5] -pin Mux_regsultsrc Output[5]
load net Ram2Addr[14] -attr @rip(#000000) memoryAddress[14] -pin Inst_MemoryTop memoryAddress[14] -port Ram2Addr[14]
load net MEMWB_regwrite -pin MEM_WB_1 RegWriteOutput -pin Passer_1 MEMWB_RegWrite -pin RegFile_1 RegWrite
netloc MEMWB_regwrite 1 1 3 700 1010 N 1010 N
load net ledseg2[6] -attr @rip(#000000) output[6] -pin LED_left output[6] -port ledseg2[6]
load net pcreg_output[10] -attr @rip(#000000) 10 -pin Inst_MemoryTop address1[10]
load net IFID_writein -pin IF_ID_1 WriteIn -pin RiskChecker_1 IFIDWrite
netloc IFID_writein 1 3 1 1780
load net Ram1Data[5] -attr @rip(#000000) basicdatabus[5] -pin Inst_MemoryTop basicdatabus[5] -port Ram1Data[5]
load net BranchReg[0] -attr @rip(#000000) Output[0] -pin BranchSelector_1 RegInput[0] -pin Mux_BEQZ Output[0]
load net aluop[1] -attr @rip(#000000) ALUop[1] -pin Controller_1 ALUop[1] -pin ID_EX_1 ALUopInput[1]
load net MEMWB_memresult[1] -attr @rip(#000000) MemResultOutput[1] -pin MEM_WB_1 MemResultOutput[1] -pin Mux_wb Input2[1]
load net IDEX_aludata1[0] -attr @rip(#000000) ALUdata1[0] -pin ID_EX_1 ALUdata1[0] -pin Mux_alusrc1 Input1[0]
load net instmem_data[14] -attr @rip(#000000) output1[14] -pin Inst_MemoryTop output1[14]
load net flash_data[2] -attr @rip(#000000) flash_data[2] -pin Inst_MemoryTop flash_data[2] -port flash_data[2]
load net flash_addr[20] -attr @rip(#000000) flash_addr[20] -pin Inst_MemoryTop flash_addr[20] -port flash_addr[20]
load net IFID_inst_out[11] -attr @rip(#000000) 11 -pin Decoder_1 Instruction[11]
load net regfile_writedata[3] -attr @rip(#000000) Output[3] -pin Mux_alusrc1 Input2[3] -pin Mux_alusrc2 Input2[3] -pin Mux_regsultsrc Input2[3] -pin Mux_wb Output[3] -pin RegFile_1 WriteData[3]
load net decoder_reg2[3] -attr @rip(#000000) Reg2[3] -pin Decoder_1 Reg2[3] -pin ID_EX_1 RegReadInput2[3] -pin RegFile_1 ReadAddress2[3] -pin RiskChecker_1 IFID_R2[3]
load net EXMEM_regresultinput[15] -attr @rip(#000000) Output[15] -pin EX_MEM_1 RegResultInput[15] -pin Mux_regsultsrc Output[15]
load net LED_output[8] -attr @rip(#000000) LED_output[8] -port LED_output[8] -pin RegFile_1 LED_output[8]
load net decoder_op[2] -attr @rip(#000000) Op[2] -pin BranchSelector_1 Op[2] -pin Controller_1 Op[2] -pin Decoder_1 Op[2] -pin RiskChecker_1 op[2]
load net ledseg1[2] -attr @rip(#000000) output[2] -pin LED_right output[2] -port ledseg1[2]
load net EXMEM_regread2[3] -attr @rip(#000000) RegReadOutput2[3] -pin EX_MEM_1 RegReadOutput2[3] -pin MEM_WB_1 RegReadInput2[3]
load net alu_input2[14] -attr @rip(#000000) Output[14] -pin ALU_1 Input2[14] -pin Mux_alusrc2 Output[14]
load net pc_add4[12] -attr @rip(#000000) 12 -pin Mux_PC Input1[12]
load net EXMEM_regwriteto[3] -attr @rip(#000000) RegWriteToOutput[3] -pin EX_MEM_1 RegWriteToOutput[3] -pin MEM_WB_1 RegWriteToInput[3] -pin Passer_1 EXMEM_W[3] -pin RiskChecker_1 EXMEM_W[3]
load net basicDatabus[1] -attr @rip(#000000) basicDatabus[1] -port basicDatabus[1]
load net vgawdata[2] -attr @rip(#000000) VGA_char[2] -pin Inst_MemoryTop VGA_char[2] -pin Inst_VGA_play wdata[2]
load net IDEX_memread -pin EX_MEM_1 MemReadInput -pin ID_EX_1 MemReadOutput
netloc IDEX_memread 1 5 2 N 250 3500
load net alu_input1[15] -attr @rip(#000000) Output[15] -pin ALU_1 Input1[15] -pin Mux_alusrc1 Output[15]
load net flash_oe -pin Inst_MemoryTop flash_oe -port flash_oe
netloc flash_oe 1 8 2 N 1600 N
load net MEMWB_ret -pin MEMWB_ret_INV_104 i -pin MEM_WB_1 retoutput
netloc MEMWB_ret 1 1 1 700
load net IDEX_regwriteto[3] -attr @rip(#000000) RegWriteToOutput[3] -pin EX_MEM_1 RegWriteToInput[3] -pin ID_EX_1 RegWriteToOutput[3] -pin RiskChecker_1 IDEX_W[3]
load net Ram2EN -pin Inst_MemoryTop memoryEN -port Ram2EN
netloc Ram2EN 1 8 2 N 1700 N
load net twrite -pin Controller_1 TWrite -pin ID_EX_1 TWriteInput
netloc twrite 1 4 1 2400
load net flash_addr[15] -attr @rip(#000000) flash_addr[15] -pin Inst_MemoryTop flash_addr[15] -port flash_addr[15]
load net EXMEM_regresult[11] -attr @rip(#000000) RegResultOutput[11] -pin EX_MEM_1 RegResultOutput[11] -pin Inst_MemoryTop dataInput[11]
load net regfile_writedata[10] -attr @rip(#000000) Output[10] -pin Mux_alusrc1 Input2[10] -pin Mux_alusrc2 Input2[10] -pin Mux_regsultsrc Input2[10] -pin Mux_wb Output[10] -pin RegFile_1 WriteData[10]
load net IDEX_regread1[1] -attr @rip(#000000) RegReadOutput1[1] -pin EX_MEM_1 RegReadInput1[1] -pin ID_EX_1 RegReadOutput1[1] -pin Passer_1 IDEX_R1[1]
load net IFID_pc_out[9] -attr @rip(#000000) 9 -pin RegFile_1 PCinput[9]
load net IFID_pc_out[14] -attr @rip(#000000) 14 -pin RegFile_1 PCinput[14]
load net keydatain -pin board datain -port keydatain
netloc keydatain 1 0 7 N 1620 N 1620 N 1620 N 1620 N 1620 3060 1540 N
load net regfile_reg2[12] -attr @rip(#000000) Reg2[12] -pin ID_EX_1 DataInput2[12] -pin RegFile_1 Reg2[12]
load net decoder_imm[12] -attr @rip(#000000) Imm[12] -pin Decoder_1 Imm[12] -pin ID_EX_1 ImmediateInput[12]
load net flash_addr[5] -attr @rip(#000000) flash_addr[5] -pin Inst_MemoryTop flash_addr[5] -port flash_addr[5]
load net KEY16_INPUT[2] -attr @rip(#000000) KEY16_INPUT[2] -port KEY16_INPUT[2] -pin RegFile_1 sel[2]
load net MEMWB_ret_INV_104_o -pin MEMWB_ret_INV_104 o -pin clk0_S_MEMWB_ret_AND_70 a1
netloc MEMWB_ret_INV_104_o 1 2 1 N
load net DataMem_output[8] -attr @rip(#000000) output2[8] -pin Inst_MemoryTop output2[8] -pin MEM_WB_1 MemResultInput[8]
load net EXMEM_data[11] -attr @rip(#000000) DataOutput[11] -pin EX_MEM_1 DataOutput[11] -pin Inst_MemoryTop address2[11] -pin MEM_WB_1 AluResultInput[11] -pin Mux_BEQZ Input3[11] -pin Mux_alusrc1 Input3[11] -pin Mux_alusrc2 Input3[11] -pin Mux_regsultsrc Input3[11]
load net regfile_reg1[13] -attr @rip(#000000) Reg1[13] -pin ID_EX_1 DataInput1[13] -pin Mux_BEQZ Input1[13] -pin Mux_PC Input3[13] -pin RegFile_1 Reg1[13]
load net IDEX_aludata2[12] -attr @rip(#000000) ALUdata2[12] -pin ID_EX_1 ALUdata2[12] -pin Mux_alusrc2 Input1[12]
load net pcreg_input[14] -attr @rip(#000000) Output[14] -pin Mux_PC Output[14]
load net regfile_reg2[8] -attr @rip(#000000) Reg2[8] -pin ID_EX_1 DataInput2[8] -pin RegFile_1 Reg2[8]
load net vgawaddr[5] -attr @rip(#000000) VGA_addr[5] -pin Inst_MemoryTop VGA_addr[5] -pin Inst_VGA_play waddr[5]
load net pc_imm[2] -attr @rip(#000000) 2 -pin Mux_PC Input2[2]
load net vga_reg1[12] -attr @rip(#000000) vga_reg1[12] -pin RegFile_1 vga_reg1[12]
load net MEMWB_regwriteto[1] -attr @rip(#000000) RegWriteToOutput[1] -pin MEM_WB_1 RegWriteToOutput[1] -pin Passer_1 MEMWB_W[1] -pin RegFile_1 WriteAddress[1]
load net IDEX_aludata1[13] -attr @rip(#000000) ALUdata1[13] -pin ID_EX_1 ALUdata1[13] -pin Mux_alusrc1 Input1[13]
load net BranchReg[15] -attr @rip(#000000) Output[15] -pin BranchSelector_1 RegInput[15] -pin Mux_BEQZ Output[15]
load net EXMEM_regresult[2] -attr @rip(#000000) RegResultOutput[2] -pin EX_MEM_1 RegResultOutput[2] -pin Inst_MemoryTop dataInput[2]
load net vga_reg1[1] -attr @rip(#000000) vga_reg1[1] -pin RegFile_1 vga_reg1[1]
load net pc_imm[11] -attr @rip(#000000) 11 -pin Mux_PC Input2[11]
load net MEMWB_regread2[3] -attr @rip(#000000) RegReadOutput2[3] -pin MEM_WB_1 RegReadOutput2[3]
load net Ram2Data[8] -attr @rip(#000000) extendDatabus[8] -pin Inst_MemoryTop extendDatabus[8] -port Ram2Data[8]
load net pcreg_input[3] -attr @rip(#000000) Output[3] -pin Mux_PC Output[3]
load net regfile_reg1[4] -attr @rip(#000000) Reg1[4] -pin ID_EX_1 DataInput1[4] -pin Mux_BEQZ Input1[4] -pin Mux_PC Input3[4] -pin RegFile_1 Reg1[4]
load net IDEX_aludata2[5] -attr @rip(#000000) ALUdata2[5] -pin ID_EX_1 ALUdata2[5] -pin Mux_alusrc2 Input1[5]
load net alu_input1[7] -attr @rip(#000000) Output[7] -pin ALU_1 Input1[7] -pin Mux_alusrc1 Output[7]
load net EXMEM_regresultinput[6] -attr @rip(#000000) Output[6] -pin EX_MEM_1 RegResultInput[6] -pin Mux_regsultsrc Output[6]
load net Ram2Addr[15] -attr @rip(#000000) memoryAddress[15] -pin Inst_MemoryTop memoryAddress[15] -port Ram2Addr[15]
load net pcreg_output[11] -attr @rip(#000000) 11 -pin Inst_MemoryTop address1[11]
load net BranchReg[1] -attr @rip(#000000) Output[1] -pin BranchSelector_1 RegInput[1] -pin Mux_BEQZ Output[1]
load net EXMEM_memtoreg -pin EX_MEM_1 MemtoRegOutput -pin MEM_WB_1 MemtoRegInput
netloc EXMEM_memtoreg 1 0 8 300 1050 740 1220 N 1220 N 1220 N 1220 N 1220 N 1220 3960
load net Ram1Data[6] -attr @rip(#000000) basicdatabus[6] -pin Inst_MemoryTop basicdatabus[6] -port Ram1Data[6]
load net aluop[2] -attr @rip(#000000) ALUop[2] -pin Controller_1 ALUop[2] -pin ID_EX_1 ALUopInput[2]
load net MEMWB_memresult[2] -attr @rip(#000000) MemResultOutput[2] -pin MEM_WB_1 MemResultOutput[2] -pin Mux_wb Input2[2]
load net IDEX_aludata1[1] -attr @rip(#000000) ALUdata1[1] -pin ID_EX_1 ALUdata1[1] -pin Mux_alusrc1 Input1[1]
load net instmem_data[15] -attr @rip(#000000) output1[15] -pin Inst_MemoryTop output1[15]
load net instmem_data[0] -attr @rip(#000000) output1[0] -pin Inst_MemoryTop output1[0]
load net flash_data[3] -attr @rip(#000000) flash_data[3] -pin Inst_MemoryTop flash_data[3] -port flash_data[3]
load net IDEX_twrite -pin ID_EX_1 TWriteOutput -pin TReg_1 TWrite
netloc IDEX_twrite 1 3 3 1820 1320 2140 1340 2820
load net flash_addr[21] -attr @rip(#000000) flash_addr[21] -pin Inst_MemoryTop flash_addr[21] -port flash_addr[21]
load net alu_input2[0] -attr @rip(#000000) Output[0] -pin ALU_1 Input2[0] -pin Mux_alusrc2 Output[0] -pin RegFile_1 debug[8]
load net IFID_inst_out[12] -attr @rip(#000000) 12 -pin Decoder_1 Instruction[12]
load net regfile_writedata[4] -attr @rip(#000000) Output[4] -pin Mux_alusrc1 Input2[4] -pin Mux_alusrc2 Input2[4] -pin Mux_regsultsrc Input2[4] -pin Mux_wb Output[4] -pin RegFile_1 WriteData[4]
load net LED_output[9] -attr @rip(#000000) LED_output[9] -port LED_output[9] -pin RegFile_1 LED_output[9]
load net decoder_op[3] -attr @rip(#000000) Op[3] -pin BranchSelector_1 Op[3] -pin Controller_1 Op[3] -pin Decoder_1 Op[3] -pin RiskChecker_1 op[3]
load net ledseg1[3] -attr @rip(#000000) output[3] -pin LED_right output[3] -port ledseg1[3]
load net alu_input2[15] -attr @rip(#000000) Output[15] -pin ALU_1 Input2[15] -pin Mux_alusrc2 Output[15]
load net alu_output[0] -attr @rip(#000000) Output[0] -pin ALU_1 Output[0] -pin EX_MEM_1 DataInput[0] -pin Mux_BEQZ Input2[0] -pin RegFile_1 debug[4] -pin TReg_1 Input[0]
load net pc_add4[13] -attr @rip(#000000) 13 -pin Mux_PC Input1[13]
load net T_sign -pin BranchSelector_1 T -pin TReg_1 T
netloc T_sign 1 4 2 N 1400 2820
load net basicDatabus[2] -attr @rip(#000000) basicDatabus[2] -port basicDatabus[2]
load net vgawdata[3] -attr @rip(#000000) VGA_char[3] -pin Inst_MemoryTop VGA_char[3] -pin Inst_VGA_play wdata[3]
load net MEMWB_aluresult[0] -attr @rip(#000000) AluResultOutput[0] -pin MEM_WB_1 AluResultOutput[0] -pin Mux_wb Input1[0]
load net decoder_reg1[0] -attr @rip(#000000) Reg1[0] -pin Decoder_1 Reg1[0] -pin ID_EX_1 RegReadInput1[0] -pin RegFile_1 ReadAddress1[0] -pin RiskChecker_1 IFID_R1[0]
load net EXMEM_regread1[0] -attr @rip(#000000) RegReadOutput1[0] -pin EX_MEM_1 RegReadOutput1[0] -pin MEM_WB_1 RegReadInput1[0]
load net EXMEM_regresult[12] -attr @rip(#000000) RegResultOutput[12] -pin EX_MEM_1 RegResultOutput[12] -pin Inst_MemoryTop dataInput[12]
load net flash_addr[16] -attr @rip(#000000) flash_addr[16] -pin Inst_MemoryTop flash_addr[16] -port flash_addr[16]
load net regfile_writedata[11] -attr @rip(#000000) Output[11] -pin Mux_alusrc1 Input2[11] -pin Mux_alusrc2 Input2[11] -pin Mux_regsultsrc Input2[11] -pin Mux_wb Output[11] -pin RegFile_1 WriteData[11]
load net IDEX_regread1[2] -attr @rip(#000000) RegReadOutput1[2] -pin EX_MEM_1 RegReadInput1[2] -pin ID_EX_1 RegReadOutput1[2] -pin Passer_1 IDEX_R1[2]
load net pcreg_output[0] -attr @rip(#000000) 0 -pin Inst_MemoryTop address1[0]
load net IFID_pc_out[15] -attr @rip(#000000) 15 -pin RegFile_1 PCinput[15]
load net pc_add4[0] -attr @rip(#000000) 0 -pin Mux_PC Input1[0]
load net regfile_reg2[13] -attr @rip(#000000) Reg2[13] -pin ID_EX_1 DataInput2[13] -pin RegFile_1 Reg2[13]
load net decoder_imm[13] -attr @rip(#000000) Imm[13] -pin Decoder_1 Imm[13] -pin ID_EX_1 ImmediateInput[13]
load net flash_addr[6] -attr @rip(#000000) flash_addr[6] -pin Inst_MemoryTop flash_addr[6] -port flash_addr[6]
load net IFID_inst_out[0] -attr @rip(#000000) 0 -pin Decoder_1 Instruction[0]
load net KEY16_INPUT[3] -attr @rip(#000000) KEY16_INPUT[3] -port KEY16_INPUT[3] -pin RegFile_1 sel[3]
load net DataMem_output[9] -attr @rip(#000000) output2[9] -pin Inst_MemoryTop output2[9] -pin MEM_WB_1 MemResultInput[9]
load net decoder_imm[0] -attr @rip(#000000) Imm[0] -pin Decoder_1 Imm[0] -pin ID_EX_1 ImmediateInput[0]
load net EXMEM_data[0] -attr @rip(#000000) DataOutput[0] -pin EX_MEM_1 DataOutput[0] -pin Inst_MemoryTop address2[0] -pin MEM_WB_1 AluResultInput[0] -pin Mux_BEQZ Input3[0] -pin Mux_alusrc1 Input3[0] -pin Mux_alusrc2 Input3[0] -pin Mux_regsultsrc Input3[0]
load net regfile_reg1[14] -attr @rip(#000000) Reg1[14] -pin ID_EX_1 DataInput1[14] -pin Mux_BEQZ Input1[14] -pin Mux_PC Input3[14] -pin RegFile_1 Reg1[14]
load net IDEX_aludata2[13] -attr @rip(#000000) ALUdata2[13] -pin ID_EX_1 ALUdata2[13] -pin Mux_alusrc2 Input1[13]
load net EXMEM_data[12] -attr @rip(#000000) DataOutput[12] -pin EX_MEM_1 DataOutput[12] -pin Inst_MemoryTop address2[12] -pin MEM_WB_1 AluResultInput[12] -pin Mux_BEQZ Input3[12] -pin Mux_alusrc1 Input3[12] -pin Mux_alusrc2 Input3[12] -pin Mux_regsultsrc Input3[12]
load netBundle @DataMem_output 16 DataMem_output[15] DataMem_output[14] DataMem_output[13] DataMem_output[12] DataMem_output[11] DataMem_output[10] DataMem_output[9] DataMem_output[8] DataMem_output[7] DataMem_output[6] DataMem_output[5] DataMem_output[4] DataMem_output[3] DataMem_output[2] DataMem_output[1] DataMem_output[0] -autobundled
netbloc @DataMem_output 1 0 9 200 1640 N 1640 N 1640 N 1640 N 1640 N 1640 N 1640 3900 1940 4440
load netBundle @pcreg_output 16 pcreg_output[15] pcreg_output[14] pcreg_output[13] pcreg_output[12] pcreg_output[11] pcreg_output[10] pcreg_output[9] pcreg_output[8] pcreg_output[7] pcreg_output[6] pcreg_output[5] pcreg_output[4] pcreg_output[3] pcreg_output[2] pcreg_output[1] pcreg_output[0] -autobundled
netbloc @pcreg_output 1 7 1 N
load netBundle @BranchReg 16 BranchReg[15] BranchReg[14] BranchReg[13] BranchReg[12] BranchReg[11] BranchReg[10] BranchReg[9] BranchReg[8] BranchReg[7] BranchReg[6] BranchReg[5] BranchReg[4] BranchReg[3] BranchReg[2] BranchReg[1] BranchReg[0] -autobundled
netbloc @BranchReg 1 5 1 2900
load netBundle @IFID_inst_out 16 IFID_inst_out[15] IFID_inst_out[14] IFID_inst_out[13] IFID_inst_out[12] IFID_inst_out[11] IFID_inst_out[10] IFID_inst_out[9] IFID_inst_out[8] IFID_inst_out[7] IFID_inst_out[6] IFID_inst_out[5] IFID_inst_out[4] IFID_inst_out[3] IFID_inst_out[2] IFID_inst_out[1] IFID_inst_out[0] -autobundled
netbloc @IFID_inst_out 1 1 1 N
load netBundle @pcreg_input 16 pcreg_input[15] pcreg_input[14] pcreg_input[13] pcreg_input[12] pcreg_input[11] pcreg_input[10] pcreg_input[9] pcreg_input[8] pcreg_input[7] pcreg_input[6] pcreg_input[5] pcreg_input[4] pcreg_input[3] pcreg_input[2] pcreg_input[1] pcreg_input[0] -autobundled
netbloc @pcreg_input 1 7 1 N
load netBundle @vga_reg1 16 vga_reg1[15] vga_reg1[14] vga_reg1[13] vga_reg1[12] vga_reg1[11] vga_reg1[10] vga_reg1[9] vga_reg1[8] vga_reg1[7] vga_reg1[6] vga_reg1[5] vga_reg1[4] vga_reg1[3] vga_reg1[2] vga_reg1[1] vga_reg1[0] -autobundled
netbloc @vga_reg1 1 4 1 N
load netBundle @EXMEM_regwriteto 4 EXMEM_regwriteto[3] EXMEM_regwriteto[2] EXMEM_regwriteto[1] EXMEM_regwriteto[0] -autobundled
netbloc @EXMEM_regwriteto 1 0 8 180 670 700 570 1250 690 N 690 2260 790 N 790 3420 830 3860
load netBundle @R 3 R[2] R[1] R[0] -autobundled
netbloc @R 1 9 1 N
load netBundle @MEMWB_regwriteto 4 MEMWB_regwriteto[3] MEMWB_regwriteto[2] MEMWB_regwriteto[1] MEMWB_regwriteto[0] -autobundled
netbloc @MEMWB_regwriteto 1 1 3 780 1030 N 1030 N
load netBundle @regfile_writedata 16 regfile_writedata[15] regfile_writedata[14] regfile_writedata[13] regfile_writedata[12] regfile_writedata[11] regfile_writedata[10] regfile_writedata[9] regfile_writedata[8] regfile_writedata[7] regfile_writedata[6] regfile_writedata[5] regfile_writedata[4] regfile_writedata[3] regfile_writedata[2] regfile_writedata[1] regfile_writedata[0] -autobundled
netbloc @regfile_writedata 1 2 4 1170 1200 1760 1200 N 1200 2980
load netBundle @IDEX_regread1 4 IDEX_regread1[3] IDEX_regread1[2] IDEX_regread1[1] IDEX_regread1[0] -autobundled
netbloc @IDEX_regread1 1 1 6 760 430 N 430 1820 530 N 530 2880 470 3400
load netBundle @decoder_op 5 decoder_op[4] decoder_op[3] decoder_op[2] decoder_op[1] decoder_op[0] -autobundled
netbloc @decoder_op 1 2 4 1110 650 1740 1280 N 1280 2880
load netBundle @ledseg1 7 ledseg1[6] ledseg1[5] ledseg1[4] ledseg1[3] ledseg1[2] ledseg1[1] ledseg1[0] -autobundled
netbloc @ledseg1 1 9 1 N
load netBundle @forwardA 2 forwardA[1] forwardA[0] -autobundled
netbloc @forwardA 1 2 1 1190
load netBundle @IDEX_regresult 16 IDEX_regresult[15] IDEX_regresult[14] IDEX_regresult[13] IDEX_regresult[12] IDEX_regresult[11] IDEX_regresult[10] IDEX_regresult[9] IDEX_regresult[8] IDEX_regresult[7] IDEX_regresult[6] IDEX_regresult[5] IDEX_regresult[4] IDEX_regresult[3] IDEX_regresult[2] IDEX_regresult[1] IDEX_regresult[0] -autobundled
netbloc @IDEX_regresult 1 5 1 3080
load netBundle @flash_addr 22 flash_addr[22] flash_addr[21] flash_addr[20] flash_addr[19] flash_addr[18] flash_addr[17] flash_addr[16] flash_addr[15] flash_addr[14] flash_addr[13] flash_addr[12] flash_addr[11] flash_addr[10] flash_addr[9] flash_addr[8] flash_addr[7] flash_addr[6] flash_addr[5] flash_addr[4] flash_addr[3] flash_addr[2] flash_addr[1] -autobundled
netbloc @flash_addr 1 8 2 N 1540 N
load netBundle @MEMWB_memresult 16 MEMWB_memresult[15] MEMWB_memresult[14] MEMWB_memresult[13] MEMWB_memresult[12] MEMWB_memresult[11] MEMWB_memresult[10] MEMWB_memresult[9] MEMWB_memresult[8] MEMWB_memresult[7] MEMWB_memresult[6] MEMWB_memresult[5] MEMWB_memresult[4] MEMWB_memresult[3] MEMWB_memresult[2] MEMWB_memresult[1] MEMWB_memresult[0] -autobundled
netbloc @MEMWB_memresult 1 1 1 720
load netBundle @MEMWB_aluresult 16 MEMWB_aluresult[15] MEMWB_aluresult[14] MEMWB_aluresult[13] MEMWB_aluresult[12] MEMWB_aluresult[11] MEMWB_aluresult[10] MEMWB_aluresult[9] MEMWB_aluresult[8] MEMWB_aluresult[7] MEMWB_aluresult[6] MEMWB_aluresult[5] MEMWB_aluresult[4] MEMWB_aluresult[3] MEMWB_aluresult[2] MEMWB_aluresult[1] MEMWB_aluresult[0] -autobundled
netbloc @MEMWB_aluresult 1 1 1 640
load netBundle @IDEX_regread2 4 IDEX_regread2[3] IDEX_regread2[2] IDEX_regread2[1] IDEX_regread2[0] -autobundled
netbloc @IDEX_regread2 1 1 6 780 590 1150 710 N 710 2220 810 2940 650 N
load netBundle @ledseg2 7 ledseg2[6] ledseg2[5] ledseg2[4] ledseg2[3] ledseg2[2] ledseg2[1] ledseg2[0] -autobundled
netbloc @ledseg2 1 9 1 N
load netBundle @forwardB 2 forwardB[1] forwardB[0] -autobundled
netbloc @forwardB 1 2 1 1130
load netBundle @aluop 3 aluop[2] aluop[1] aluop[0] -autobundled
netbloc @aluop 1 4 1 2180
load netBundle @G 3 G[2] G[1] G[0] -autobundled
netbloc @G 1 9 1 N
load netBundle @EXMEM_data 16 EXMEM_data[15] EXMEM_data[14] EXMEM_data[13] EXMEM_data[12] EXMEM_data[11] EXMEM_data[10] EXMEM_data[9] EXMEM_data[8] EXMEM_data[7] EXMEM_data[6] EXMEM_data[5] EXMEM_data[4] EXMEM_data[3] EXMEM_data[2] EXMEM_data[1] EXMEM_data[0] -autobundled
netbloc @EXMEM_data 1 0 8 280 1030 760 1050 1230 1180 N 1180 2500 750 2960 630 3420 480 4020
load netBundle @Ram2Addr 18 Ram2Addr[17] Ram2Addr[16] Ram2Addr[15] Ram2Addr[14] Ram2Addr[13] Ram2Addr[12] Ram2Addr[11] Ram2Addr[10] Ram2Addr[9] Ram2Addr[8] Ram2Addr[7] Ram2Addr[6] Ram2Addr[5] Ram2Addr[4] Ram2Addr[3] Ram2Addr[2] Ram2Addr[1] Ram2Addr[0] -autobundled
netbloc @Ram2Addr 1 8 2 N 1680 N
load netBundle @keyb_data 8 keyb_data[7] keyb_data[6] keyb_data[5] keyb_data[4] keyb_data[3] keyb_data[2] keyb_data[1] keyb_data[0] -autobundled
netbloc @keyb_data 1 7 2 4060 1880 4520
load netBundle @forwardC 2 forwardC[1] forwardC[0] -autobundled
netbloc @forwardC 1 2 4 N 730 N 730 2180 830 3040
load netBundle @IFID_pc_out 16 IFID_pc_out[15] IFID_pc_out[14] IFID_pc_out[13] IFID_pc_out[12] IFID_pc_out[11] IFID_pc_out[10] IFID_pc_out[9] IFID_pc_out[8] IFID_pc_out[7] IFID_pc_out[6] IFID_pc_out[5] IFID_pc_out[4] IFID_pc_out[3] IFID_pc_out[2] IFID_pc_out[1] IFID_pc_out[0] -autobundled
netbloc @IFID_pc_out 1 3 1 N
load netBundle @EXMEM_regread1 4 EXMEM_regread1[3] EXMEM_regread1[2] EXMEM_regread1[1] EXMEM_regread1[0] -autobundled
netbloc @EXMEM_regread1 1 0 8 220 830 N 830 N 830 1600 770 2140 870 N 870 N 870 3920
load netBundle @instmem_data 16 instmem_data[15] instmem_data[14] instmem_data[13] instmem_data[12] instmem_data[11] instmem_data[10] instmem_data[9] instmem_data[8] instmem_data[7] instmem_data[6] instmem_data[5] instmem_data[4] instmem_data[3] instmem_data[2] instmem_data[1] instmem_data[0] -autobundled
netbloc @instmem_data 1 8 1 N
load netBundle @IDEX_regwriteto 4 IDEX_regwriteto[3] IDEX_regwriteto[2] IDEX_regwriteto[1] IDEX_regwriteto[0] -autobundled
netbloc @IDEX_regwriteto 1 2 5 1290 670 N 670 2300 730 2860 710 N
load netBundle @pc_add4 16 pc_add4[15] pc_add4[14] pc_add4[13] pc_add4[12] pc_add4[11] pc_add4[10] pc_add4[9] pc_add4[8] pc_add4[7] pc_add4[6] pc_add4[5] pc_add4[4] pc_add4[3] pc_add4[2] pc_add4[1] pc_add4[0] -autobundled
netbloc @pc_add4 1 6 1 N
load netBundle @decoder_reg1 4 decoder_reg1[3] decoder_reg1[2] decoder_reg1[1] decoder_reg1[0] -autobundled
netbloc @decoder_reg1 1 2 3 1270 390 1720 230 2280
load netBundle @EXMEM_regread2 4 EXMEM_regread2[3] EXMEM_regread2[2] EXMEM_regread2[1] EXMEM_regread2[0] -autobundled
netbloc @EXMEM_regread2 1 0 8 240 1070 660 1240 N 1240 N 1240 N 1240 N 1240 N 1240 3940
load netBundle @regfile_reg1 16 regfile_reg1[15] regfile_reg1[14] regfile_reg1[13] regfile_reg1[12] regfile_reg1[11] regfile_reg1[10] regfile_reg1[9] regfile_reg1[8] regfile_reg1[7] regfile_reg1[6] regfile_reg1[5] regfile_reg1[4] regfile_reg1[3] regfile_reg1[2] regfile_reg1[1] regfile_reg1[0] -autobundled
netbloc @regfile_reg1 1 4 3 2420 1300 2860 1400 3420
load netBundle @forwardBEQZ 2 forwardBEQZ[1] forwardBEQZ[0] -autobundled
netbloc @forwardBEQZ 1 3 2 1760 650 2380
load netBundle @vgawdata 8 vgawdata[7] vgawdata[6] vgawdata[5] vgawdata[4] vgawdata[3] vgawdata[2] vgawdata[1] vgawdata[0] -autobundled
netbloc @vgawdata 1 8 1 4580
load netBundle @decoder_reg2 4 decoder_reg2[3] decoder_reg2[2] decoder_reg2[1] decoder_reg2[0] -autobundled
netbloc @decoder_reg2 1 2 3 1210 410 1620 250 2200
load netBundle @regfile_reg2 16 regfile_reg2[15] regfile_reg2[14] regfile_reg2[13] regfile_reg2[12] regfile_reg2[11] regfile_reg2[10] regfile_reg2[9] regfile_reg2[8] regfile_reg2[7] regfile_reg2[6] regfile_reg2[5] regfile_reg2[4] regfile_reg2[3] regfile_reg2[2] regfile_reg2[1] regfile_reg2[0] -autobundled
netbloc @regfile_reg2 1 4 1 2360
load netBundle @LED_output 16 LED_output[15] LED_output[14] LED_output[13] LED_output[12] LED_output[11] LED_output[10] LED_output[9] LED_output[8] LED_output[7] LED_output[6] LED_output[5] LED_output[4] LED_output[3] LED_output[2] LED_output[1] LED_output[0] -autobundled
netbloc @LED_output 1 4 6 N 1010 N 1010 N 1010 N 1010 N 1010 N
load netBundle @decoder_reg3 4 decoder_reg3[3] decoder_reg3[2] decoder_reg3[1] decoder_reg3[0] -autobundled
netbloc @decoder_reg3 1 2 3 1250 370 1660 270 2260
load netBundle @IDEX_aludata1 16 IDEX_aludata1[15] IDEX_aludata1[14] IDEX_aludata1[13] IDEX_aludata1[12] IDEX_aludata1[11] IDEX_aludata1[10] IDEX_aludata1[9] IDEX_aludata1[8] IDEX_aludata1[7] IDEX_aludata1[6] IDEX_aludata1[5] IDEX_aludata1[4] IDEX_aludata1[3] IDEX_aludata1[2] IDEX_aludata1[1] IDEX_aludata1[0] -autobundled
netbloc @IDEX_aludata1 1 2 4 1170 10 N 10 N 10 3080
load netBundle @branch 2 branch[1] branch[0] -autobundled
netbloc @branch 1 6 1 3400
load netBundle @EXMEM_regresult 16 EXMEM_regresult[15] EXMEM_regresult[14] EXMEM_regresult[13] EXMEM_regresult[12] EXMEM_regresult[11] EXMEM_regresult[10] EXMEM_regresult[9] EXMEM_regresult[8] EXMEM_regresult[7] EXMEM_regresult[6] EXMEM_regresult[5] EXMEM_regresult[4] EXMEM_regresult[3] EXMEM_regresult[2] EXMEM_regresult[1] EXMEM_regresult[0] -autobundled
netbloc @EXMEM_regresult 1 7 1 3980
load netBundle @MEMWB_regread1 4 MEMWB_regread1[3] MEMWB_regread1[2] MEMWB_regread1[1] MEMWB_regread1[0] -autobundled
netbloc @MEMWB_regread1 1 1 1 N
load netBundle @decoder_imm 16 decoder_imm[15] decoder_imm[14] decoder_imm[13] decoder_imm[12] decoder_imm[11] decoder_imm[10] decoder_imm[9] decoder_imm[8] decoder_imm[7] decoder_imm[6] decoder_imm[5] decoder_imm[4] decoder_imm[3] decoder_imm[2] decoder_imm[1] decoder_imm[0] -autobundled
netbloc @decoder_imm 1 2 3 1110 210 N 210 2300
load netBundle @Ram1Data 8 Ram1Data[7] Ram1Data[6] Ram1Data[5] Ram1Data[4] Ram1Data[3] Ram1Data[2] Ram1Data[1] Ram1Data[0] -autobundled
netbloc @Ram1Data 1 7 3 4120 1360 4600 1520 N
load netBundle @KEY16_INPUT 5 KEY16_INPUT[4] KEY16_INPUT[3] KEY16_INPUT[2] KEY16_INPUT[1] KEY16_INPUT[0] -autobundled
netbloc @KEY16_INPUT 1 0 6 N 1550 N 1550 N 1550 1680 1720 N 1720 2960
load netBundle @alu_input1,alu_input2 51 alu_input1[15] alu_input1[14] alu_input1[13] alu_input1[12] alu_input1[11] alu_input1[10] alu_input1[9] alu_input1[8] alu_input1[7] alu_input1[6] alu_input1[5] alu_input1[4] alu_input1[3] alu_input1[2] alu_input1[1] alu_input1[0] alu_input2[15] alu_input2[14] alu_input2[13] alu_input2[12] alu_input2[11] alu_input2[10] alu_input2[9] alu_input2[8] alu_input2[7] alu_input2[6] alu_input2[5] alu_input2[4] alu_input2[3] alu_input2[2] alu_input2[1] alu_input2[0] alu_output[15] alu_output[14] alu_output[13] alu_output[12] alu_output[11] alu_output[10] alu_output[9] alu_output[8] alu_output[7] alu_output[6] alu_output[5] alu_output[4] alu_output[3] alu_output[2] alu_output[1] alu_output[0] IDEX_aluop[2] IDEX_aluop[1] IDEX_aluop[0] -autobundled
netbloc @alu_input1,alu_input2 1 2 5 1210 1280 1700 630 2400 570 2900 230 3520
load netBundle @IDEX_aludata2 16 IDEX_aludata2[15] IDEX_aludata2[14] IDEX_aludata2[13] IDEX_aludata2[12] IDEX_aludata2[11] IDEX_aludata2[10] IDEX_aludata2[9] IDEX_aludata2[8] IDEX_aludata2[7] IDEX_aludata2[6] IDEX_aludata2[5] IDEX_aludata2[4] IDEX_aludata2[3] IDEX_aludata2[2] IDEX_aludata2[1] IDEX_aludata2[0] -autobundled
netbloc @IDEX_aludata2 1 2 4 1270 170 N 170 2140 60 2900
load netBundle @MEMWB_regread2 4 MEMWB_regread2[3] MEMWB_regread2[2] MEMWB_regread2[1] MEMWB_regread2[0] -autobundled
netbloc @MEMWB_regread2 1 1 1 N
load netBundle @flash_data 16 flash_data[15] flash_data[14] flash_data[13] flash_data[12] flash_data[11] flash_data[10] flash_data[9] flash_data[8] flash_data[7] flash_data[6] flash_data[5] flash_data[4] flash_data[3] flash_data[2] flash_data[1] flash_data[0] -autobundled
netbloc @flash_data 1 7 3 4120 1920 4480 2040 N
load netBundle @EXMEM_regresultinput 16 EXMEM_regresultinput[15] EXMEM_regresultinput[14] EXMEM_regresultinput[13] EXMEM_regresultinput[12] EXMEM_regresultinput[11] EXMEM_regresultinput[10] EXMEM_regresultinput[9] EXMEM_regresultinput[8] EXMEM_regresultinput[7] EXMEM_regresultinput[6] EXMEM_regresultinput[5] EXMEM_regresultinput[4] EXMEM_regresultinput[3] EXMEM_regresultinput[2] EXMEM_regresultinput[1] EXMEM_regresultinput[0] -autobundled
netbloc @EXMEM_regresultinput 1 6 1 3440
load netBundle @B 3 B[2] B[1] B[0] -autobundled
netbloc @B 1 9 1 N
load netBundle @Ram2Data 16 Ram2Data[15] Ram2Data[14] Ram2Data[13] Ram2Data[12] Ram2Data[11] Ram2Data[10] Ram2Data[9] Ram2Data[8] Ram2Data[7] Ram2Data[6] Ram2Data[5] Ram2Data[4] Ram2Data[3] Ram2Data[2] Ram2Data[1] Ram2Data[0] -autobundled
netbloc @Ram2Data 1 7 3 4100 1900 4500 2020 N
load netBundle @pc_imm 16 pc_imm[15] pc_imm[14] pc_imm[13] pc_imm[12] pc_imm[11] pc_imm[10] pc_imm[9] pc_imm[8] pc_imm[7] pc_imm[6] pc_imm[5] pc_imm[4] pc_imm[3] pc_imm[2] pc_imm[1] pc_imm[0] -autobundled
netbloc @pc_imm 1 6 1 N
load netBundle @basicDatabus 8 basicDatabus[7] basicDatabus[6] basicDatabus[5] basicDatabus[4] basicDatabus[3] basicDatabus[2] basicDatabus[1] basicDatabus[0] -autobundled
netbloc @basicDatabus 1 9 1 N
load netBundle @vgawaddr 11 vgawaddr[10] vgawaddr[9] vgawaddr[8] vgawaddr[7] vgawaddr[6] vgawaddr[5] vgawaddr[4] vgawaddr[3] vgawaddr[2] vgawaddr[1] vgawaddr[0] -autobundled
netbloc @vgawaddr 1 8 1 4500
show
zoom 0.822205
scrollpos 1053 -208
#
# initialize ictrl to current module CPU work:Behavioral:CPU.vhd
ictrl init topinfo |
