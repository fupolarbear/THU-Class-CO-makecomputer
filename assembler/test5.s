START: ;初始化IH寄存器，最高位为1时，允许中断，为0时不允许。初始化为0，kernel不允许中断
	LI R0 0x07
	MTIH R0 ;初始化栈地址
	LI R0 0x00BF 
	SLL R0 R0 0x0000
	ADDIU R0 0x10					;R0=0xBF10 
	MTSP R0 ;mark bug
	NOP ;用户寄存器值初始化
	LI R6 0x00BF 
	SLL R6 R6 0x0000
	ADDIU R6 0x10					;R6=0xBF10 
	LI R0 0x0000
	SW R6 R0 0x0000
	SW R6 R0 0x0001
	SW R6 R0 0x0002
	SW R6 R0 0x0003
	SW R6 R0 0x0004
	SW R6 R0 0x0005
	MFPC R7 
	ADDIU R7 0x0003  
	NOP
	B TESTW 	
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	LI R0 0x004F
	SW R6 R0 0x0000
	NOP
	MFPC R7 
	ADDIU R7 0x0003  
	NOP
	B TESTW 	
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	LI R0 0x004B
	SW R6 R0 0x0000
	NOP
	MFPC R7 
	ADDIU R7 0x0003  
	NOP
	B TESTW 	
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	LI R0 0x000A
	SW R6 R0 0x0000
	NOP
	MFPC R7 
	ADDIU R7 0x0003  
	NOP
	B TESTW 	
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	LI R0 0x000D
	SW R6 R0 0x0000
	NOP
	RET
TESTW:	
	NOP	 		
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	ADDIU R6 0x0001 
	LW R6 R0 0x0000 
	LI R6 0x0001 
	AND R0 R6 
	BEQZ R0 TESTW     ;BF01&1=0 则等待	
	NOP		
	JR R7
	NOP 