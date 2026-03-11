 ; Author : PAscahl Ahanmisi 



 SECTION .text 
 	global _start 

_start : 
	cmpeqsd xmm0, xmm1 
	movd rax , xmm0
	test rax , rax 
	jnz xmm0EQxmm1  ; Branch if xmm0 == xmm1
