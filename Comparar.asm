section .data
	n1 db 10, 'Ingrese el numera a:'
	len1 EQU $-n1
	n2 db 'Ingrese el numero b:'
	len2 EQU $-n2
	igual db 'Los numeros son iguales', 10, 10
	leni EQU $-igual
	noigual db 'Los numeros no son iguales', 10, 10
	lenni EQU $-noigual
	
section .bss
	a resb 01
	b resb 01
	
section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, n1
	mov edx, len1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 02
	int 80H
	
	
	mov eax, 04
	mov ebx, 01
	mov ecx, n2
	mov edx, len2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 02
	int 80H	
	
	mov al, [a]
	mov bl, [b]
	
	cmp al, bl	; se altera badera, ZF se existe igualdad
	jz imprimir_igual
	jmp  imprimir_no_igual
		
imprimir_igual:
	mov eax, 04
	mov ebx, 01
	mov ecx, igual
	mov edx, leni
	int 80H
	jmp salir

imprimir_no_igual:
	mov eax, 04
	mov ebx, 01
	mov ecx, noigual
	mov edx, lenni		
	int 80H
	
salir:
	mov eax, 01
	int 80H
