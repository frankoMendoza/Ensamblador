;LENGUAJE ENSAMBLADOR
;NOMBRE: Franco Mendoza.
;FECHA: 14 de junio del 2019.

;	Par o Impar


section .data

	msj0 db 10, 'Ingrese el valor de N1:'
	lmsj0 EQU $-msj0
	
    msg1  db  'El número par' 
    len1  EQU  $ -msg1 
   
    msg2 db  'El número impar' 
    len2  EQU  $ - msg2

section .bss
	a resb 02

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
	
	mov ax, [a]
	sub ax,'0'       
    and ax, 1  			;            
	JP par
	JNP impar
	
impar:
    mov   eax, 04            
    mov   ebx, 01            
    mov   ecx, msg2      
    mov   edx, len2          
    int   80H  
              
    jmp   salir

par:   
    mov   eax, 04            
    mov   ebx, 01            
    mov   ecx, msg1    
    mov   edx, len1         
    int   80H 
    
    jmp salir            

salir:
    mov   eax,01            
    int   80H   
