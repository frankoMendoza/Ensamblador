%macro escribir 2
	mov eax, 04
	mov ebx, 01
	mov ecx, %1
	mov edx, %2
	int 80H
%endmacro

section .data
	msj db 'La suma es: ', 10
	len EQU $-msj
	
	num1 db '518'
	num2 db '197'
	suma db '   ',10
	
section .text
	global _start
	
_start:

	mov ecx, 03
	mov esi, 02
	clc					; instrucción, CF = 0
	
ciclo_suma:

	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa
	pushf				; guarda en pila todos los valores de las banderas
	or al, 30h			; add 48 
						; or al, 30h 
						; add 48, add '0'
	
	mov [suma + esi], al
	dec esi
	popf
	loop ciclo_suma	
	
	escribir msj, len
	escribir suma, 04

	mov eax, 01
	int 80H
