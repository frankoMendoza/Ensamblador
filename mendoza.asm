; Prueba de Lenguaje Ensamblador
; Nombre: Franco Mendoza Guaman
; Fecha: 24 de Junio del 2019
; Docente: Ing. René Guamán

section .data
	msg1 db 10,'División',10,0
	lmsg1 EQU $ - msg1
 
	msg2 db	10,'Ingrese el valor de N1: '
	lmsg2 EQU $ - msg2
	
	msg3 db	10,'Ingrese el valor de N2: '
	lmsg3 equ $ - msg3
	
	msg4 db	10,'El cociente es: '
	lmsg4 equ $ - msg4
	
	msg5 db	10,'El residuo es: '
	lmsg5 equ $ - msg5
	
section .bss
	a resb 01	
	
	b resb 01	
	
	c resb 01 	;cociente
	
section .text
	global _start
	
_start:

	mov eax, 04
	mov ebx, 01
	mov ecx, msg1
	mov edx, lmsg1
	int 80h
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
	
	mov eax, 03
	mov ebx, 01
	mov ecx, a
	mov edx, 02
	int 80h
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msg3
	mov edx, lmsg3
	int 80h

	mov eax, 03
	mov ebx, 01
	mov ecx, b
	mov edx, 02
	int 80h

	mov cx, 0
	add cx, '0'
	mov [c], cx

	jmp resta
	
mayor:
	mov al, [a]
	mov bl, [b]
	cmp al, bl
	JG resta
	cmp al, bl
	JZ resta
	Jmp salir
	
salir:
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msg4
	mov edx, lmsg4
	int 80h
	
	mov eax, 04
	mov ebx, 01
	mov ecx, c
	mov edx, 01
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msg5
	mov edx, lmsg5
	int 80h
	
	mov eax, 04
	mov ebx, 01
	mov ecx, a
	mov edx, 01
	int 80H

	mov eax, 01
	int 80H
		
resta:
	
	mov al, [a]
	mov bl, [b]
 
	sub al, '0'
	sub bl, '0'
 
	sub al, bl
 
	add al, '0'
	mov [a], al
	
	add bl, '0'
	mov [b], bl
	
	mov cl, [c]
	inc cl
	mov[c], cl
	
	jmp mayor


