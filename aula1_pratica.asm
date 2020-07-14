PILHA SEGMENT PARA STACK 'STACK'
	DB 1024 DUP('PILHA')
PILHA ENDS

DADOS SEGMENT PARA 'DATA'
	num1 WORD 1678
	num2 SBYTE -10
	num3 BYTE -10
	num4 REAL4 -9.5

	tabela1 WORD 3 DUP(1678)     
	tabela2 BYTE 5, 10, 15, 20
	tabela3 BYTE 5 DUP(6 DUP(?))  

	string1 BYTE 'H', 'o', 'j', 'e', 0     
	string2 BYTE 'Hoje', 0                
	string3 BYTE 48h, 6Fh, 6Ah, 65h, 00h   
	string4 BYTE 72, 111, 106, 101, 0      
DADOS ENDS

CODIGO SEGMENT PARA 'CODE'
	ASSUME CS:CODIGO, DS:DADOS, SS:PILHA
INICIO:
	MOV AX, DADOS
	MOV DS, AX

    MOV AX, num1
    MOV num3, AL

	MOV AL, 3
    MOV AH, 4CH
	INT 21H	
CODIGO ENDS

END INICIO
