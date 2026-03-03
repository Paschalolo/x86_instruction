
; program showing user defined procedure call 

; Author : Pascahl Ahanmiso 

SECTION .text 
	global _start 

; int myProc(int) ; functions multplies the 1st arg by two 
myProc : 
	add rdi , 2 
	ret ; here sj the return call 
_start : 
	xor rax , rax
	mov rdi , 78 ; moving 78 to rdi 
	call myProc 
	nop
	nop 
	; note the value of rax is greater than rdi 
	; rax > rdi 
	; system terminate 
	mov rax , 0x3c 
	mov rdi , 0 
	syscall 

