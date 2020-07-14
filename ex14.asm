; programa que transforma todas as letras uppercase em lowercase

.8086
.model small
.stack 2048

dseg segment para public 'data'
     texto db "AulA DE TaC", 0
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si, si                     ; limpar si 

ciclo: 
     xor ax, ax                     ; limpar ax para precisão
     mov al, texto[si]              ; o valor da posição de si da sequencia de caracteres vai para al 
     inc si                         ; incrementa si
     cmp al, 0                      ; caso al seja igual a zero salta fora
     je sai 
     cmp al, 90                      ; compara com Z 
     ja ciclo                        ; caso o valor ascii atual seja maior que o valor de Z maiusculo continua no ciclo
     cmp al, 65                      ; caso o valor ascii atual seja menor que o valor de A maiusculo continua no ciclo
     jb ciclo                   
     add al, 32                     ; caso contrário trasnforma a letra em minuscula
     mov texto[si-1], al            ; e adiciona à posição anterior
     jmp ciclo                      ; proxima iteração do ciclo

    
sai:
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends   

end main