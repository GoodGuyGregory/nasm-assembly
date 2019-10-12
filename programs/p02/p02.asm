%macro write_string 2
        mov   eax, 4
        mov   ebx, 1
        mov   ecx, %1
        mov   edx, %2
        int   80h
   %endmacro

   %macro exitsys 1
        mov eax,%1              ;system call number (sys_exit)
        int 0x80                ;call kernel
   %endmacro
section         .text
   global _start                ;must be declared for using gcc

_start:                         ;tell linker entry point
   write_string msg1, len1
   write_string msg2, len2
   exitsys 1

section         .data
msg1 db         'Greg Witt',0xA,0xD
len1 equ $ - msg1
msg2 db __DATE__,  0xA,0xD
len2 equ $- msg2