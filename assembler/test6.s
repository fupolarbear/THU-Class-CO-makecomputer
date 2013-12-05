LI r1 0x1
LI R6 0x00BF 
SLL R6 R6 0x0000
loop_begin:
ADDIU r1 0x1 
SW R6 R1 0x0000
B loop_begin
NOP
NOP