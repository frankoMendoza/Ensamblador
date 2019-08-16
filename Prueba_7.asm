section .data
	msj db 10, 'Ingrese 10 numeros y presione enter', 0xa
	len_msj EQU $-msj

	respuesta db 10, 'Ingrese 10 numeros y presione enter', 0xa
	len_resp EQU $-respuesta
	
	arreglo db 0,0,0,0,0,0,0,0,0,0
	len_arreglo EQU $-arreglo
	
	salto db 10,''

section .bss
	resultado resb 02

section .text
	global _start

_start:
	mov esi, arreglo
	mov edi, 0
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msj
	mov edx, len_msj
	int 80h
	
leer:	 						
	mov eax, 03
	mov ebx, 01
	mov ecx, resultado
	mov edx, 02
	int 80h

	mov al, [resultado]
	sub al, '0'
	
	mov [esi], al
	inc esi
	inc edi
	
	cmp edi, len_arreglo		
	JB leer
	
	mov ecx,9
	
imprimir:
	push ecx
	mov al, [arreglo+ecx]
	add al, '0'
	mov [resultado], al

	mov eax, 04
	mov ebx, 01
	mov ecx, resultado
	mov edx, 01
	int 80h
	
	pop ecx
	dec ecx
	
	cmp ecx, 0
	JG imprimir
	JZ imprimir
	
salir:
	mov eax, 04
	mov ebx, 01
	mov ecx, salto
	mov edx, 02
	int 80h

	mov eax, 01
	int 80h
