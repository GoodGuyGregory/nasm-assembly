;DEPENDENCIES: 
; ensure include file is in directory of the project
;
; BUILD:
; nasm -f elf64 p09.asm
; gcc -m64 -o p09 p09.o
;
; EXAMPLE OUTPUT:
;  
extern fputs, fopen, fclose

SECTION .data
    ;Create File
    filename: db "myfile.txt", 0
    fileopen: db "w",0
    ;DECLARE SPECIFIED TYPES:
    text  db "0x55,0x56,0x57"
    text2 dw "0x1234"
    text3 dd "0x12345678"
    text4 dq "0x123456789abcdef0"
    text5 dq "1.234567e20"

%macro write 1
    ;;;;;;;;;;;;;
    mov rdi, %1 
    mov rsi, r14 
    ;;;;;;;;;;;; call to write to files:
    call fputs  
%endmacro

    global main
SECTION .text
	main:
	
    ; MAIN CODE for the Program
    ;OPEN FILE:
    mov rdi, filename 
    mov rsi, fileopen 
    call fopen
    mov r14, rax
    
    ;WRITE TO FILE:
    write text
    write text2
    write text3
    write text4

    mov rdi, r14
    call fclose

    ;CLOSE THE FILE:
    mov rax, 60
    xor rdi, rdi
    syscall
