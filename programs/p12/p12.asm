;BUILD: 
; nasm -f elf p12.asm
; ld -m elf_i386 -s -o p12 p12.o
; RUNNING:
; ./p12

section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
 		
   mov  eax,10      ;number bytes to be summed 
   mov  ebx,0      ;EBX will store the sum
   mov  ecx, ARRAY     ;ECX will point to the current element to be summed

top:  add  ebx, [ecx]

   add  ecx,1      ;move pointer to next element
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again

done: 

   add   ebx, '0'
   mov  [sum], ebx ;done, store result in "sum"

display:

   mov  edx,1      ;message length
   mov  ecx, sum   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel
	
   mov  eax, 1     ;system call number (sys_exit)
   int  0x80       ;call kernel

section	.data
global x
ARRAY:    
   db  0
   db  0
   db  0
   db  0
   db  0
   db  0
   db  0
   db  0
   db  0
   db  0

sum: 
    db 0