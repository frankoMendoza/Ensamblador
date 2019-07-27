section .data
	msj db 10, 'Ingrese 5 numeros y presione enter', 0xa
	len_msj EQU $-msj
	
	msj1 db 10, 'El numero mayor es: ', 0xa
	len_msj1 EQU $-msj1
	
	arreglo db 0,0,0,0,0
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
	
leer:	 						;leer el resultado , debe leer 5 veces
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
	
	cmp edi, len_arreglo		; cuando edi esi menor len_arreglo
	JB leer
	
	mov ecx,0
	mov bl, 0
	
imprimir:
	mov eax, 04
	mov ebx, 01
	mov ecx, msj1
	mov edx, len_msj1
	int 80h
	
	add bl, '0'
	;mov [resultado], bl
	
	mov eax, 04
	mov ebx, 01
	mov ecx, resultado
	mov edx, 02
	int 80h

comparar:
	mov al, [arreglo+ecx]
	cmp al, bl
	JB contador
	mov bl, al
	
contador:
	inc ecx
	cmp ecx, len_arreglo
	JB comparar
	
salir:
	mov eax, 04
	mov ebx, 01
	mov ecx, salto
	mov edx, 02
	int 80h

	mov eax, 01
	int 80h
