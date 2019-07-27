section .data
	msj0 db 10, 'Pila', 10
	lmsj0 EQU $-msj0
	
    msj1  db  10, 'Ingrese un nombre' , 0xa
    len1  EQU  $ -msj1 
   
    ;msg2 db  'El número es menor' 
    ;len2  EQU  $ - msg2
    
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
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msj1
	mov edx, len1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 05
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 05
	int 80H
	
	mov eax, [nombre]
	push eax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 05
	int 80H
	
	mov eax, [nombre]
	
	pop ecx
	mov [nombre], ecx
	
	mov eax, [nombre]
	push eax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 05
	int 80H
	
	mov eax, 01
	int 80H
    
    
