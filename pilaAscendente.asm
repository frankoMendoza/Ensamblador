section .data 
	asterisco db '*'
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
	mov ax, [a]
	
	
l1:
	push ecx		;se envia la referencia de ecx a pila
	push ebx
	call enter
	
	mov ax, [a]
	mov ax, 1
	add ax, '0'
	mov [a], ax
	
	pop ecx
	mov ebx, ecx
	push ebx
	
l2:
	push ecx		;se envia la referencia de ecx a pila
	call imprimir
	
	mov ax, [a]
	inc ax
	mov [a], ax
	
	pop ecx
	loop l2
	;***************************************
	pop ebx
	pop ecx
	inc ebx
	loop l1			; en este instante se decrementa cx en 1
	
	call enter
	
	mov eax, 1
	int 80h

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
