section .data 
	salto db 10,''
	
section .bss
	a resb 01

section .text
	global _start

_start:

	mov ecx, 09
	mov ebx, 01
	mov ax, 01
	add ax, '0'
	mov [a], ax
	
l1:
	push ecx
	push ebx
	call enter
	pop ecx
	push ecx
	
l2:
	push ecx
	add ecx, '0'
	mov [a], ecx
	
	call imprimir
	
	pop ecx
	loop l2

	pop ebx
	inc ebx
	pop ecx
	loop l1
	
	call enter
	
	jmp salir

imprimir:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, a
	mov edx, 1
	int 80h
	ret
	
enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, salto
	mov edx, 1
	int 80h
	ret
	
salir:
	mov eax, 01
	int 80H
