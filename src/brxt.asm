; Bit extraction 
SECTION .data 
	value db "The value is %.4X the extract is %.4X", 10 , 0 

SECTION .text

	global _start 
	extern printf 

_start : 
	mov eax , 0Xff
	xor rdi , rdi 
	or edi , 0X203

	bextr esi ,  eax , edi
	nop 
	nop
	; call printf 
	sub rsp , 16 
	mov rdi , value 
	mov edx , esi 
	mov edi , eax 
	xor rax , rax 
	call printf 
	add rsp , 16 
	; temrinating function 
	mov rax , 0x3c 
	mov rdi , 0 
	syscall 

