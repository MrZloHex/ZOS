.DEF 	SETUP_PRINT
	; $1 - Label to string
	; $2 - X Position
	; $3 - Y Position
		MIA $1%H
		MIB $1%L
		MID $2
		MIC $3
.ENDDEF

.DEF 	SET_BX
		MIH 0x80
		MIL 0x00
		M$1M
.ENDDEF
.DEF 	SET_X
		MIH 0xF0
		MIL 0x02
		M$1M
.ENDDEF

.DEF 	SET_BY
		MIH 0x80
		MIL 0x01
		M$1M
.ENDDEF
.DEF 	SET_Y
		MIH 0xF0
		MIL 0x03
		M$1M
.ENDDEF

.DEF 	PUTCHAR
		MIH 0xF0
		MIL 0x04
		MI$1 0x80
		OR$1
		MAM
.ENDDEF

SECTION TEXT

	; A - char
	; B - X pos
	; C - Y pos
putchar:	SET_X(B)
		SET_Y(C)
		PUTCHAR(D)
		RET


	; AB - ptr to null term str
	; D  - start X pos
	; C  - start Y pos
putstr: 	PUE	

_loop_putstr:	MAH
		MBL
		MDB

		MMA
		
		PUH
		PUL
		PUB

	; Check if char isn't NULL
		MIB 0
		CPB
		LEA(_exit_putstr)
		JSZ
		
		POB
		CALL(putchar, _inc_putstr)

_inc_putstr:	MID 1
		MBA
		ADD
		MAE
		
		POB
		POA
		CALL(inc_address, _cyc_putstr)

_cyc_putstr: 	MED
		LEA(_loop_putstr)
		JMP

		
_exit_putstr:	POB
		POL
		POH
		POE
		RET

END
