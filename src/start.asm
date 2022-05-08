.INCLUDE 	std.asm

SECTION TEXT

		MIH 0xEF
		MIL 0xFF
		LSP
		LEA(_start)
		JMP
END


.INCLUDE	keyboard.asm


SECTION TEXT

_start:		CALL(readkey, _next)
_next: 		HLT
END
