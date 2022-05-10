SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP
	MIA str%H
	MIB str%L
	CALL(strlen, _next)
_next:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	string.asm

SECTION DATA

str: 89 97 68 45 0

END
