;; Making of a strlen using avx 2


SECTION .data
	string1 dq "How are you today sunday", 10 , 0
	string2 dq 0, 0 ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	size dq 0 
	psize db "The size of string is %ld",0
	notff dq "not found", 10 , 0 

SECTION .text 
	global _start 
	extern printf
	extern stdout 
	extern fflush 
_start : 
	vmovdqu ymm0 , [string1]
	vpxor ymm1 , ymm1 , ymm1 
	vpcmpeqb ymm3 , ymm0 , ymm1 
	vpmovmskb edi , ymm3
	test edi , edi 
	jz not_found  
	tzcnt  edi  , edi  

found : 
	mov esi , edi 
	mov rdi , psize

	xor rax , rax 	
	sub rsp , 8
	call printf
	add rsp, 8 
	mov rdi , [stdout] 
	call fflush
	jmp exit 
not_found : 
	xor rax ,rax 
	mov rdi , notff
	sub rsp , 8 
	call printf 
	add rsp , 8 
exit :
	mov rax , 0x3c 
	mov rdi , 0 
	syscall 
