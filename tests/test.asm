SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP
	MIA 0x80
	MIB 0x4
_next:	CALL(shiftrn, _exit)
_exit:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	math.asm
.INCLUDE 	operations.asm

SECTION DATA

str1: 89 97 0
str2: 89 97 0

END
