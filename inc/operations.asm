SECTION TEXT
	; A - value
shiftr:		PUB
		PUC
		PUD
		PUE
		
		MID 0b00000010
		MIE 0b00000001
		MIC 0
		MIB 0
_loop_shr:	PUA
		AND
		CPD
		LEA(_one_shr)
		JSZ
		MIC 0x00
		LEA(_setbit_shr)
		JMP
_one_shr: 	MIC 0xFF
		LEA(_setbit_shr)
		JMP
	
_setbit_shr:	MCA
		ANE
		ORB
		MAB
		PUB
		MIB 2
		MDA
		CALL(multiply, _l1_shr)
_l1_shr:	MAD
		MIB 2
		MEA
		CALL(multiply, _l2_shr)
_l2_shr:	MAE
		POB
		MIA 0x0
		CPD
		LEA(_exit_shr)
		JSZ
		POA
		LEA(_loop_shr)
		JMP
_exit_shr:	POA
		MBA
		POE
		POD
		POC
		POB
		RET

END
