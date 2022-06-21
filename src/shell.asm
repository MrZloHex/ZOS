
SECTION TEXT

	; RET - 0x8100 - shell cmd
shell:     	PUA
		PUB
		PUC
		PUD
		PUE

	; Offset for saving cmd
		MIE 0

	; Place '> ' for cmd trough one line
		GET_BY(C)
		MIA 2
		ADC
		MAC
		MID 0
		LL(cursor_str, A, B)
		CALL(putstr, _sh_upd_cmd)

	; Read every key is pressed
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

	; Check if it is HELP cmd
		LADR(0x81, 0x00, A, B)
		LL(help_cmd, C, D)
		CALL(strcmp, _cmd_help)
_cmd_help:	MIB 1
		CPB
		LEA(_prc_cmd_exit)
		JRZ
		

		GET_BY(C)
		MIA 2
		ADC
		MAC
		MID 0
		LL(help_msg, A, B)
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

help_msg: 	0x48 0x41 0x2D 0x48 0x41 0x21 0x20 0x44 0x6F 0x20 0x79 0x6F 0x75 0x20 0x77 0x61 0x6E 0x74 0x20 0x68 0x65 0x6C 0x70 0x3F 0x20 0x48 0x41 0x2D 0x48 0x41 0x21 NULL

	; cmd
help_cmd: 	0x68 0x65 0x6C 0x70 NULL

END
