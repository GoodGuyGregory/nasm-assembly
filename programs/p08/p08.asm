extern printf, atoi

SECTION .data
fmt1: db "Your total is: %d", 10,0
fmt2: db "Expression Causes an Overflow", 10,0

SECTION .bss
    value1 resd 1
    value2 resd 1
    sum resd 1

global main
SECTION .text

main: 

    ;prepare program for operation:
    mov rax, 0
    mov rdi, 1
    mov esi, value1
    mov rdx, 40
    syscall

    mov edi, value1 ;use c function atoi in edi register
    call atoi
    mov r14d, eax

    mov rax, 0
    mov rdi, 1
    mov esi, value2
    mov rdx, 40
    syscall

    mov edi, value2
    call atoi 
    mov r15d, eax 

    add r14d, r15d
    mov [sum], r14d
    jo overflow

nooverage: 
    mov rdi, fmt1   ;set the approproate message 
    mov rsi, [sum] 
    mov rax, 0
    call printf
    jmp end

    ;logic for if the overflow occurs:
overflow: 

    mov rdi, fmt2
    mov rsi, [sum]
    mov rax, 0
    call printf     ;display message for overflow for user

end: 
    mov rax, 60
    xor rdi, rdi    ;clear registers
    syscall         ;end program