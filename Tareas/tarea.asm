section .data
	saludo1 db 'Lenguaje ensamblador',0xa	
	saludo2 db 'Sexto ciclo B', 0xa
	saludo3 db 'Franco Mendoza' 0xa
	len1 EQU $-saludo1
	len2 EQU $-saludo2
	len3 EQU $-saludo3					
	
section .text
	global _start
	
_start:
	mov eax, 04			
	mov ebx, 01			
	mov ecx, saludo1		
	mov edx, len1					
	int 80H	
	
	mov eax, 1			
	mov ebx, 0
	int 80H
; ----------------------------
	mov eax, 04			
	mov ebx, 01			
	mov ecx, saludo2		
	mov edx, len2					
	int 80H	
	
	mov eax, 1			
	mov ebx, 0
	int 80H
; ---------------------------
	mov eax, 04			
	mov ebx, 01			
	mov ecx, saludo3		
	mov edx, len3						
	int 80H	
	
	mov eax, 1			
	mov ebx, 0
	int 80H
