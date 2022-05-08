.DEF	LEA
	; Load Effective Address
		MIH $1%H
		MIL $1%L
.ENDDEF

.DEF	CALL
	; $1 - label to calling function
	; $2 - label where to return after return
		MIH $2%H
		MIL $2%L
		PUL
		PUH
		MIH $1%H
		MIL $1%L
		JMP
.ENDDEF

.DEF	RET
		POH
		POL
		JMP
.ENDDEF

.DEF 	SAVE_REG
		PUB
		PUC
		PUD
		PUE
.ENDDEF

.DEF 	LOAD_REG
		POB
		POC
		POD
		POE
.ENDDEF

