
; Name : Pascahl Ahanmisi 

; using malloc and free from c stdlib 

SECTION .data
	fmtStr db "address retured by malloc : %p ", 10 ,0 

SECTION .text 
	global _start 
	extern malloc 
	extern free 
	extern printf 

_start :
	sub  rsp , 16
	mov rdi , 100 
	call malloc ; return address is in the rax 

	mov rsi , rax ; movind address to rsi 
	lea rdi , fmtStr 
	mov r13 , rax 
	xor rax , rax 
	call printf 
	mov rdi , r13 
	call free 
	add rsp , 16 
	; Termniantion of the process 
	mov rax , 0x3c
	mov rdi , 0 
	syscall
	
