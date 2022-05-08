.DEF 	READ_KEY
		MIH 0xF0
		MIL 0x01
		MMA
.ENDDEF

.DEF 	NEXT_KEY
		MIH 0xF0
		MIL 0x00
		MIB 0b00000011
		MIL 0b00000010
		MBM
		MCM
.ENDDEF

SECTION TEXT

readkey:	SAVE_REG
		PUA

_loop_readkey:	POA
		READ_KEY
		PUA
	; If MSB == 1 then is available to read a key
		MIB 0b10000000
		ANB
		CPB
		LEA(_loop_readkey)
		JRZ
	; Fetch ASCII code of char
		POA
		XRB

		NEXT_KEY

		LOAD_REG
		RET

END

