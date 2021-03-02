;
; CS1022 Introduction to Computing II 2019/2020
; eTest Group 3 Q1
;

N	EQU	9


	AREA	globals, DATA, READWRITE

array	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialise the system stack pointer
	LDR	SP, =0x40010000


		LDR	R4, =array
		LDR	R5, =N	

		LDR R6,=0		;for(i=0
for
		CMP R6,R5		;i<N
		BHS endfor
		MOV R7,#0		;for(j=0
for1
		CMP R7,R5		;j<N
		BHS endfor1
		CMP R6,R7		;if(i>j)
		BLS else1		;{
		MUL R8,R6,R5	;rows= i*N
		ADD R8,R8,R7	;offset=rows+j
		STR R6,[R4,R8,LSL#2]	;array [ i , j ] = i ;
		B	endif1
else1
		MUL R8,R6,R5	;rows= i*N
		ADD R8,R8,R7	;offset=rows+j
		STR R7,[R4,R8,LSL#2];array [ i , j ] = j ;
endif1
		ADD R7,R7,#1	;j++
		B for1
endfor1
		ADD R6,R6,#1	;i++
		B for
endfor
	; Your program goes here
	; (i.e. your translation of the pseudocode provided
	;

STOP	B	STOP


	END
