section .data 
	mlt db 'Ejercicio de multiplicacion'
	lenmlt EQU $-mlt
	num1 db 10, 'Ingrese el multiplicando'
	lenn1 EQU $-num1
	num2 db 10, 'Ingrese el multiplicador'
	lenn2 EQU $-num2
	mult db 10, 'El valor del producto es: '
	lenm db $-mult
	
section .bss
	a resb 1
	b resb 1
	multiplicacion resb 1
	
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, mlt
	mov edx, lenmlt
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, num1
	mov edx, lenn1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 2
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, num2
	mov edx, lenn2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 2
	int 80H	
	
	mov eax, [a]
	mov ebx, [b]
	sub eax, '0'		
	sub ebx, '0'
		
	mul eax, ebx
	add eax, '0'			
	mov[multiplicacion], ax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, mult
	mov edx, lenm
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, multiplicacion
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
