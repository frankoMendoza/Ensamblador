;FIBONACI

section .data

	msg db 10, 'Calculo de fibonaci'
	len EQU $-msg
	msg1 db 10, 'Limite de Fibonaci: '
	len1 EQU $-msg1
	

section .bss
	a resb 01
	b resb 01
	c resb 01

section .text
	global _start
_start:

	mov eax, 04
	mov ebx, 02
	mov ecx, msg
	mov edx, len
	int 80H
	
	mov eax, 04
	mov ebx, 02
	mov ecx, msg1
	mov edx, len1
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, c
	mov edx, 02
	int 80H

	mov ax, 1
	mov bx, 0
	mov ecx, 0
	push ecx
	jmp imprimir

l1:
	
	sub ax, '0'
	pop ecx
	mov bx, [ecx]
	sub bx, '0'
	
	add ax, bx
	add ax, '0'
	mov [eax], ax
	push eax
	
	mov cx, [c]
	cmp ax, cx 
	JG imprimir
	jmp salir
	
imprimir:

	mov eax, 04
	mov ebx, 01
	mov ecx, a
	mov edx, 01
	int 80h
	jmp l1

salir:
	mov eax, 01
	int 80H
