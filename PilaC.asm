section .data
	msj0 db 10, 'Pila', 10
	lmsj0 EQU $-msj0
	
    msj1  db  'Jose'
   
    msj2 db  'Maria' 
    len2  EQU  $ - msj2
    
section .bss
	a resb 01
	b resb 01
	nombre resb 01
	
section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, msj0
	mov edx, lmsj0
	int 80H
	
	mov eax, [msj1]
	push eax
	
	mov eax, [msj2]
	
	pop eax
	mov [nombre], eax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 04
	int 80H
	
	pop ecx
	mov[nombre], ecx
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 04
	int 80H
	
	mov eax, 01
	int 80H
