section .data
	msj1 db 'Ingrese un numero'
	
section .bss
	a resb 01
	
section .text
	global _start
	
_start:

	mov eax, 04
