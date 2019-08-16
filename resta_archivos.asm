%macro presentar 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro cerrarA 1
mov eax,6
mov ebx,%1
mov ecx,0
mov edx,0
int 0x80
%endmacro

section .data
	salto db '', 10
	msj db 'La resta es:',10
	len equ $ -msj
	msj1 db 'La suma es:',10
	len1 equ $ -msj1
	resta db '   '
	suma db '    '
	path1 db "/home/alex/Documentos/a1.txt", 0
	path2 db "/home/alex/Documentos/a2.txt", 0

section .bss
	num1 resb 3
	num2 resb 3
	texto resb 30
	idarchivo1 resd 01
	idarchivo2 resd 01

section .text
	global _start
_start:
	mov eax, 05			;servicio para abrir el archivo
	mov ebx, path1		; direccionn del archivo
	mov ecx, 0	 		; modod de acceso, read only = 0
	mov edx, 0			; permisos del archivo
	int 0x80			;igual a int 80H

	test eax, eax		; test es un and sin modificar sis operandos, solo modifica banderas.
	JZ salir
	
	mov dword [idarchivo1], eax		;respalda el id del archivo
	mov eax, 03
	mov ebx, [idarchivo1]
	mov ecx, num1
	mov edx, 3
	int 80H
	
	cerrarA [idarchivo1]

	mov eax, 05			
	mov ebx, path2		
	mov ecx, 0	 		
	mov edx, 0			
	int 0x80			

	test eax, eax		
	JZ salir
	
	mov dword [idarchivo2], eax		
	mov eax, 03
	mov ebx, [idarchivo2]
	mov ecx, num2
	mov edx, 3
	int 80H

	cerrarA [idarchivo2]

	mov ecx,3 
	mov esi,2 
	clc	

ciclo_resta:
	mov al, [num1+esi]
	sbb al, [num2+esi]   
	aas  
	pushf            

	or al,30h

	mov [resta+esi], al
	dec esi
	popf
	loop ciclo_resta
	presentar msj, len
	presentar resta, 3
	
	presentar  
	
	mov ecx, 03
	mov esi, 02
	clc					
	
ciclo_suma:

	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa
	pushf				
	or al, 30h		
	
	mov [suma + esi], al
	dec esi
	popf
	loop ciclo_suma	
	
	presentar msj1, len1
	presentar suma, 04

salir:
	mov eax,1
	int 80h

