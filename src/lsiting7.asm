

	%define  MAXLEN 256
	%define  EINVAL 22 
	%define ERANGE 34 

SECTION .data 
	titleStr db "Herro Gamer", 10 ,0 
	fmtStr1 db "Before indierect jump", 10 ,0 
	fmtStr2 db "After inderiect jump", 10 ,0

SECTION .text 
	global _start 
	extern printf 

_start : 
	sub rsp , 16 
	mov rdi , titleStr 
	xor rax ,rax 
	call printf 
	lea rdi , fmtStr1 
	xor rax ,rax 
	call printf 

	jmp [exitPoint]

exitPoint: 
	dq eecall

eecall: 
	lea rdi , fmtStr2
	xor rax , rax 
	call printf 
	add rsp , 16 
	mov rax , 0x3c 
	mov rdi , 0
	syscall 
	
	
