section .data
	n1 db 'Ingrese el numera a:'
	len1 EQU $-n1
	n2 bd 'Ingrese el numero b:'
	len2 b EQU $-n2
	c db 'los numeros son iguales: *'
	lenc EQU $-c
	
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
	mov edx, 2
	int 80H
	
	
	mov eax, 04
	mov ebx, 01
	mov ecx, n2
	mov edx, len2
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 2
	int 80H	
	
	mov al[n1]
	mov bl[n2]
	sub al '0'
	sub ah '0'
	
	cmp al, bl	; se altera badera, ZF se existe igualdad
		jz imprimir iguales
		jmp  imprimir_no_iguales
		
	imprimir_igual:
		mov ---
		--
		int 80H
		jpm salir
	
	imprimir_no_igual:
		mov....
		
		in 80H
		
	salir:
	
		mov eax 01
		int 80H
		
	
	
	
