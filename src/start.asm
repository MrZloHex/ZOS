SECTION TEXT
	; SET Stack Pointer
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

.INCLUDE 	shell.asm
.INCLUDE 	help.asm
.INCLUDE 	list.asm
.INCLUDE 	read.asm
.INCLUDE 	quit.asm


SECTION TEXT
	; Initialization
_start:		INIT_KEYBOARD
		INIT_SCREEN
	
	; Welcome to screen
		SETUP_PRINT(info_os_str, 0, 0)
		CALL(putstr, _welcome)
_welcome: 	SETUP_PRINT(welcome_str, 0, 2)
		CALL(putstr, _shell)
_shell: 	CALL(shell, _proc)
_proc:		CALL(process_cmd, _shell)

_loop: 		LEA(_loop)
		JMP
		
_exit: 		HLT

END

.INCLUDE 	text.asm

