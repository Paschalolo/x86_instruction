; Demonstrating the and , xor m not or instructionhs 
; Author : Pascahl Ahanmisi 



SECTION .data 
	byteVar db 0 
	wordVar dw 0 
	dwordVar dd 0 
	qwordVar dq 0 


	leftOp dd 0xF0F0F0F
	rightOp1 dd 0XF0F0F0F0
	rightOp2 dd 0X12345678

	titleStr db "STuf to do" , 10 , 0 
	fmtStr1 db "%lx AND %lx = %lx", 10 ,0 
	fmtStr2 db "%lx OR %lx = %lx", 10 ,0 
	fmtStr3 db "%lx XOR %lx = %lx", 10 ,0 
	fmtStr4 db "NOT %lx = %lx", 10 ,0

SECTION .text 
	global _start 
	extern printf 

_start : 
	sub rsp , 16 
	mov rbp , rsp 

	; this insturctions below operaqte on the memory address not the actual value in the location 

; deomnstarating the AND instructions 
	mov al , 0 
	lea rdi , fmtStr1 
	mov esi , dword[leftOp]
	mov edx , dword[rightOp1]
	mov ecx , esi 
	and ecx , edx 
	xor rax, rax 
	call printf;

	mov rsp , rbp 
	add rsp , 16 
	; Termination of the function 
	mov rax , 0x3c 
	xor rdi , rdi 
	syscall 
