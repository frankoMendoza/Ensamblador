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

%macro abrirA 1
	mov eax,5
	mov ebx,%1
	mov ecx,0
	mov edx,0
	int 0x80
%endmacro

%macro asigna 2
	mov eax,3
	mov ebx,%1
	mov ecx,%2
	mov edx,3
	int 80H
%endmacro

section .data
	msg db 10, 'Los valores son: ', 10
	leng equ $ -msg
	salto db '', 10
	msj db 10,10,  'La resta es:',10
	len equ $ -msj
	msj1 db 10, 10, 'La suma es:',10
	len1 equ $ -msj1
	resta db '   '
	suma db '   '
	path1 db "/home/alex/Documentos/a1.txt", 0
	path2 db "/home/alex/Documentos/a2.txt", 0

section .bss
	num1 resb 3
	num2 resb 3
	idarchivo1 resd 01
	idarchivo2 resd 01

section .text
	global _start
_start:
	abrirA path1
	test eax, eax		
	JZ salir
	mov dword [idarchivo1], eax		
	asigna [idarchivo1], num1
	cerrarA [idarchivo1]

	abrirA path2			

	test eax, eax		
	JZ salir
	
	mov dword [idarchivo2], eax	
	asigna [idarchivo2], num2
	cerrarA [idarchivo2]

	presentar msg, leng
	presentar num1, 03
	presentar salto, 01
	presentar num2, 03
	mov ecx, 03 
	mov esi, 02 
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
	presentar suma, 03

salir:
	presentar salto, 01
	mov eax,1
	int 80h

