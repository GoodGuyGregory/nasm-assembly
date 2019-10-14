extern printf
extern scanf
extern  strlen

SECTION .data

fmt: db "Argument to be read is: %s", 10, 0
fmt2: db "%s", 0
fmt3: db "Length of Argument: %d", 10, 0
strlength dd 0

;.bss Section 
SECTION .bss
input resw 4
global main

;Text sectopm
SECTION .text

main:
        mov rdi, fmt2 ;move the value for the %s to capture the string
        mov rsi, input ;take in command line arguments
        mov al, 0 
        call scanf ;Use Scanf
        mov rdi, fmt ;Display the argument message
        mov rsi, input ;move arguments to rsi
        mov rax, 0

        call printf ;print the results thus far
        mov rdi, input ;move input into rdi register

        ;string length manipulations
        call strlen
        mov [strlength], rax ;makes the value of rax (0) into strlength
        mov rdi, fmt3 ;display message for the length
        mov rsi, [strlength] ;dereference for the value 
        mov rax, 0 
        call printf ;display the command line results
        mov rax, 60
        xor rdi, rdi
        syscall     ;exit program