section .data
	salud TIMES 7 db '*',0xa	
				
	
section .text
	global _start
	
_start:
	mov eax, 04			
	mov ebx, 01			
	mov ecx, salud		
	mov edx, 7		
	int 80H				
	
	mov eax, 1			
	mov ebx, 0
	int 80H
