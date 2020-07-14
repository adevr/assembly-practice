.8086
.model small
.stack 2048

dseg segment para public 'data'
    num word 0
    string1 byte 'I', 1, 'S', 2, 'E', 15, 'c', 3 , 0, 0     
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax
    
    xor si, 1
    xor bx, bx
    mov al, string1[si]
    mov bx, num
    jmp ciclo

ciclo: 
    cmp string1[si], 0
    ja incrementa
    je nada
    add si, 2
    loop ciclo

incrementa:
    mov al, string1[si]
    add bl, al
    add si, 2
    loop ciclo

nada : 
    mov num, bx
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main