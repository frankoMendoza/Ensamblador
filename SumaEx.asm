;LENGUAJE ENSAMBLADOR
;NOMBRE: Franco Mendoza.
;FECHA: 14 de junio del 2019.

;	Suma con Acarreo

section .data
	msj0 dd 10, 'Suma de dos valores con acarreo', 10
	lmsj0 EQU $-msj0
	
	msj1 dd 10, 'Ingrese el valor de N1:'
	lmsj1 EQU $-msj1
	
	msj2 dd 10, 'Ingrese el valor de N2:'
	lmsj2 EQU $-msj2
	
	msj3 dd 10, 'El resultado es: ',0
	lmsj3 EQU $-msj3

section .bss
	a resd 02
	b resd 02
	c resd 02
	suma resd 02
	
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
	mov edx, lmsj1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 03
	int 80H

	mov eax, 04
	mov ebx, 02
	mov ecx, msj2
	mov edx, lmsj2
	int 80H
	
	mov eax, 03
	mov ebx, 01
	mov ecx, b
	mov edx, 03
	int 80H
	
	mov al, [a+0]
	mov bl, [b+0]
	sub al, '0'			
	sub bl, '0'
		
	add al, bl
	add al , '0'
	mov[suma], al
		
	mov eax, 04
	mov ebx, 01
	mov ecx, msj3
	mov edx, lmsj3
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, suma
	mov edx, 02
	int 80H
	
	mov al, [a+1]
	mov bl, [b+1]
	sub al, '0'			
	sub bl, '0'
		
	add al, bl
	add al , '0'
	mov[suma], al
	
	mov eax, 04
	mov ebx, 01
	mov ecx, suma
	mov edx, 02
	int 80H

	mov eax, 01
	int 80H
	
	
