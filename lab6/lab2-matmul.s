;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Matrix Multiplication
;

N	EQU	4		

	AREA	globals, DATA, READWRITE

; result array
ARR_R	SPACE	N*N*4		; N*N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000           ;stack pointer 
	LDR R4,= ARR_A				;load matrix A to R4
	LDR R5,= ARR_B				;load matrix B to R5
	LDR R9,= ARR_R				;load matrix R to R9
	LDR R6,= N					;load the size of one row
	

for 							;while (R0<N)
		CMP R0,#N				
		BGE endfor 				;{
		MOV R1,#0				;R1=0

								
for1	CMP R1,#N				;while (R1<N)
		BGE endfor1				;{
		MOV R2,#0				;R2=0
		MOV R3,#0				;R3=0


for2    CMP R3,#N				;while (R3<N)
		BGE endfor2				;{
		MUL R7,R0,R6			;R7=R0*R6
		ADD R7,R7,R3			;R7=R7+R3
		LDR R8,[R4,R7,LSL#2]	;load address R4+R7*4 to R8

		MUL R7,R3,R6			;R7=R3*R6
		ADD R7,R7,R1			;R7=R7+R1
		LDR R10,[R5,R7,LSL#2]	;load address R5+R7*4 to R10

		MUL R10,R8,R10			;R10=R8*R10
	
		ADD R2,R2,R10			;R2=R2+R10
		ADD R3,R3,#1			;R3=R3+1
		B for2					;}
endfor2
		MUL R7,R0,R6			;R7=R0*R6
		ADD R7,R7,R1			;R7=R7+R1
		STR R2,[R9,R7,LSL#2]	;store R2 to address R9+R7*4 

		ADD R1,R1,#1			;R1=R1+1
		B for1					;}
endfor1
		ADD R0,R0,#1			;R0=R0+1
		B for					;}
endfor
		;
	; write your matrix multiplication program here
	;


STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
