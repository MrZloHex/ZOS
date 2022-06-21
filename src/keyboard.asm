
.DEF 	INIT_KEYBOARD
		MIH 0xF0
		MIL 0x00
		MIA 0b00000010
		MAM
		MIH 0x80
		MIL 0x00
		MAM
.ENDDEF

.DEF 	READ_KEY
		MIH 0xF0
		MIL 0x01
		MMA
.ENDDEF

.DEF 	NEXT_KEY
		MIH 0xF0
		MIL 0x00
		MIC 0b00000011
		MID 0b00000010
		MCM
		MDM
.ENDDEF

SECTION TEXT

	; RET - A char
readkey:	PUB
		PUC
		PUD

_loop_readkey:	NEXT_KEY
		READ_KEY
		PUA
	; If MSB == 1 then is available to read a key
		MIB 0b10000000
		ANB
		CPB
		POA
		LEA(_loop_readkey)
		JRZ
	; Fetch ASCII code of char
		XRB

		NEXT_KEY

		POD
		POC
		POB
		RET

	; A - x pos
	; B - y pos
	; RET - 0x8300 - string
readstr:	PUC
		PUD
		PUE
		
		MIC 0
		MAD
		SET_X(D)
		SET_Y(B)

_rs_str_loop:	CALL(readkey, _rd_str_h1)

_rd_str_h1:	MIE 0xA
		CPE
		LEA(_rd_str_exit)
		JSZ

		PUTCHAR(E)
		CLEAR_CHAR(E)

		MAE
		MIH 0x83
		MIA 0
		ADC
		MAL
		MEA
		MAM

		MIA 1
		ADC
		MAC

		MIA 1
		ADD
		MAD
		SET_X(D)

		LEA(_rs_str_loop)
		JMP

_rd_str_exit:	MIA 0
		ADC
		MAL
		MIA 0
		MAM

		POE
		POD
		POC
		RET

END

