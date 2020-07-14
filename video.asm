.8086
.model small 
.stack 2048

cseg segment para public 'code'
     assume cs:cseg
main proc
     mov ax, 0B800h       ; segmento da memoria de video
     mov es, ax
 
     mov al, 'A'          ; letra     = 'A'
     mov ah, 00h          ; atributos = 0|000|0000b
     mov bx, 0
     mov cx, 80*25
ciclo: 
     mov es:[bx], al      ; letra    (codigo ASCII)
     mov es:[bx+1], ah    ; atributo (cor, ...)
     inc bx
     inc bx
     inc ah
     loop ciclo

     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main