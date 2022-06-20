SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP
_next:	CALL(readstr, _exit)
_exit:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	../src/keyboard.asm
