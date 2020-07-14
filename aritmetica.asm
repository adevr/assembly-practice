.8086
.model small
.stack 2048

dseg segment para public 'data'
     ; VARIAVEIS...
     dia    byte 24
     ano    word 2020
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax
     
     ; CODIGO...
     mov    ax, ano  ; AX=07e4
     xchg   ax, dia  ; CX=--18
     lea    ax, ano  ; AX=0001

     ; add - soma os dois operandos e guarda o resultado no primeiro operando
     add al, 3  ; AL = Al + 3

     ;adc - soma os dois operandos e a CARRY (flag 1 bit) e guarda resultado
     adc ax, 5 ; AX = AX + 5 + CARRY(1bit = 0/1)

     ;inc - incrementa o operando
     inc ax ; AX = AX + 1

     ; sub - subtrai os dois operandos e guarda o resultado no primeiro operando
     sub al, 3  ; AL = Al - 3

     ;sbb - subtrai os dois operandos e a CARRY (flag 1 bit) e guarda resultado
     sbb ax, 5 ; AX = AX - 5 - CARRY(1bit = 0/1)

     ;dec - decrementa o operando
     dec ax ; AX = AX - 1

     ; mul (sem sinal) || imul (com sinal)
     ; operando de 8 bits ==> AX = AL * operando (8 bits)
     ; operando de 16 bits ==> DX:AX = AX * operando (16 bits)
     mov al, 10 ; ? = DIA * 10
     mul dia    ; operando de 8 bits

     mov al, 15 ; ? = 15*10
     mov cl, 10 
     mul cl     ; operando de 8 bits 

     ; div (sem sinal) || idiv (com sinal)
     ; operando de 8 bits ==> AX = AL / operando (8 bits)      AH = resto
     ; operando de 16 bits ==> AX = DX:AX / operando (16 bits) DX = resto
     mov ax, 127 ; ? = DIA * 10
     mov bl, 4    ; operando de 8 bits
     div bl       ; quociente = 127/4  resto:3
     
     ; neg (negacao) complemento de 2 de um número
     mov al, 28
     neg al ; al = -28 (complementos de 2)

     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main