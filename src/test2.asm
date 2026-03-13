
; AUThor: Pascahl Ahanmisi 

SECTION .text 

	global _start 

_start : 
	mov rax , 0x33
	mov ah , al
	and ah , 0XF0
	and al , 0XF
	; fini voila 
