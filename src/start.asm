SECTION TEXT

		MIH 0xEF
		MIL 0xFF
		LSP
		LEA(_start)
		JMP
END

.INCLUDE 	std.asm
.INCLUDE 	string.asm
.INCLUDE 	math.asm
.INCLUDE 	operations.asm

.INCLUDE	keyboard.asm
.INCLUDE 	screen.asm

.INCLUDE 	list.asm


SECTION TEXT
	; Initialization
_start:		INIT_SCREEN
		INIT_KEYBOARD
	
	; Welcome to screen
		SETUP_PRINT(welcome_str, 0, 0)
		CALL(putstr, shellexec)
shellexec: 	CLEAR_CHAR(B)
		SETUP_PRINT(cursor_str, 0, 2)
		CALL(putstr, _here)
_here:		CLEAR_CHAR(B)		
	; Input command
_loop:		LEA(_loop)
		JMP
_exit: 		HLT

END

.INCLUDE 	text.asm

