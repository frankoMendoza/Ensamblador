section .data
	numero db 'Ingrese el numero:'
	len EQU $-numero
	
	msg1 db 10, 'Numero: x'
	len1 EQU $-msg1
	
	msg2 db 'El numero es impar saliendo'
	len2 EQU $-msg2
	
section .bss
	a resb 01

section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, numero
	mov edx, len
	int 80H
	
	mov eax, 03
	mov ebx, 01
	mov ecx, a
	mov edx, 01
	int 80H
	
	mov ax, [a]
	sub ax,'0'       
    	and ax, 1  	
    		            
	JNP salir
	mov ecx, [a]
l1:
	push ecx
	add ecx, '0'
	mov [msg1+8], dword ecx
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msg1
	mov edx, len1
	int 80h
	
	pop ecx
	loop l1


salir:

	mov eax, 04
	mov ebx, 01
	mov ecx, msg2
	mov edx, len2
	int 80H
	
	mov eax, 01
	int 80H


