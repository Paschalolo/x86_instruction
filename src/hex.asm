; COnvertion to hex 
; showing binary and hexa decimal numbers 


%macro PRINTSTR 2
	lea rdi  , %1 
	mov rsi , qword[%2]
	mov rdx , qword[%2]
	xor rax , rax ; no floating point 
	 call printf 
%endmacro 
SECTION .data 
	i dq 1
	j dq 123
	k dq 45678992
	titleStr db "Program 2 " , 10 , 0 
	fmtStr1   db "i=%ld converted to hex %x", 10 , 0 
	fmtStr2   db "j=%ld converted to hex %x" , 10,  0 
	fmtStr3   db "k=%ld converted to hex %x", 10 ,0 

SECTION .text 
	global _start 
	extern printf 

_start : 
	sub rsp , 16 
	mov rbp , rsp 
	mov rdi , titleStr 
	xor rax , rax ; no floating ponit va;ues 
	call printf
	; printing i
	mov rdi , fmtStr1
	mov rsi , qword[i] 
	xor rax , rax 
	call printf 
	PRINTSTR fmtStr1, i 
	; printing j
	
	PRINTSTR fmtStr2, j 
	; printing k

	PRINTSTR fmtStr3, k 
	mov rsp , rbp 
	add  rsp , 16 

	; Termination of the process 
	mov rax , 0x3c
	xor rdi , rdi ; Termination process finishes without failure 
	syscall ; system call to sys _ exit function 
