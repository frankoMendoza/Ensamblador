section .data
	msj0 db 10, 'Pila', 10
	lmsj0 EQU $-msj0
	
    aste  db   '*' 
    
    msj1 db 10, 'Ingrese un numero'
	len1 EQU $-msj1
	
	salto db 10, ''
    
section .bss
	pila resb 10
	a resb 01    	;cantidad fila
	b resb 01		;contador columna
	
section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, msj0
	mov edx, lmsj0
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msj1
	mov edx, len1
	int 80H
	
	mov eax, 03
	mov ebx, 01
	mov ecx, a
	mov edx, 2
	int 80H	
	
	
	mov ax, [a]
	mov [b], ax
	
	jmp principal

principal:
	cmp bx, 0
	JZ salir
	jmp fila

fila:
	cmp ax, 0
	JZ columna
	jmp imprimir

columna:
	
	dec bx
	push bx
	pop bx
	JMP principal


imprimir:
	dec ax
	push ax
	
	mov eax, [aste]
	mov [pila], ax
	
	mov eax, 04
	mov ebx, 01
	mov ecx, pila
	mov edx, 09
	int 80H

	pop ax
	jmp fila
	
salir:
	mov eax, 01
	int 80H
