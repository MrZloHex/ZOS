SECTION TEXT

	; A = A * B
multiply: 	PUC
		PUD
		PUE

		MIC 1
		MAE
		MAD
_loop_mult:	MCA
		CPB
		LEA(_exit_mult)
		JSZ
		
		MEA
		ADD
		MAE
		MIA 1
		ADC
		MAC
		LEA(_loop_mult)
		JMP
		
_exit_mult:	MEA
		POE
		POD
		POC
		RET

END
