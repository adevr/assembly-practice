.8086
.model small
.stack 2048

dseg segment para public 'data'
     ;
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

     ; CODIGO...
     mov bp, 2D43h
     mov di, 5028h
     mov ax, [bp][di]

     mov al, 0
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main