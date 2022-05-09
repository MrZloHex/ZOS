SECTION TEXT

		MIH 0xEF
		MIL 0xFF
		LSP
		LEA(_start)
		JMP
END

.INCLUDE 	std.asm
.INCLUDE	keyboard.asm
.INCLUDE 	screen.asm


SECTION TEXT
	; Initialization
_start:		MIA 0
	
	; Welcome to screen
		MIA welcome_str%H
		MIB welcome_str%L
		MID 0
		MIC 0
		CALL(putstr, _next)
_next:		CALL(readkey, _exit)
_exit: 		HLT

END

.INCLUDE 	text.asm

