section .data
	mensaje db 'valor', 10
	len EQU $-mensaje
	
section .text
	global _start
	
_strart:
	mov eax, 04
	moc ebx, 02
	mov ecx, mensaje
	mov edx, len
