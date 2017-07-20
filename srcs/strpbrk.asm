	BITS		64		

	SECTION		.text

	GLOBAL		strpbrk:function

strpbrk:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	MOV     RCX, 0		; Initialisation of the counter (RCX)
	XOR	RAX, RAX	
	JMP	loop

inside:
	MOV	RBX, 0
	
loop_i:
	CMP	BYTE[RSI + RBX], 0
	JE	after_inside
	MOV	DL, BYTE[RDI + RCX]
	CMP	BYTE[RSI + RBX], DL
	JE	ret_occur
	INC	RBX
	JMP	loop_i

loop:
	CMP	BYTE[RDI + RCX], 0
	JE	ret_null
	JMP	inside
after_inside:
	INC	RCX
	JMP	loop

ret_null:
	MOV	RAX, 0
	LEAVE
	RET

ret_occur:
	ADD	RDI, RCX
	MOV	RAX, RDI
	LEAVE
	RET
