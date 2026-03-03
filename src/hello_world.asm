; Author : Paschal Ahanmisi 



SECTION .data 
	fmtStr db "Hello world from Assembly ", 10 ,0  
	

SECTION .text 
	global _start 
	extern printf 

_start : 
	sub rsp ,  16 
	mov rbp , rsp 
	xor rax ,rax ; no floating point values 
	mov rdi , fmtStr 
	call printf 
	mov rsp , rbp 
	add rsp , 16


	; Termination  of function 
	mov rax , 0x3c 
	xor rdi , rdi 
	syscall 

