
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

	; RET - 0x8300 - string
readstr:	PUB
		PUC
		
		MIC 0
_loop_readstr:	CALL(readkey, _after_rdk)

_after_rdk: 	MIB 0xA
		CPB
		LEA(_exit_readstr)
		JSZ
		
		MIH 0x83
		MCL
		MAM
	
		MIA 1
		ADC
		MAC
		
		LEA(_loop_readstr)
		JMP

_exit_readstr:	MIH 0x83
		MCL
		MIA 0
		MAM

		MCA

		POC
		POB
		RET

END

