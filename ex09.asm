; programa para copiar uma cadeia de caracteres de um vetor de bytes para outro

.8086
.model small
.stack 2048

dseg segment para public 'data'
     orig db "AULA DE TAC", 0
     destino db 0
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si, si                              ; esta linha limpa o si
ciclo:
     mov al, orig[si]                        ; e o valor da posição 0 do vetor vai para o AL
     mov destino[si], al                     ; o valor de al é colocado no valor de destino, na mesma posição
     inc si                                  ; incrementa si para este ir para a proxima posição
     cmp al, 0                               ; caso o al seja igual a 0, continua no ciclo
     jne ciclo                               ; caso contrário salta fora
     
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main