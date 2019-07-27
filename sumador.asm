section .data
	msj db 'La suma es: ',10	
	len EQU $-msj
	
section .bss
	suma resb 10	

section .text
	global _start
	
_start:
	mov ax, 02		
	mov bx, 05			
	add ax, bx
	add ax, '0'			; comvierte el # a cadena y <sub> para transformar de cadena a caracter
	
	mov[suma], ax	
		
	mov eax, 04			
	mov ebx, 01			
	mov ecx, msj	
	mov edx, len				
	int 80H	
	
	mov eax, 04
	mov ebx, 01
	mov ecx, suma		; el emsamblador interpreta el 7 como valor ASCI
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
