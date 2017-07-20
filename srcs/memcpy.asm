	BITS    64                      ;64b

	SECTION .text			; code goes here

	GLOBAL  memcpy:function		; Global declaration for memcpy

	;; ARG1 -> void*	(dst)
	;; ARG2 -> const void*	(src)
	;; ARG3 -> size_t	(n)

memcpy:
	PUSH	RBP	    ; Prologue:
	MOV	RBP, RSP
	MOV     RCX, 0			; Init counter (RCX)
	XOR	RAX, RAX		; Init return value (RAX)
	XOR	R8, R8			; Init temporary register (R8)
loop:
	CMP	RCX, RDX		; Counter condition (based on (n))
	JE	retu			; |--> End call
	MOV	R8B, BYTE[RSI + RCX]	; Get (src) at counter (RCX) pos
	MOV     BYTE[RDI + RCX], R8B	; Replace (dst) at counter (RCX) pos with (src) at counter (RCX) pos
	INC     RCX			; Increment our counter (RCX)
	JMP     loop			; New lap in the loop

retu:
	MOV	RAX, RDI
	LEAVE			; Set return value (RAX) with (src)
	RET				; END

	
