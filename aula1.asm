.8086
.model	small
.stack	2048

dseg    segment para public 'data'
	var1b            db	0ADH 												; correto no excel ->  1byte
	string         	 db	'PATA',0										    ; correto no excel -> 1 byte (5x)
	var1w           dw	173													 ; correto no excel -> 2 bytes
	var1dw         dd	10101101b									; errado no excel (tinha 4 bytes e não 2)
	var2w           word	-28										    	; correto no excel -> 2 bytes
	var3w           sword	-28										    	; correto no excel -> 2 bytes
	var2b            byte	-28										    		; correto no excel -> 1 byte
	var3b            sbyte	-28										    		; certo no excel -> 21 byte
	var2dw         dword	-28										    	; errado no excel  -> (tinha 4 bytes e n2 bytes)
	var3dw         sdword	-28										    	; correto no excel -> 4 bytes
	CharArray 	  dw    3 dup (0CCh) 									; correto no excel -> 6 bytes
	Square          byte	0, 1, 4,9,16 										; 
	ThreeD          db      2 dup (4 dup (2 dup (052h)))
	TwoD            db      2 dup (2 dup (12h))
	IntArray        word    4 dup (0BCh)
	var1f		 	fword	65535												; 6 bytes
	var1q		   qword   65534												; 8 bytes
	var1t		 	tbyte	65533													; 10 bytes
	X              	  REAL4	4.0															; IEEE754 (SIMPLES)
	Y               REAL8   2.75e-2													; IEEE754 (DUPLA)
	Z               REAL10  4.875													; IEEE754 (EXPANDIDA)
dseg    ends

cseg	segment para public 'code'
	assume  cs:cseg, ds:dseg
main	proc
	mov     ax, dseg
	mov     ds, ax
	mov     al,5
	mov     var1b,al
	mov     al,6
	mov     var2b,al
	mov     al,7
	mov     var3b,al
	mov     ax, var3w
	mov     word ptr CharArray[si],ax
fim:	mov     ah,4ch
	int     21h
main	endp
cseg    ends
end     Main