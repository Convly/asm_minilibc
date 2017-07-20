	BITS    64                      ;64b

	SECTION .text		; code goes here

	GLOBAL  strstr:function

strstr:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	XOR     RCX, RCX
	XOR	RAX, RAX

loop:
	MOV	AL, BYTE[RDI + RCX]
	MOV	BL, BYTE[RSI + 0]
	CMP	AL, BL
	JE	equal_first	; eq case
	CMP	AL, 0
	JE	retz
end_loop:
	INC     RCX
	JMP     loop

retz:
	MOV	RAX, 0
	LEAVE
	RET

equal_first:
	XOR	RDX, RDX	;xor
	MOV	RBX, RCX	;save
loop_in:
	MOV	R8B, BYTE[RDI + RBX]
	MOV	R9B, BYTE[RSI + RDX]
	CMP	R9B, 0
	JE	returu
	CMP	R8B, BYTE[RSI + RDX]
	JNE	end_loop
	CMP	R8B, 0		;
	JE	end_loop
	INC	RDX
	INC	RBX
	JMP	loop_in

returu:
	ADD	RDI, RCX
	MOV	RAX, RDI
	LEAVE
	RET

a:
	ADD	RDI, RDX
	MOV	RAX, RDI
	LEAVE
	RET
