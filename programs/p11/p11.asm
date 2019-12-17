;DEPENDENCIES: 
; ensure include file is in directory of the project
;
; BUILD:
; nasm -f elf64 p11.asm
; gcc -m64 -o p11 p11.o
;
; EXAMPLE OUTPUT:
;  
extern atoi, printf

SECTION .data
    fmt: db "%d, %d, and %d are True Pythagorean", 10, 0
    fmt2: db "%d, %d, and %d are NOT Pythagorean values", 10, 0    

%macro get_ints 2
    ;;;;;;;;;;;;;
    mov rax, %1 
    mov rdi, rax 
    ;;;;;;;;;;;; call to write to files:
    call atoi
    mov [%2], rax
%endmacro

SECTION .bss
    NUM1 resq 1
    NUM2 resq 1
    NUM3 resq 1

    global main
SECTION .text
	main:
	
    mov rbp, rsi

    ;;;;;;;;;;;;;;;;;;;;;;;
    ;; Call to Macro
    ;;;;;;;;;;;;;;;;;;;;;;;

    get_ints [sbp+8], NUM1
    get_ints [sbp+16], NUM2
    get_ints [sbp+24], NUM3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adds Numbers into accumulator registers:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov r12, [NUM1]
    imul r12, [NUM1]
    mov r13, [NUM2]
    imul r13, [NUM2]
    mov r14, [NUM3]
    imul r14, [NUM3]

    ;;;;; Begin Number Comparing ;;;;;;;
    add r13, r12
    ;;Compare Contents:
    cmp r13, r14
    je valid

;;;;; NOT VALID
notvalid:
     mov rdi, fmt2 
    mov rsi, [NUM1]
    mov rdx, [NUM2]
    mov rcx, [NUM3]
    mov rax, 0
    call printf
    jmp end

;;;;; VALID TRIPLET:
valid:

    mov rdi, fmt 
    mov rsi, [NUM1]
    mov rdx, [NUM2]
    mov rcx, [NUM3]
    mov rax, 0
    call printf
    jmp end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 end:   

        mov rax, 60
        xor rdi, rdi
        syscall
