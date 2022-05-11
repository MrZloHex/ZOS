SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP
	MIA 0x80
	CALL(shiftr, _next)
_next:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	math.asm
.INCLUDE 	operations.asm

SECTION DATA

str1: 89 97 0
str2: 89 97 0

END
