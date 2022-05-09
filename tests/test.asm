SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP

	CALL(readkey, _next)
_next:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	../src/keyboard.asm


