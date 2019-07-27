section .data 
	%assign signos '***'
	mensaje db 'Hola clase', signos, signos, signos, 10
	len EQU $-mensaje
	
section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, mensaje
	mov edx, len
	int 80H
	
	mov eax, 01
	int 80H
