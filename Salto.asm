section .data
	n1 db 'Ingrese el valor a'
	lenn1 EQU $-dvs
	n2 db 10, 'Ingrese el valor b'
	lenn2 EQU $-n1
	respuesta db 10, 'El resultado ***: '
	lenr EQU $-respuesta

section .bss
	a resb 1 
	b resb 1 
	c resb 1 
	
section .text
	 global _start
	 
_start:

	jmp lectura1

	lectura1:
		mov eax, 04
		mov ebx, 01
		mov ecx, n1
		mov edx, lenn1
		int 80H
		
		mov eax, 03
		mov ebx, 01
		mov ecx, a
		mov edx, 01
		int 80H
		
		jmp lectura2
	
	lectura1:
		mov eax, 04
		mov ebx, 01
		mov ecx, n2
		mov edx, lenn2
		int 80H
		
		mov eax, 03
		mov ebx, 01
		mov ecx, b
		mov edx, 01
		int 80H
		
		jmp division
		
	suma:
		
		mov ax, [a]
		mov bx, [b]
		sub ax, '0'			; combierte la cadena a numero
		sub bx, '0'
			
		add ax, bx
		add ax, '0'			; convierte el numero a cadena
		mov[suma], ax
		
		mov [respuesta+13], qword 'sum:'
		
		mov eax, 04
		mov ebx, 01
		mov ecx, respuesta
		mov edx, lenr
		int 80H
		
		mov eax, 04
		mov ebx, 01
		mov ecx, suma
		mov edx, 01
		int 80H
		
		jmp multiplicacion
		
	resta

		mov ax, [a]
		mov bx, [b]
		sub ax, '0'		
		sub bx, '0'
			
		mov ax, bx
		add ax, '0'			
		mov[resta], ax
		
		mov [respuesta+12], qword 'res:'
		
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
		
		jmp suma
	
	multiplicacion:
		
		mov eax, [a]
		mov ebx, [b]
		sub eax, '0'		
		sub ebx, '0'
			
		mul eax, ebx
		add eax, '0'			
		mov[multiplicacion], ax
		
		mov [respuesta+13], qword 'mul:'
		
		mov eax, 04
		mov ebx, 01
		mov ecx, mult
		mov edx, lenm
		int 80H
		
		mov eax, 04
		mov ebx, 01
		mov ecx, multiplicacion
		mov edx, 01
		int 80H
		
		jmp salir
		
	division:

		mov ax, [a]
		mov bx, [b]
		sub ax, '0'		
		sub bx, '0'
			
		div bx
		add ax, '0'	
		mov AL, c
		mov AH, division	
		
		mov [respuesta+13], qword 'div:'
		
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
		
		jmp resta
	
	salir:
		mov eax, 01
		80 int
		
	
