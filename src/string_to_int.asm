
; Author : Pascahl Ahanmisi

; Converting string to int 


SECTION .data 
	align 8 
	number db "12345" , 0 

	fmtStr1 db "The string is %s and the stuff is %ld", 10 ,0 

SECTION .bss 
	align 8 
	result resq 1 
SECTION .text
	global _start 
	extern printf 

; size_t strlen(const char *); 
strlen20 :
	xor rcx , rcx  
.stlen1: 
	cmp byte[rdi] , 0
	je .fin 
	inc rdi
	inc rcx 
	jmp .stlen1
.fin: 
	mov rax , rcx 
	ret 
; int convert_to_int(const char* restirct) ; 
convert_to_int: 
	; get size of string
	mov rsi , 0 ; this is the total 
	mov rdx , 1 ;
	mov r12 , rdi ; mov pointer to r12 to aviod register corruption on caller saved registers 
	call strlen20 ; 
	mov rcx , rax ; move size to rcx 

	mov rdi , r12 ; move pointer back to rdi
.mid : 
	xor rax , rax 
	mov al  , byte[rdi+rcx-1 ]
	sub al , 0X30 ; get true string
	push rdx 
	mul rdx ; result now in rax 
	add rsi , rax 
	pop rdx 
	; multiply rdx by 10
	mov r8 , rdx 
	shl rdx , 3; these lines are doing rdx * 10 

	lea rdx , [rdx + r8 *2 ] ; 
	dec rcx 
	cmp rcx , 0 
	jne .mid 
	mov rax , rsi 
	ret 
	; additoon (num << amount) + (2* num) 


_start : 
	; perfomrmning funciom 
	mov rdi , number 
	call convert_to_int
	; rax holds the sum 
	sub rsp , 16 ; LInUx abi function need stack aligned at 16 byte biundary 
	mov rdi , fmtStr1
	mov rsi , number 
	mov rdx , rax 
	xor rax , rax 
	call printf
	add rsp , 16


	; Terminating function 
	mov rax , 0x3c 
	xor rdi , rdi 
	syscall 
	


