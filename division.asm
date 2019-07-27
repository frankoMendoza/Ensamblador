section .data 
	dvs db 'Ejercicio de division'
	lendvs EQU $-dvs
	num1 db 10, 'Ingrese el dividendo'
	lenn1 EQU $-num1
	num2 db 10, 'Ingrese el divisor'
	lenn2 EQU $-num2
	divi db 10, 'El valor de la diferencia es: '
	lenv EQU $-divi
	coci db 10, 'El valor de la diferencia es: '
	lenc EQU $-coci
	
section .bss
	a resdd 1 ; dividendo
	b resdd 1 ; divisor
	c resdd 1 ; cociente
	division resb 1 ; residuo
		
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, dvs
	mov edx, lendvs
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, num1
	mov edx, lenn1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 02
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, num2
	mov edx, lenn2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 02
	int 80H	

	mov ax, [a]
	mov bx, [b]
	sub ax, '0'		
	sub bx, '0'
		
	
	div bx
	add ax, '0'	
	mov AL, c
	mov AH, division	
	
	mov eax, 04
	mov ebx, 01
	mov ecx, divi
	mov edx, lenv
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, division
	mov edx, 01
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, coci
	mov edx, lenc
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, c
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
