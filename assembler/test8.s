start:
;LI R1 0x3
LI R2 0x2
LI R1 0x1
AND R1 R2
NOP
BEQZ R1 start
NOP
RET