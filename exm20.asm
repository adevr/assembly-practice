.8086
.model small
.stack 2048

dseg segment para public 'data'
     texto db "I1S2E15C3", 0
     soma db 0
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si, si
     xor bx, bx
     xor ax, ax
     mov bl, 10                         ; operador 10

ciclo: 
     mov al, texto[si]                  ; posição si do vetor texto vai para al
     cmp al, 0                          ; caso seja 0 salta fora
     je sai

     cmp al, '9'                        ; caso seja maior que 9 avança para a próxima posição
     ja avanca
     cmp al, '0'                        ; caso seja menor que 0 avança para a próxima posição
     jb avanca

compara:
     mov ah, texto[si+1]                ; verificar se a próxima posição é númerica
     cmp ah, '0'
     jb passa_unidades                  ; caso não seja numerica soma simplesmente o valor numérico
     cmp ah, '9'
     ja passa_unidades                  ; caso não seja numerica soma simplesmente o valor numérico
                                        
     sub al, 48                         ; caso seja passa o valor para númerico
     mul bl                             ; multiplica por 10
     add soma, al                       ; e soma ao al (armazena a soma total)
     jmp avanca

passa_unidades:
     sub al, 48                         ; soma o valor numerico 
     add soma, al

avanca: 
     inc si                             ; incrementa si
     jmp ciclo

sai: 
     mov soma, bl

     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main