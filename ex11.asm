; programa para construir um novo vetor a partir de um vetor existente cujos valores sejam o triplo dos valores originais

.8086
.model small
.stack 2048

dseg segment para public 'data'
     num_ele db 6
     old_vetor db 30, 60, 90, 120, 150, 180 
     new_vetor dw 6 dup(?)
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si,si
     mov bl, 3                          ;  mul só interpreta endereços
ciclo: 
     xor ax, ax                         ; limpar ax para a precisão das multiplicações
     mov al, old_vetor[si]              ; colocar em al o valor da posição si do vetor
     mul bl                             ; multiplicar ax por bl (3)
     mov new_vetor[si], ax              ; mover o valor de ax para o novo vetor na posição si
     inc si                             ; incrementar si
     cmp si, 6                          ; comparar si com 6 (tamanho do vetor)
     jne ciclo                          ; caso seja diferente ele continua a executar caso contrário ele salta fora
          
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends   

end main