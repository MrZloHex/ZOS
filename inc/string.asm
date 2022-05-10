SECTION TEXT
	; AB - str
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

	
	; AB - str1
	; CD - str2
strcmp:		PUE
		
		PUA
		PUB
		PUC
		PUD
		
		CALL(strlen, _l1_strcmp)
_l1_strcmp:	PUA
		MCA
		MDB
		CALL(strlen, _l2_strcmp)
_l2_strcmp:	POB
		CPB
		LEA(_exiter_strcmp)
		JRZ

_loop_strcmp:	POL
		POH
		MME
		MLB
		MHA
		CALL(inc_address, _l3_strcmp)
_l3_strcmp:	MAC
		MBD
		POL
		POH
		MMA
		PUA
		MLB
		MHA
		CALL(inc_address, _l4_strcmp)
_l4_strcmp:	POH
		PUA
		PUB
		PUC
		PUD
		
		MHA
		CPE
		LEA(_exiter_strcmp)
		JRZ
		MIE 0
		CPE
		LEA(_exitok_strcmp)
		JSZ
		LEA(_loop_strcmp)
		JMP

_exitok_strcmp:	MIA 1
		LEA(_exit_strcmp)
		JMP
_exiter_strcmp:	MIA 0
_exit_strcmp:	POD
		POC
		POB
		POB
		POE
		RET
		

END
