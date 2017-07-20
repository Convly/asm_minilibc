	BITS	64

	GLOBAL	memmove:function
	SECTION	.text

memmove:
	PUSH	RBP
	MOV	RBP, RSP

	MOV	RAX, RDI
	MOV	R9, RAX
	SUB	R9, RSI		; R8 = dest - src

	CMP	R9, 0
	JL	return		; if src > dest (R8 < 0) --> return dest (via mov rax, rdi) 

	DEC	RDX 		; ignore \0

loop:
	CMP	RDX, 0		; return when size_t n bytes have been copied
	JL	return

	MOV	R9B, byte [RSI + RDX]
	MOV	byte [RAX + RDX], R9B ;	dest[rdx] = src[rdx]

	DEC	RDX		      ; rdx--
	JMP	loop

return:
	MOV	RSP, RBP
	POP	RBP

	RET
