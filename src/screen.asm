.DEF 	INIT_SCREEN

		MIA 0
		MIH 0xF0
		MIL 0x02
		MAM
		MIL 0x03
		MAM
		MIL 0x04
		MAM
		MIH 0x80
		MAM
		MIL 0x03
		MAM
		MIL 0x02
		MAM

.ENDDEF


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
.DEF 	GET_BX
		MIH 0x80
		MIL 0x00
		MM$1
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
.DEF 	GET_BY
		MIH 0x80
		MIL 0x01
		MM$1
.ENDDEF

.DEF 	PUTCHAR
		MIH 0xF0
		MIL 0x04
		MI$1 0x80
		OR$1
		MAM
.ENDDEF

.DEF 	CLEAR_CHAR
		MIH 0xF0
		MIL 0x04
		MMA
		MI$1 0x7F
		AN$1
		MAM
.ENDDEF

SECTION TEXT

	; A - char
	; B - X pos
	; C - Y pos
putchar:	SET_X(B)
		SET_BX(B)
		SET_Y(C)
		SET_BY(C)
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

		
_exit_putstr:	CLEAR_CHAR(B)
		POB
		POL
		POH
		POE
		RET


	; A - char
	; B - start line
	; C - end line exclusive
fill_screen:	PUD
		PUE

		MID 0
		PUA
_fl_scr_loop:	POA
		SET_X(D)
		SET_Y(B)
		PUTCHAR(E)

		PUA
		MIE 1
		MDA
		ADE
		MAD

		MIA 40
		CPD
		LEA(_fl_scr_loop)
		JRZ

		MID 0

		MBA
		ADE
		MAB

		MCA
		CPB
		LEA(_fl_scr_loop)
		JRZ
		
		POA
		POD
		POE
		RET

END
