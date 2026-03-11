

SECTION .data 
	Mon db "Hello", 0
	MonLen equ $-Mon
SECTION .text 
	global _start 

_start : 
	mov rax , 0 
	lea rdx ,[ptr_table +rax * 8 ]
	sub rsp , 16 
	call [rdx] 
	add rsp , 16 
	
	mov rax , 0x3c 
	mov rdi , 0
	syscall
func1 : 
	mov rax , 1 
	mov rdi , 1
	mov rsi , Mon
	mov rdx , MonLen
	syscall
	xor rax, rax 
	ret 
func2: 
	mov rax , 1 
	mov rdi , 1
	mov rsi , Mon
	mov rdx ,2 
	syscall 
	xor rax, rax 
	ret 
func3: 
	mov rax , 1 
	mov rdi , 1
	mov rsi , Mon
	mov rdx ,4 
	syscall 
	xor rax, rax 
	ret 
	
; jump table
ptr_table : 
	dq func1 , func2 , func3 
; 
