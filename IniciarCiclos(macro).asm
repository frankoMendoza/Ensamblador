
%macro escribir 2
	mov eax, 04
	mov ebx, 02
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	msj db 10, 'Iniciando Ciclos.', 10
	len_msj EQU $-msj

	msj1 db 10, 'Realizando por:', 10
	len_msj1 EQU $-msj1
	
	nombre db 10, 'Franco'
	len_nombre EQU $-nombre
	
	msj2 db 10, 'Fin del ciclo', 10
	len_msj2 EQU $-msj2

section .text
	global _start

_start:
	escribir msj, len_msj

	escribir msj1, len_msj1
	
	mov cx, 5
	
l1:
	push cx
	escribir nombre, len_nombre
	
	pop cx
	loop l1
	escribir msj2, len_msj2

	mov eax, 01
	int 80H
