ppp SEGMENT PARA STACK 'STACK'
	DB 1024 DUP('PILHA')    ; 1024 * 5 bytes =  5Kbytes 
ppp ENDS

ddd SEGMENT PARA 'DATA'
    ; ...                   ; Variaveis...
	num1 WORD 1547          ; 1547(10) = 060Bh = 000011000001011b 
	num2 SBYTE -10          ; -10(10)  = -???b = ???(C2)
	res DW 2 DUP(0)
ddd ENDS

ccc SEGMENT PARA 'CODE'
	ASSUME CS:ccc, DS:ddd, SS:ppp
aqui:
	MOV AX, ddd
	MOV DS, AX

    ; ...                   ; Codigo
    MOV AX, num1            ; "num2 = num1;"
    MOV num2, AL 

	MOV AL, 0               ; Comentario...  "return(0);"
	MOV AH, 4Ch
	INT 21h
ccc ENDS

END aqui
