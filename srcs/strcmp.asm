	BITS	64

	SECTION	.text

	GLOBAL	strcmp:function

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RCX, RCX
	XOR	R8, R8
	XOR	R9, R9

loop:
	MOV	R9B, byte [RDI + RCX]
	MOV	R8B, byte [RSI + RCX]
	CMP	R9B, 0
	JE	diff
	CMP	R8B, 0
	JE	diff
	CMP	R9B, R8B
	JNE	diff
	INC	RCX
	JMP	loop

diff:
	XOR	RAX, RAX
	SUB	R9, R8
	MOV	RAX, R9
	LEAVE
	RET
