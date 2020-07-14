.8086
.model small
.stack 2048

dseg segment para public 'data'
     ; VARIAVEIS...
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     ; CODIGO...
     ; and - produto logico - E (só da 1 se ambos os bits forem 1)
     AND AL, 00001111b ; forçar a '0' os 4 bits mais significativos do al

     ;or - soma sógica 'ou' (só dá um se pelo menos um dos bits for 1)
     OR AL, 00001111b ; forçar a '1' os 4 bits menos significativos do al

     ;xor soma lógica exclusiva (só dá um se pelo menos um dos bits for 1)
     OR AL, 00001111b ; inverter os 4 bits menos significativos

     ;not     inverte todos os bits do operando
     not al   ;inverte todos os bits do al

     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main