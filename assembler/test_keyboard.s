LI R5 0xBf ;输出
SLL R5 R5 0x0

LI R1 0x00 ; x display width: 40 (data: 64 width)
LI R2 0x00 ; y display width: 30 (data: 32 height)

loop:

; get from keyboard
LI R3 0x0 
MFPC R4
ADDIU R4 0x0003	
NOP
B TESTR
NOP
LW R5 R3 0x2
NOP

; serial port
MFPC R4
ADDIU R4 0x0003
NOP
B TESTW
NOP
SW R5 R3 0x0
NOP

LI R4 0xFC ; if r3 is enter
CMP R3 R4
BTEQZ addenter
NOP

LI R4 0x28 ; x > 40 char(0x28)
CMP R1 R4
BTEQZ addy
NOP

B skip
NOP

addy:
ADDIU R2 0x1
LI R1 0x0

LI R4 0x1f ; y > 40 char(0x28)
CMP R2 R4
BTEQZ addy
NOP

skip:

LI R4 0xF0
SLL R4 R4 0x0
SLL R0 R2 0x6
OR R4 R1
OR R4 R0
SW R4 R3 0x0
NOP
ADDIU R1 0x1

B loop
NOP

addenter:
ADDIU R2 0x1
LI R1 0x0

B loop
NOP

end:
JR R7
NOP

; keyboard is read
TESTR:	
	NOP	 		
	LI R6 0x00BF 
	SLL R6 R6 0x0000 
	ADDIU R6 0x0003 
	LW R6 R0 0x0000 
	LI R6 0x0001 
	AND R0 R6 
	BEQZ R0 TESTR     ;BF01&1=0 则等待	
	NOP		
	JR R4
	NOP 

; serial is writable
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
	JR R4
	NOP 