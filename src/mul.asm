; Author : paschal Ahanmisi 

; Multplication of signed and unsigned numbers 
%define ABC 0 
SECTION .text
	global _start 

_start : 
	mov rdi , 4
	imul rax , rdi , 24 
	;Terminatio  of the function 
	mov rax , 0x3c 
	xor rdi , rdi 
	syscall 


