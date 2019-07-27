section .data
	saludo db 'Hola ensamblador',0xa	; 0xa es un decorador
	len EQU $-saludo					; define el tamaño 
	
section .text
	global _start
	
_start:
	mov eax, 04			; ax define el tipo de operación (4=write)
	mov ebx, 01			; bx define la unidad estandar
	mov ecx, saludo		; cx se almacena la referencia de la constante saludo para imprimir
	mov edx, len			; dx define el # caracter que se va a imprimir
	int 80H				; verifica el valor de los 4 registros
	
	mov eax, 1			; ax define el tipo de operación (1=salir|exit)
	mov ebx, 0
	int 80H
