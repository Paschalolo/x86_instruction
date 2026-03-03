
; Author : Paschal Ahanmisi 
; Program printing Hello world from assembly on linux system v abi 

SECTION .data 
	value db "Hello guys" , 10 , 0
	valueLen equ $-value 
SECTION .text
	global asmfunc 
	 ; void asmfunc(void); 


asmfunc : 
	push rsp 
	mov rbp , rsp 
	mov rax , 0x1; syscall write 
	mov rdi , 0x1 ; the write is to stdout 
	mov rsi , value ; address of the value to write to 
	mov rdx , valueLen  ; size of the address to print 
	syscall 
	mov rsp , rbp 
	pop rsp 
	ret 
