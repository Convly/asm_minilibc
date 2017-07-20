	BITS	64

	SECTION	.text

	GLOBAL	strcasecmp:function

strcasecmp:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RCX, RCX
	XOR	R8, R8
	XOR	R9, R9

loop:
	MOV	R9B, byte [RSI + RCX]
	MOV	R8B, byte [RDI + RCX]
	JMP	to_lower
end_lower:	
	CMP	R9B, 0
	JE	diff
	CMP	R8B, 0
	JE	diff
	CMP	R9B, R8B
	JNE	diff
end_loop:
	INC	RCX
	JMP	loop

diff:
	XOR	RAX, RAX
	SUB	R8, R9
	MOV	RAX, R8
	LEAVE
	RET
	
to_lower:
to_lower8:	
	CMP	R8B, 65
	JL	to_lower9
	CMP	R8B, 90
	JG	to_lower9
	ADD	R8B, 32
to_lower9:
	CMP	R9B, 65
	JL	end_lower
	CMP	R9B, 90
	JG	end_lower
	ADD	R9B, 32
	JMP	end_lower
