; Author :PAschaal Ahanmisi 

; PErfroming string to hex convertion 


SECTION .data 
	align 8 
	AA db "OX1234", 0
	AALen equ $-AA-1
	sweet db "The value is %d and hex is %.4x", 10 , 0 
SECTION .bss 
	align 2 
	hex resw 1 


SECTION .text 
	global _start 
	extern printf 

; uint16_t str_from_hex(const char* data, size_t size );
str_from_hex : 
	add rdi , 2 ; added 2 to prevent copying the Ox
	sub rsi, 2
	xor rax , rax ; rax will containa the answer 
.sub1:
	cmp rsi , 0
	je .fin
	mov dl , byte[rdi] ; acces value in rdi 
	cmp dl , 0X39 ; 
	jg .handleA_F
	sub dl , 0X30 
	or al , dl 
	shl rax , 4 
	dec rsi ; reduce the size 
	inc rdi
	jne .sub1
.fin:
	shr rax, 4  
	ret 

.handleA_F : 
	sub dil , 0X37 
	or al , dil 
	shl rax , 4 
	dec rsi ; reduce the size 
	inc rdi
	cmp rsi , 0 
	jne .handleA_F
	shr  rax , 4 
	ret 

_start : 
; perrfome the cod e
	mov rdi , AA 
	mov rsi , AALen
	call str_from_hex 
	sub rsp , 16
	mov rsi , rax 
	mov rdx , rax 
	mov rdi , sweet
	call printf 
	add rsp ,16
	; Termination of funvcton call 

	mov rax , 0x3c
	xor rdi , rdi 
	syscall 


	
