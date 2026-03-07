; Author : pascha l Ahanmisi 

SECTION .data 
	zeroString db "This is a zero terminatde string", 0 

SECTION .text 
	global _start

_start :
	lea rbx , zeroString 
	xor rax , rax 

whilelp: 
	cmp byte[rbx + rax * 1 ] , 0 
	je finito 
	inc rax 
	jmp whilelp 
finito: 
	;terrminate funxtion 
	mov rax , 0x3c 
	mov rdi , 0 
	syscall 
	
