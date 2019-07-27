;LENGUAJE ENSAMBLADOR
;NOMBRE: Franco Mendoza.
;FECHA: 14 de junio del 2019.

;	Mayorr, Menor o Igual

section .data

	msj0 db 10, 'Ingrese el valor de N1:'
	lmsj0 EQU $-msj0
	
    msg1  db  'El número es mayor' 
    len1  EQU  $ -msg1 
   
    msg2 db  'El número es menor' 
    len2  EQU  $ - msg2
    
    msg4 db  'El los numeros son iguales' 
    len4  EQU  $ - msg4
    
    msj3 db 10, 'Ingrese el valor de N2:'
	lmsj3 EQU $-msj3

section .bss
	a resb 02
	b resb 02

section .text
    global _start  
 
	
_start:  
	mov eax, 04
	mov ebx, 01
	mov ecx, msj0
	mov edx, lmsj0
	int 80H
	
	mov eax, 03
	mov ebx, 01
	mov ecx, a
	mov edx, 02
	int 80H
	
	mov eax, 04
	mov ebx, 01
	mov ecx, msj3
	mov edx, lmsj3
	int 80H
	
	mov eax, 03
	mov ebx, 01
	mov ecx, b
	mov edx, 02
	int 80H

	cmp var1,al
	ja mayor
	jb menor
	je igual

mayor:  

   mov ah,09h
   lea dx,msg1
   int 21h
   jmp salir

menor:

   mov ah,09h
   lea dx,msg2
   int 21h
   jmp salir

igual:

   mov ah,09h
   lea dx,msg4
   int 21h
   jmp salir


salir:
	mov eax , 01
	int 80H
