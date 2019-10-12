section .data
message: db "hello, world! from C335",10
section .text
_start: mov rax, 1         ; system call number
        mov rdi, 1         ; arg #1 in rdi, where to write (descriptor)
        mov rsi, message   ; arg #2 in rsi, start of string
        mov rdx, 24        ; arg #3 in rdx, how many bytes to write
        syscall
        mov rax, 60        ; exit syscall
        xor rdi, rdi
        syscall