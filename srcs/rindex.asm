	BITS    64			;64b

	SECTION .text			; code goes here

	GLOBAL  rindex:function		; Global declaration of the rindex function

	;; ARG1 -> const char*	(s)
	;; ARG2 -> int		(c)

rindex:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	CMP	BYTE[RDI + 0], 0
	JE	ret_in
	XOR	RCX, RCX		; Initialisation of the counter (RCX)
	XOR	RAX, RAX		; Initialisation of the return value (RAX)
	JMP	loop

reassign:
	XOR	RAX, RAX		; Reinitialisation of the return value (RAX)
	MOV	RAX, RDI		; Set the return value with (s)
	ADD	RAX, RCX		; Move to the correct pointer address by adding counter (RCX)
	INC	RCX			; Increment the counter (RCX)
	JMP	loop			; New lap in the loop

loop:
	CMP	BYTE[RDI + RCX], SIL	; Check if the char from (s) at pos (RCX) is equal to (c)
	JE	reassign		; |--> SAVE_NEW_POS
	CMP	BYTE[RDI + RCX], 0 	; EndOfString condition
	JE	retu			; |--> END
	INC	RCX			; Increment the counter (RCX)
	JMP	loop			; New lap in the loop
	
retu:
	LEAVE
	RET				; END

ret_in:
	MOV	RAX, RDI
	LEAVE
	RET
