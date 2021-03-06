SECTION TEXT

read:      	PUA
		PUB
		PUC
		PUD
		PUE

		SETUP_PRINT(read_title, 0, 2)
		CALL(putstr, _rd_h1)
_rd_h1:		SETUP_PRINT(read_enter_address, 0, 23)
		CALL(putstr, _rd_h2)
_rd_h2:		SETUP_PRINT(erase_cmd_str, 0, 24)
		CALL(putstr, _rd_rd)
_rd_rd:		SETUP_PRINT(cursor_str, 0, 24)
		CALL(putstr, _rd_h3)	

_rd_h3:		MIA 2
		MIB 24
		CALL(readstr, _rd_h4)
_rd_h4:		MIA 0x20
		MIB 23
		MIC 24
		CALL(fill_screen, _rd_h5)
_rd_h5:		SETUP_PRINT(read_address, 0, 3)
		CALL(putstr, _rd_h6)
_rd_h6:		LADR(0x83, 0x00, A, B)
		CALL(putstr, _rd_exit)




_rd_exit: 	POE
		POD
		POC
		POB
		POA
		RET

END

SECTION DATA

read_title: 		0x52 0x65 0x61 0x64 0x20 0x62 0x79 0x74 0x65 0x20 0x66 0x72 0x6F 0x6D 0x20 0x6D 0x65 0x6D 0x6F 0x72 0x79 NULL
read_enter_address: 	0x45 0x6E 0x74 0x65 0x72 0x20 0x61 0x64 0x64 0x72 0x65 0x73 0x73 0x20 0x69 0x6E 0x20 0x68 0x65 0x78 0x61 0x64 0x65 0x63 0x69 0x6D 0x61 0x6C NULL
read_address:		0x41 0x64 0x64 0x72 0x65 0x73 0x73 0x3A 0x20 NULL
END
