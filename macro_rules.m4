m4_define(`LEA', `MIH $1%H
		MIL $1%L')m4_dnl
m4_define(`CALL', `MIH $2%H
		MIL $2%L
		PUL
		PUH
		MIH $1%H
		MIL $1%L
		JMP')m4_dnl
m4_define(`RET', `POH
		POL
		JMP')m4_dnl
m4_define(`SAVE_REG', `PUB
		PUC
		PUD
		PUE')m4_dnl
m4_define(`LOAD_REG', `POE
		POD
		POC
		POB')m4_dnl
m4_define(`NULL', `0')m4_dnl
m4_define(`INIT_KEYBOARD', `MIH 0xF0
		MIL 0x00
		MIA 0b00000010
		MAM')m4_dnl
m4_define(`READ_KEY', `MIH 0xF0
		MIL 0x01
		MMA')m4_dnl
m4_define(`NEXT_KEY', `MIH 0xF0
		MIL 0x00
		MIC 0b00000011
		MID 0b00000010
		MCM
		MDM')m4_dnl
m4_define(`SETUP_PRINT', `MIA $1%H
		MIB $1%L
		MID $2
		MIC $3')m4_dnl
m4_define(`SET_BX', `MIH 0x80
		MIL 0x00
		M$1M')m4_dnl
m4_define(`SET_X', `MIH 0xF0
		MIL 0x02
		M$1M')m4_dnl
m4_define(`SET_BY', `MIH 0x80
		MIL 0x01
		M$1M')m4_dnl
m4_define(`SET_Y', `MIH 0xF0
		MIL 0x03
		M$1M')m4_dnl
m4_define(`PUTCHAR', `MIH 0xF0
		MIL 0x04
		MI$1 0x80
		OR$1
		MAM')m4_dnl
