	BITS    64                      ;64b

	SECTION .text			; code goes here

	GLOBAL  strchr:function		; Global declaration for strchr function

	;; ARG1 -> const char*	(s)
	;; ARG2 -> int		(c)

strchr:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	XOR     RCX, RCX			; Initialisation of the counter (RCX)
	XOR	RAX, RAX		; Initialisation of the return value (RAX)
loop:
	CMP     BYTE[RDI + RCX], SIL	; Check if the char from (s) at pos (RCX) is equal to (c)
	JE      retu			; |-> END
	CMP	BYTE[RDI + RCX], 0 	; EndOfString condition
	JE	retunu			; |--> RETURN_NULL
	INC     RCX			; Increment the counter (RCX)
	JMP     loop			; New lap in the loop
retunu:
	MOV	RAX, 0
	LEAVE			; Set the return value to NULL
	RET				; END
retu:
	MOV	RAX, RDI		; Set the return value to (s)
	ADD	RAX, RCX
	LEAVE			; Move the pointer from (RAX) by adding (RCX) to it
	RET				; END

	
