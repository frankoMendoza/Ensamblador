section .data
	msg1 db 10,'Crud de Operaciones',10,0
	lmsg1 equ $ - msg1
 
	msg2 db	10,'Ingrese el valor de N1: '
	lmsg2 equ $ - msg2
 
	msg3 db 'Ingrese el valor de N2: '
	lmsg3 equ $ - msg3
 
	msg4 db	10, 10,'1. Sumar',10,0
	lmsg4 equ $ - msg4
 
	msg5 db	'2. Restar',10,0
	lmsg5 equ $ - msg5
 
	msg6 db	'3. Multiplicar',10,0
	lmsg6 equ $ - msg6
 
	msg7 db	'4. Dividir',10,0
	lmsg7 equ $ - msg7
	
	msg8 db	'5. Salir',10, 10, 0
	lmsg8 equ $ - msg8
 
	msg9 db	'Elija una Opción: ',0
	lmsg9 equ $ - msg9
 
	msg10 db	10,'Resultado: ',0
	lmsg10 equ $ - msg10
 
	msg11 db 10,'Opcion Fuera de Rango',10,0
	lmsg11 equ $ - msg11
	
	msg12 db 10,'Saliendo del Programa',10,0
	lmsg12 equ $ - msg11
 
section .bss
	opcion: resb 	2
	num1: resb	2
	num2: resb 	2
	resultado: resb 	2
 
section .text
 
	global _start
 
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, lmsg1
	int 80h
 
	; Imprimimos en pantalla el mensaje 2
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
 
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h
	
	jmp crud
	
crud:
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, lmsg4
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, lmsg5
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg6
	mov edx, lmsg6
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg7
	mov edx, lmsg7
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msg8
	mov edx, lmsg8
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
 
	mov ebx, 0
	mov ecx, opcion 	;opcion seleccionada
	mov edx, 2
	mov eax, 3
	int 80h
 
	mov ah, [opcion]	
	sub ah, '0'		
 
	cmp ah, 1
	je sumar
 
	cmp ah, 2
	je restar
 
	cmp ah, 3
	je multiplicar
 
	cmp ah, 4
	je dividir
	
	cmp ah, 5
	je salir
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg11
	mov edx, lmsg11
	int 80h
 
	jmp salir
 
sumar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	add al, bl
 
	add al, '0'
 
	mov [resultado], al
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg10
	mov edx, lmsg10
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h
 
	jmp crud
 
restar:
	
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	sub al, bl
 
	add al, '0'
	mov [resultado], al
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg10
	mov edx, lmsg10
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp crud
 
multiplicar:
 
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	mul bl
 
	add ax, '0'
 
	mov [resultado], ax
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg10
	mov edx, lmsg10
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
	
	jmp crud
 
dividir:
 
	mov al, [num1]
	mov bl, [num2]
 
	mov dx, 0
	mov ah, 0
 
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	add ax, '0'
 
	mov [resultado], ax
 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg10
	mov edx, lmsg10
	int 80h
 
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
 
	jmp crud
 
salir:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg12
	mov edx, lmsg12
	int 80h
 
	mov eax, 0
	int 80h
