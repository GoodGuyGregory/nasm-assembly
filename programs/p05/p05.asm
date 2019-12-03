
; BUILD:
; nasm -f elf64 avg3.asm
; gcc -m64 -o avg avg.o
; 
; RUNNING: 
; ./avg.o
; 
; EXAMPLE OUTPUT:
; sum=12
; avg=4
;
extern  printf                  ;stdlib C function

section .text                   ;code section
    global  main                ;standard GCC entry point

      ;EXITPRGM MACRO
%macro EXITPRGM 0
        mov rax, 60
        mov rdi, 0
%endmacro

main:
    push rbp                    ;set up stack frame: must be aligned

    ; Add 10+18+25
    mov     rax,10
    add     ax,18
    add     ax,25 

    ; Save and print sum
    push    rax
    mov     rdi,fmt1            ;printf format string
    mov     rsi,rax             ;1st parameter
    mov     rdx,0               ;No 2nd parameter
    mov     rax,0               ;No xmm registers
    call    printf

    ; Compute and print average
    mov     dx,0                ;Clear dividend, high
    pop     rax                 ;dividend, low <= sum
    mov     cx,3                ;divisor
    div     cx                  ;ax= high, dx= low

    ; Print average
    mov     rdi,fmt2            ;printf format string
    mov     rsi,rax             ;1st parameter
    mov     rdx,0               ;No 2nd parameter 
    mov     rax,0               ;No xmm registers
    call    printf

    ; Exit program
    pop rbp
    mov rax,0
    EXITPRGM

section .data                   ;data section
fmt1:
    db      "The Resulting sum=%d ",0xa,0
fmt2:
    db      "The Resulting average=%d",0xa,0