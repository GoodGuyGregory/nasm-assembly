;DEPENDENCIES: 
; ensure include file is in directory of the project
;
; BUILD:
; nasm -f elf64 p09.asm
; gcc -m64 -o p09 p09.o
;
; EXAMPLE OUTPUT:
;  

%include "linux64.inc"

SECTION .data
    ;Create File
    filename db "myfile.txt", 0
    ;DECLARE SPECIFIED TYPES:
    text db "Here's some text."


    global main
SECTION .text
	main:
	
    ; MAIN CODE for the Program
    ;OPEN FILE:
    mov rax, SYS_OPEN           ;refer to included file for calls
    mov rdi, filename           
    mov rsi, 0_CREAT+0_WRONLY
    mov rdx, 0644o              ; "o" tells NASM this is an octal value for file permissions
    syscall

    ;WRITE TO FILE:
    push rax
    mov rdi, rax
    mov rax, SYS_WRITE
    mov rsi, text
    mov rdx, 17
    syscall

    ;CLOSE THE FILE:
    mov rax, SYS_CLOSE
    pop rdi
    syscall

    exit