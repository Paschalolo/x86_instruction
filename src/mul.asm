; Author : paschal Ahanmisi 

; Multplication of signed and unsigned numbers 
%define ABC 0
; PLaying with macros 
%define integer dword 
%define long_long qword
%define short word 
%deifne char byte 
SECTION .text
	global _start 

_start : 
	mov rdi , 4
	imul rax , rdi , 24 
	;Terminatio  of the function 
	mov rax , 0x3c 
	xor rdi , rdi 
	syscall 


