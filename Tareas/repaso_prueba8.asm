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
	mov edx,10
	int 80H
%endmacro

%macro escribirA 2
	mov eax,4
	mov ebx,%1   ; [id]
	mov ecx,%2   ; texto
	mov edx,100
	int 80H
%endmacro

section .data
	msg db 10, 'Los valores son: ', 10
	leng equ $ -msg
	salto db '', 10
	numero db '          '
	igual db '='
	veces db 'veces'
	path1 db "/home/alex/Documentos/arreglo.txt", 0
	path2 db "/home/alex/Documentos/repeticion.txt", 0

section .bss
	a resb 1	
	b resb 1
	c resb 1
	d resb 1
	cont resb 1
	num resb 1
	texto resb 50
	idarchivo1 resd 01
	idarchivo2 resd 01

section .text
	global _start
_start:
	abrirA path1
	test eax, eax		
	;JZ salir

	mov dword [idarchivo1], eax		
	asigna [idarchivo1], numero
	cerrarA [idarchivo1]


	presentar msg, leng

	presentar numero, 10
	presentar salto, 01
	
	mov al,0
	mov [cont], al
	mov al, 09
	mov bl, 08
	mov [a], al
	mov [b], bl 

	jmp ciclo_compara

ciclo_compara:
	mov al, [a]
	mov bl, [b]
	mov [esi], al
	mov [ecx], bl
	
	presentar esi, 01
	
	cmp esi, 0
	jz salir

	mov al, [numero + esi]
	mov [num], al
	
	mov [a], ecx
	mov [b], esi
	
	mov cl, [c]
	mov dl, [d]
	mov [esi], cl
	mov [ecx],dl
	
	call compara
	call escribir
	
	mov esi, [b]
	dec esi
	mov [b], esi
	mov al, 0
	mov [cont], al
	
	jmp ciclo_compara	
	
compara:
	cmp esi, 0
	jz ciclo_compara

	mov al, [numero+esi]
	mov bl, [num]
	cmp bl, al
	call incrementa
	
	dec esi
	mov [esi],cl	
	mov [ecx],dl
	jmp compara

incrementa:
	mov al,[cont]
	inc al
	mov [cont], al
	ret
	
escribir:
	presentar esi, 01
	presentar igual, 01
	presentar cont, 01
	presentar veces, 05
	presentar salto, 01
	ret

salir:
	presentar salto, 01
	mov eax,01
	int 80h
