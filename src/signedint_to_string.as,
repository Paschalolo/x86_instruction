; Auhtor : Oaschal 


; Integer to string 
SECTION .data 
    data1 dq 123456

SECTION .bss 
    buf resb 33

SECTION .text 
    global _start 

_start: 
    mov rdi, buf      ; Argument 1: buffer
    mov rsi, [data1]  ; Argument 2: number
    call itoStr

    ; write to screen 
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout
    mov rsi, buf 
    mov rdx, 33
    syscall 

    ; terminating 
    mov rax, 60       ; sys_exit
    xor rdi, rdi      ; exit code 0
    syscall 

itoStr:
    mov rax, rsi      ; rax = the number to convert
    mov rbx, 10       ; divisor
    mov rcx, 0        ; counter for digits

.convert_loop:
    xor rdx, rdx      ; CRITICAL: Clear rdx before div
    div rbx           ; rax = quotient, rdx = remainder
    add dl, '0'       ; convert remainder to ASCII
    push rdx          ; store digit on stack
    inc rcx           ; increment count
    test rax, rax     ; is quotient 0?
    jnz .convert_loop

    mov rbx, rcx      ; store original count to return

.copy_loop:
    pop rax           ; get digit back in correct order
    mov [rdi], al     ; store in buf
    inc rdi
    loop .copy_loop

    mov byte [rdi], 0 ; null terminator
    ret
