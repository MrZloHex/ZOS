SECTION TEXT

strlen: 	PUC
		MIC 0
_loop_strlen:	MAH
		MBL
		MMA
		PUH
		PUL
		MIB 0
		CPB
		LEA(_exit_strlen)
		JSZ

		MIB 1
		MCA
		ADB
		MAC
		POB
		POA
		CALL(inc_address, _loop_strlen)

_exit_strlen:	MCA
		POL
		POH
		POC
		RET

END
