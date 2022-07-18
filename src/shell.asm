
SECTION TEXT

	; RET - 0x8100 - shell cmd
shell:     	PUA
		PUB
		PUC
		PUD
		PUE

	; Offset for saving cmd
		MIE 0

		SETUP_PRINT(erase_cmd_str, 0, 24)
		CALL(putstr, _sh_sh)
	; Place '> ' for cmd trough one line
_sh_sh:		SETUP_PRINT(cursor_str, 0, 24)
		CALL(putstr, _sh_1)

	; Read every key is pressed
_sh_1:		MIB 2
		MIC 24
_sh_upd_cmd:	CALL(readkey, _sh_upd_cmd_1)

	; Check for LINE FEED to end reading cmd
_sh_upd_cmd_1:	PUB
		MIB 0xA
		CPB
		LEA(_sh_finish_cmd)
		JSZ

	; Push at the end of string new char
		POB
		PUA
		MIH 0x81
		MIA 0x00
		ADE
		MAL
		POA
		MAM
	; Increase offset by 1
		PUA
		MIA 1
		ADE
		MAE
		POA
	; Print car at screen
		CALL(putchar, _sh_upd_cmd_2)
	; Move cursor to next position
_sh_upd_cmd_2:	GET_BX(B)
		MIA 1
		ADB
		MAB
	; Loop it
		LEA(_sh_upd_cmd)
		JMP
	
	; Null terminate string
_sh_finish_cmd:	POB
		MIH 0x81
		MIA 0
		ADE
		MAL
		MIA 0
		MAM
	; Clear screen char
		CLEAR_CHAR(B)
_sh_exit:	POE
		POD
		POC
		POB
		POA
		RET


	; Process cmd saved at 0x8100
process_cmd:	PUA
		PUB
		PUC
		PUD
		PUE

		MIA 0x20
		MIB 2
		MIC 24
		CALL(fill_screen, _cmd_start)

	; Check if it is HELP cmd
_cmd_start:	LADR(0x81, 0x00, A, B)
		LL(help_cmd, C, D)
		CALL(strcmp, _cmd_help)
_cmd_help:	MIB 1
		CPB
		LEA(_check_quit)
		JRZ

		CALL(help, _prc_cmd_exit)

_check_quit:	LADR(0x81, 0x00, A, B)
		LL(quit_cmd, C, D)
		CALL(strcmp, _cmd_quit)
_cmd_quit:	MIB 1
		CPB
		LEA(_check_list)
		JRZ

		CALL(quit, _prc_cmd_exit)

_check_list:	LADR(0x81, 0x00, A, B)
		LL(list_cmd, C, D)
		CALL(strcmp, _cmd_list)
_cmd_list:	MIB 1
		CPB
		LEA(_check_read)
		JRZ

		CALL(list, _prc_cmd_exit)

_check_read:	LADR(0x81, 0x00, A, B)
		LL(read_cmd, C, D)
		CALL(strcmp, _cmd_read)
_cmd_read:	MIB 1
		CPB
		LEA(_check_write)
		JRZ

		CALL(read, _prc_cmd_exit)

_check_write:	LADR(0x81, 0x00, A, B)
		LL(write_cmd, C, D)
		CALL(strcmp, _cmd_write)
_cmd_write:	MIB 1
		CPB
		LEA(_error_cmd)
		JRZ

		CALL(write, _prc_cmd_exit)

_error_cmd:	SETUP_PRINT(error_msg, 0, 2)
		CALL(putstr, _prc_cmd_exit)

_prc_cmd_exit:	POE
		POD
		POC
		POB
		POA
		RET
END


SECTION DATA

cursor_str:	0x3E 0x20 NULL
erase_cmd_str: 	0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 NULL
error_msg:	0x55 0x6E 0x6B 0x6E 0x6F 0x77 0x6E 0x20 0x63 0x6F 0x6D 0x6D 0x61 0x6E 0x64 NULL

	; cmd
help_cmd: 	0x68 0x65 0x6C 0x70 NULL
quit_cmd: 	0x71 0x75 0x69 0x74 NULL
list_cmd: 	0x6C 0x69 0x73 0x74 NULL
read_cmd: 	0x72 0x65 0x61 0x64 NULL
write_cmd:	0x77 0x72 0x69 0x74 0x65 NULL

END
