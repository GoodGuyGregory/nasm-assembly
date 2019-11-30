; BUILD:
; nasm -f elf64 p07.asm
; gcc -m64 -o p07 p07.o
;
; EXAMPLE OUTPUT:
; 
; 
;
extern printf, scanf

SECTION .data
	fmt:  db "Enter a parameter: ", 0  ;welcome
	fmt1: db "The parameter is: %s", 10, 0 ;label with param
	fmt2: db "%s", 0  ;formatting for input
	fmt4: db " || is the parameter reversed", 10, 0 ;label with rev
	
	
SECTION .bss

	input resw 8	;takes input

	global main
SECTION .text
	main:
	
		mov rdi, fmt          ;set the format
		mov rsi, input        ;move input into register to printf
		mov rax, 0 
		call printf	      ;call printf
   
		mov rdi, fmt2         ;set formatting
		mov rsi, input        ;put user input into register
		mov al, 0
		call scanf            ;call scanF
		
		mov rdi, fmt1         ;set format
		mov rsi, input        ;move input into register to printf
		mov rax, 0            
		call printf	      ;call printf

		mov rcx, rax
		mov rdi, input        ;rdi and rsi used hold hold input for swaps 
		mov rsi, input    
		add rdi,rax   	      ;points to last char
		dec rdi ;
		shr rax,1 	      ;divide len in half
  	
		loop: 		     ;starts loop:
		mov bl,[rsi] 	     ;swaps chars using 8 bit registers
		mov bh,[rdi]
		mov [rsi],bh
		mov [rdi],bl
		inc rsi   	    ;increments rsi
		dec rdi		    ;decrements rdi
		dec rax 	    ;decrements counter
 		jnz loop 	    ; controls when count is zero
		
		mov rdx,rcx	    ;outputs reversed param  
		mov rdi, 1
		mov rax, 1
		syscall

		mov rdi, fmt4	   ;output fmt3
		mov rax, 0            
		call printf 
    		
		mov rax, 60        ; exit process
		xor rdi, rdi
		syscall

