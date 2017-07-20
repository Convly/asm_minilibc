	BITS	64

	SECTION	.text

	GLOBAL	strcspn:function

strcspn:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RCX, RCX
	XOR	R8, R8
	XOR	R9, R9

loop:
	MOV	R8B, byte [RDI + RCX]
	CMP	R8B, 0
	JE	end
	JMP	cspn
end_loop:	
	INC	RCX
	JMP	loop

end:
	XOR	RAX, RAX
	MOV	RAX, RCX
	LEAVE
	RET

cspn:
	XOR	RDX, RDX

inside_loop:
	MOV	R9B, byte [RSI + RDX]
	CMP	R9B, 0
	JE	end_loop
	CMP	R8B, R9B
	JE	end
	INC	RDX
	JMP	inside_loop

