%macro presentar 2
	mov eax, 04
	mov ebx, 01
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	msj db "Leer el archivo", 10
	len EQU $-msj
	path db "/home/franco/Escritorio/Ensamblador/archivo.txt", 0
 
section .bss
	texto resb 30
	idarchivo resd 01

section .text
	global _start
	
_start:
	;;;;;;;;;;;apertura del archivo;;;;;;;;;;;;;;;;;;
	mov eax, 05			;servicio para abrir el archivo
	mov ebx, path		; direccionn del archivo
	mov ecx, 0	 		; modod de acceso, read only = 0
	mov edx, 0			; permisos del archivo
	int 0x80			;igual a int 80H

	test eax, eax		; test es un and sin modificar sis operandos, solo modifica banderas.
	JZ salir
	
	;;;;;;;;;;;;;;;;;;;,,archivo sin excepciones;;;;;;;;;;;;;;;;
	mov dword [idarchivo], eax		;respalda el id del archivo
	presentar msj, len
	
	mov eax, 03
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 25
	int 80H
	
	presentar texto, 25
	
	
	;;;;;;;;;;;cerrar el archivo;;;;;;;;;;;;;;;;;;
	mov eax, 06				;servicio para cerrar el archivo
	mov ebx, [idarchivo]	; identificador del archivo
	mov ecx, 0	 		
	mov edx, 0			
	int 0x80			
	
salir:
	mov eax, 01
	int 80H


