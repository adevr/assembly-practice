; programa que conta todos os espaços em branco de uma cadeia de caracteres

.8086
.model small
.stack 2048

dseg segment para public 'data'
     texto db "Aula de Tac", 0
     soma db 0
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     xor si, si                     ; limpar si 
     mov bl, soma                   ; o valor da soma passa a ser bl

ciclo: 
     xor ax, ax                     ; limpar ax para precisão
     mov al, texto[si]              ; o valor da posição de si da sequencia de caracteres vai para al 
     inc si                         ; incrementa si
     cmp al, " "                    ; compara o caracter atual, se for espaço incrementa a soma
     je incrementa                  ; incrementa a soma
     cmp al, 0                      ; compara com zero 
     je sai                         ; se o valor for 0 ele sai da execução e atribui a soma o valor presente em bl
     jmp ciclo
    
incrementa:
    inc bl
    jmp ciclo

sai: 
     mov soma, bl     
     
     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends   

end main