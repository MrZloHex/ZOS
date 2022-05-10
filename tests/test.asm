SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP
	MIA str1%H
	MIB str1%L
	MIC str2%H
	MID str2%L
	CALL(strcmp, _next)
_next:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	string.asm

SECTION DATA

str1: 89 97 0
str2: 89 97 0

END
