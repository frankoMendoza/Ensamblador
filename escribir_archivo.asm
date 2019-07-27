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
	path db "/home/franco/Escritorio/Ensamblador/archivo1.txt", 0
 
section .bss
	texto resb 30
	idarchivo resd 01

section .text
	global _start
	
_start:

	mov eax, 08						;servicio ata crear y escribir en archivos	
	mov ebx, path		
	mov ecx, 2						;write	 		
	mov edx, 777		
	int 80H			

	test eax, eax
	JZ salir
	
	mov dword [idarchivo], eax		
	presentar msj, len
	
	mov eax, 03
	mov ebx, 02
	mov ecx, texto
	mov edx, 15 
	int 80h
	
	mov eax, 04
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 15
	int 80H
	
	;~ presentar texto, 25
	
	;~ mov eax, 05				
	;~ mov ebx, [idarchivo]	
	;~ mov ecx, 0	 		
	;~ mov edx, 0			
	;~ int 0x80			
	
salir:
	mov eax, 01
	int 80H


