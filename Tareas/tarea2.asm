section .data
	msj db 'Ingresar su nombre', 10
	len EQU $-msj
	presentar db 'Nombre ingresado', 10
	len_p EQU $-presentar
	
section .bss
	nombre resb 10
	
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, msj
	mov edx, len
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, nombre
	mov edx, 10
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, presentar
	mov edx, len_p
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, nombre
	mov edx, 10
	int 80H
	
	mov eax, 01
	int 80H
