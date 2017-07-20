	BITS    64                      ;64b

	SECTION .text			; code goes here

	GLOBAL  memset:function		; Global declaration of memset

	;; ARG1 -> void*	(DST)
	;; ARG2 -> int		(C)
	;; ARG3 -> size_t	(n)
	
memset:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	XOR     RCX, RCX			; Initialisation of the counter (RCX)
	XOR	RAX, RAX		; Initialisation of the return value (RAX)
loop:
	CMP	RCX, RDX		; Counter condition (based on (n))
	JE	retu			; END call
	MOV     BYTE[RDI + RCX], SIL	; Put the char (c) in the (dst) memory area at pos RCX)
	INC     RCX			; Increment our counter (RCX)
	JMP     loop			; Call new lap of the loop

retu:
	MOV	RAX, RDI	 	; Set the return value (RAX) with (dst)
	LEAVE
	RET				; END

	
