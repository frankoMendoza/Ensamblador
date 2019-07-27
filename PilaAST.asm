section .data
	msj0 db 10, 'Pila', 10
	lmsj0 EQU $-msj0
	
    aste db '*' 
    
section .bss
	pila resb 01
	
section .text
	global _start
	
_start:

	mov ecx, 09
	JMP principal
	
	
principal:
	cmp ecx, 0
	JZ salir
	JMP imprimir


imprimir:
	dec ecx
	push ecx
	
	mov eax, [aste]
	mov [pila], eax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, pila
	mov edx, 09
	int 80H

	pop ecx
	jmp principal
	
salir:
	mov eax, 01
	int 80H
