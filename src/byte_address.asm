
; Author : Pascahl Ahanmisi 


SECTION .data 
	fmtStr1 db "i[0] =%d", 10 ,0 
	fmtStr2 db "i[1] =%d", 10 ,0 
	fmtStr3 db "i[2] =%d", 10 ,0 
	fmtStr4 db "i[3] =%d", 10 ,0 

	i dd 0, 22, 44 , 3 

SECTION .text 
	global _start 
	extern printf 

_start : 
	mov rcx , 0 
	mov rdi , fmtStr1 
	mov rax , i 
	mov esi , dword[rax + rcx *4 ]
	xor rax, rax
	push rcx 
	call printf

	pop rcx 
	inc rcx 
	mov rdi , fmtStr2 
	mov rax , i 
	mov esi , dword[rax + rcx *4 ]
	xor rax, rax 
	push rcx 
	call printf

	pop rcx 
	inc rcx 
	mov rdi , fmtStr3 
	mov rax , i 
	mov esi , dword[rax + rcx *4 ]
	xor rax, rax
	push rcx 
	call printf 

	pop rcx 
	inc rcx 
	mov rdi , fmtStr4 
	mov rax , i 
	mov esi , dword[rax + rcx *4 ]
	xor rax, rax 
	call printf 

	; termination 
	mov rax , 0x3c 
	mov rdi , 0 
	syscall 
