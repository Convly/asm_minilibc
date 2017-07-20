	BITS	64			;64b

	SECTION .text			; code goes here

	GLOBAL	strlen:function		; Global declaration of the strlen function

	;; ARG1 -> const char*	(s)
	
strlen:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	MOV	RAX, 0			; Initialisation of the return value / counter (RAX)
loop:
	CMP	BYTE[RDI + RAX], 0 	; EndOfString condition
	JE	retu			; |--> GO_END
	INC	RAX			; Increment the counter (RAX)
	JMP	loop			; New lap in the loop
retu:
	LEAVE
	RET				; END
