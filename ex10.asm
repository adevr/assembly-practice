; programa para somar os elementos de dois vetores colocando o resultado num terceiro

.8086
.model small
.stack 2048

dseg segment para public 'data'
     vetor1 db 0, 1, 2, 3, 4
     vetor2 db 0, 1, 2, 3, 4
     resultado dw 5 dup(?)
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si,si
ciclo: 
     xor ax, ax                             ; limpar ax para que a soma seja precisa
     mov al, vetor1[si]                     ; passar o valor da posição si do vetor para al
     add al, vetor2[si]                     ; adicionar o valor da posição si do vetor1 com a do vetor 2
     mov resultado[si], ax                  ; colocar o resultado na posição si do vetor onde fica o resultado
     inc si                                 ; incrementar si 
     cmp si, 5                              ; como os vetores têm tamanhos iguais, comparo com 5 
     jne ciclo                              ; se não for igual volta a executar, caso contrário salta fora
          
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends   

end main