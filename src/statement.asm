;Auhtor : Pascahl Ahanmisi 

; ; matching loops 

; stmLblm : 
	; mov rcx , stmLb2 


; stmLb2 : 

; Mutiplign two 64 bit to give a 128 bti product 


SECTION .data
	op1 dq 123456789
	op2 dq 234567890
SECTIOn .text 
	global _start 
	extern printf 
_start : 

mul64 : 
	push rbp 
	mov rbp , rsp 
	sub rsp  ,16
	push rbx 
	push rcx 
	
	pop rcx 
	pop rbx 
	add rsp , 16 
	mov rsp, rbp 
	pop rsp 
	ret 
	
