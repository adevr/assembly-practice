.8086
.model small
.stack 2048

dseg segment para public 'data'
	comprimento byte 20			
	altura byte 5
	linha byte 12				; posição destino
	coluna byte 40
dseg ends

cseg segment para public 'code'
	assume cs:cseg, ds:dseg

main PROC
	mov ax, dseg
	mov ds, ax
	mov ax, 0B800h			;memoria de video
	mov es, ax

	xor si, si			    ;iniciar no canto superior esquerdo
	
	mov al, linha			;iniciar num local do ecra (linha/coluna)
	mov bl, 160
	mul bl
	mov di, ax
	
	mov al, coluna
	mov bl, 2
	mul bl
	add di, ax

	mov cl, altura
	mov ch, 0
ciclo_exterior:				
	; GUARDAR CX, SI, DI
	push cx
	push si
	push di
	mov cl, comprimento			
	mov ch, 0
ciclo:
	mov al, es:[si]			; ler letra		| ou mov ax, es:[si] para ambos
	mov ah, es:[si+1]		; ler atributos		|
	mov es:[di], al			; escrever letra
	mov es:[di+1], ah		; escrever atributos
	add si, 2
	add di, 2
	loop ciclo

	; REPOR CX, SI, DI
	pop di
	pop si
	pop cx
	add si, 160
	ADD DI, 160
	loop ciclo_exterior

	mov al, 0
	mov ah, 4ch
	int 21h
main ENDP

cseg ends

end main