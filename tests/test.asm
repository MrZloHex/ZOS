SECTION TEXT

	MIH 0xEF
	MIL 0xFF
	LSP

		MIA ptr%H
		MIB ptr%L
		MID 0
		MIC 0
		CALL(putstr, _next)
_next:	HLT

END

.INCLUDE 	std.asm
.INCLUDE 	../src/screen.asm


SECTION DATA

ptr: 0x42 0x69 0xBE 0

END
