; Author : Pascahl Ahanmisi

 ; MAsking 


 SECTION .text
 	global _start 

_start :
	mov eax , dword[fol]
	and eax , 0xFFF
	cmp eax , 0X00
	je vile 
	; Perrfom computation of the vairable 
...
vile : 
	
