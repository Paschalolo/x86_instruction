

SECTION .text
	global _start 

_start : 
	nop 

zeroBytes : 
	mov eax , 0 
	mov edx , 256 
.repeatlp: 
	mov dword[rdi + rdx *4] , eax 
	dec rdx
	jnz repeatlp 

; Termination funxtion 
	mov rax , 0x3c
	mov rdi , 0 
	syscall
