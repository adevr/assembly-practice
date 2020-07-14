.8086
.model small
.stack 2048

dseg segment para public 'data'
     num1 db    1
     num2 db    2
     soma dw    ?
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
    mov ax, dseg
    mov ds, ax

    xor ah, ah      ; limpar ah
    mov al, num1    ; atribuir o valor de address1 ao al
    add ax, num2    ; somar o valor de address2 ao al
    adc ah, 0       ; adicionar a carry ao ah
    mov soma, ax    ; colocar o valor da soma na variável soma

    mov al, 0
    mov ah, 4ch
    int 21h
main endp
cseg ends

end main