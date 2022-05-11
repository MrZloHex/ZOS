SECTION TEXT

		MIH 0xEF
		MIL 0xFF
		LSP
		LEA(_start)
		JMP
END

.INCLUDE 	std.asm
.INCLUDE 	string.asm
.INCLUDE	keyboard.asm
.INCLUDE 	screen.asm


SECTION TEXT
	; Initialization
_start:		INIT_KEYBOARD
	
	; Welcome to screen
		SETUP_PRINT(welcome_str, 0, 0)
		CALL(putstr, start_shell)
	; Input command
start_shell:	SETUP_PRINT(cursor_str, 0, 1)
		CALL(putstr, read_cmd)
read_cmd:	CALL(readstr, _exit)
_exit: 		HLT

END

.INCLUDE 	text.asm

