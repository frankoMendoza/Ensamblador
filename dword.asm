section .data
	mensaje db 'Hola clase', 10   ; el mensaje tiene 11 espacios incluyendo el enter.
	len EQU $-mensaje
	
	
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, mensaje
	mov edx, len 
	int 80H
	
	mov [mensaje], dword 'mala'
	
	mov eax, 04
	mov ebx, 01
	mov ecx, mensaje
	mov edx, len 
	int 80H
	
	mov [mensaje+5], word 'chica'	; cambiara 2b cambia 'cl' a 'ch'
	
	mov eax, 04
	mov ebx, 01
	mov ecx, mensaje
	mov edx, len 
	int 80H

	mov eax, 01
	int 80H
