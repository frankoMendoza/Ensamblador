; Triangulo a la Derecha

section .data
		asterisco db '*'
		nueva_linea db 10,''
		vacio db '0'
		
section .bss
	a resb 01
	b resb 01
		
section .text
		global _start
		
_start:
		mov ecx, 9
		mov ebx, 09
		mov edx, 00
		 
	
l1:
	push ecx		;se envia la referencia de ecx a pila
	push ebx
	call enter
	inc ax
	call for
	
	pop ecx
	mov ebx, ecx
	push ebx
	
l2:
	push ecx		;se envia la referencia de ecx a pila
	call imprimir
	pop ecx
	loop l2
	;***************************************
	pop ebx
	pop ecx
	dec ebx
	loop l1			; en este instante se decrementa cx en 1
	
	mov eax, 1
	int 80h

imprimir:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	ret
	
enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	ret
	
for:
	mov bx, 0
	cmp ax, bx
	JG espacio
	JZ espacio
	ret
	
espacio:
	mov eax, 4
	mov ebx, 1
	mov ecx, vacio
	mov edx, 1
	int 80h
	inc bx
	loop for
