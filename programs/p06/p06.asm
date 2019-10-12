extern printf, scanf, strlen

SECTION .data
fmt: db "The parameter is: %s", 10, 0
fmt2: db "%s", 0
fmt3: db "Length of parameter: %d", 10, 0
strlength dd 0
SECTION .bss
input resw 4
global main
SECTION .text
main:
mov rdi, fmt2 ;set type
mov rsi, input ;grab user input
mov al, 0
call scanf ;Call scanf with previous 3 args
mov rdi, fmt ;set format
mov rsi, input ;move input into rsi argument for printf
mov rax, 0 ;no xmm registers used
call printf ;Call printf with previous 3 registers as args
mov rdi, input ;move input into rdi
call strlen ;call strlen with previous arg
mov [strlength], rax ;move return value from rax into strlength
mov rdi, fmt3 ;set format
mov rsi, [strlength] ;move value in strlength to rsi
mov rax, 0 ;no xmm registers used
call printf ;call printf with previous 3 registers as args
mov rax, 60 ; exit syscall
xor rdi, rdi
syscall ;end