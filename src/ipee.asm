
SECTION .data 
	boot db "Boot", 0 
	bootLen equ $-boot +1 
SECTION .text 
	global _start 

loo: 
	mov rax , 1
	mov rdi , 1 
	mov rsi , boot 
	mov rdx , bootLen
	syscall 
	xor rax , rax 
	ret 

_start : 
	sub rsp , 16 
	lea rax , loo
	call rax 
	add rsp , 16 


	mov rax , 0x3c 
	mov rdi , 0 
	syscall 
