; Aythor : Paschal Ahanmisi 


SECTION .data 
	titleStr db "Lis", 10 ,0  

	prompt db "max chemist", 0
	numJO db "value is %d converting to %d " , 10 ,0 

SECTION .text
	global _start 
	extern printf

_start : 
	sub rsp , 16 
	lea rdi , numJO
	mov esi , 85 
	mov edx , esi 
	not edx 
	add edx , 1
	
	xor rax, rax 
	call printf 
	add rsp , 16 

	mov rax , 0x3c 
	mov rdi, 0 
	syscall 
