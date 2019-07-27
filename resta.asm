section .data 
	rest db 'Ejercicio de resta'
	lenrest EQU $-rest
	num1 db 10, 'Ingrese el minuendo'
	lenn1 EQU $-num1
	num2 db 10, 'Ingrese el sustraendo'
	lenn2 EQU $-num2
	resp db 10, 'El valor de la diferencia es: '
	lenr db $-resp
	
section .text
	global _start
	
section .bss
	a resb 1
	b resb 1
	resta resb 1
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, rest
	mov edx, lenrest
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
	mov ecx, nume2
	mov edx, lenn2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 2
	int 80H	

	mov ax, [a]
	mov bx, [b]
	sub ax, '0'		
	sub bx, '0'
		
	mov ax, bx
	add ax, '0'			
	mov[resta], ax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, resp
	mov edx, lenr
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, resta
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
