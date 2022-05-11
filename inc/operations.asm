SECTION TEXT
	; A >> B
shiftrn:	PUC
		MIC 0
_loop_shrn:	CALL(shiftr, _l1_shrn)
_l1_shrn:	PUA
		MIA 1
		ADC
		MAC
		MBA
		CPC
		POA
		LEA(_exit_shrn)
		JSZ
		LEA(_loop_shrn)
		JMP
_exit_shrn:	POC
		RET

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

	; A - value
shiftl:		PUB
		PUC
		PUD
		PUE
		
		MID 0b00000001
		MIE 0b00000010
		MIC 0
		MIB 0
_loop_shl:	PUA
		AND
		CPD
		LEA(_one_shl)
		JSZ
		MIC 0x00
		LEA(_setbit_shl)
		JMP
_one_shl: 	MIC 0xFF
		LEA(_setbit_shl)
		JMP
	
_setbit_shl:	MCA
		ANE
		ORB
		MAB
		PUB
		MIB 2
		MDA
		CALL(multiply, _l1_shl)
_l1_shl:	MAD
		MIB 2
		MEA
		CALL(multiply, _l2_shl)
_l2_shl:	MAE
		POB
		MIA 0x80
		CPD
		LEA(_exit_shl)
		JSZ
		POA
		LEA(_loop_shl)
		JMP
_exit_shl:	POA
		MBA
		POE
		POD
		POC
		POB
		RET
END
