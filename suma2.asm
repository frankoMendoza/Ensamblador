section .data
	numero1 db 'Ingresar el valor a: '
	len_n1 EQU $-numero1
	numero2 db 10, 'Ingresar el valor b: '
	len_n2 EQU $-numero2
	resultado db 10, 'Valor de la sumatoria: '
	len_s EQU $-resultado
	
section .bss
	a resb 1
	b resb 1
	suma resb 1
	
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, numero1
	mov edx, len_n1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 2
	int 80H
	
	
	mov eax, 04
	mov ebx, 01
	mov ecx, numero2
	mov edx, len_n2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 2
	int 80H	
	
	mov ax, [a]
	mov bx, [b]
	sub ax, '0'			; combierte la cadena a numero
	sub bx, '0'
		
	add ax, bx
	add ax, '0'			; convierte el numero a cadena
	mov[suma], ax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, resultado
	mov edx, len_s
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, suma
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
