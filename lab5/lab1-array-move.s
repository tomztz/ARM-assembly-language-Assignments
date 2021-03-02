;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;




N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

		LDR	R0, =ARRAY					;Load base address to R0
		LDR	R1, =6						;R1=3
		LDR	R2, =3						;R2=6
		LDR	R3, =N						;R3=N
		
		
		MOV R9,R1						;R9=R1
		CMP R2,R1						;if(R2<R1)
		BHI else1
		CMP R2,R1
		BEQ endpr						;{
		LDR R4,[R0,R1,LSL#2]			;R4=ARRAY[R0+R1]
		MOV R10,#1						;R10=1
		
		
while									;while
		
		CMP R1,R2						;(R1!=R2)
		BEQ endwhile					;{
		MOV	R1,R9						;R1=R9
		SUB R1,R1,R10					;R1=R1-R10
		LDR R5,[R0,R1,LSL#2]			;R5=ARRAY[R0+R1]
		ADD R1,R1,#1					;R1=R1+1
		STR R5,[R0,R1,LSL#2]			; ARRAY[R0+R1]=R5
		ADD R10,R10,#1					;R10=R10+1
		SUB R1,R1,#1					;R1=R1-1
		B while 						;}
endwhile
		STR R4,[R0,R2,LSL#2]			;ARRAY[R0+R2]=R4
		B STOP							;}
		
else1									;else{
		LDR R4,[R0,R1,LSL#2]			;R4=ARRAY[R0+R1]
		MOV R10,#1						;R10=1

while1 									;while1
		CMP R1,R2						;(R1!=R2)
		BEQ endwhile1					;{
		MOV	R1,R9						;R1=R9
		ADD R1,R1,R10					;R1=R1+R10
		LDR R5,[R0,R1,LSL#2]			;R5=ARRAY[R0+R1]
		SUB R1,R1,#1					;R1=R1-1
		STR R5,[R0,R1,LSL#2]			;ARRAY[R0+R1]=R5
		ADD R10,R10,#1					;R10=R10+1
		ADD R1,R1,#1					;R1=R1+1
		B while1 						;}
endwhile1
		STR R4,[R0,R2,LSL#2]			;ARRAY[R0+R2]=R4
	; your program goes here
endpr
STOP	B	STOP

	END
