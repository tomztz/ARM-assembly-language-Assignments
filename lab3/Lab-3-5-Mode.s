;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

		LDR	R4, =tstN	; load address of tstN
		LDR	R1, [R4]	; load value of tstN

		LDR	R2, =tstvals	; load address of numbers
		MOV R11,R1			;load the value to R11
while 	CMP R8,R1			;while R8 != R1
		BEQ endwhile		;{
		LDR	R2, =tstvals	;reload address of numbers
		LDR R3,[R2]			;load the values in R3
		MOV R5,R3			;load value from r3 to r5
		MOV R10,#0			;set a counter r10 to be 0
		
whilet						;while
		CMP R10,R11			;(R10!=R11)
		BEQ endwhilet		;{
		ADD R2,R2,#4		;R2=R2+4
		LDR R3,[R2]			;load the next value from memory
		CMP R5,R3			; if R5=R3
		BNE endif3
		ADD R6,R6,#1		;ADD counter r6 to 1
endif3	
		ADD R10,R10,#1		;R10=R10+1
		B whilet			;}
endwhilet
		CMP R6,R7			; if R6>R7
		BLO endif1			;{
		MOV R7,R6			;store R6 to R7
		MOV R0,R5			; store R5 to R0}
endif1	MOV R12,#4			;else{
		MUL R12,R8,R12		;let r12 =4, R12=R8*4
		ADD R2,R2,R12		;R2=R2+R12
		ADD R8,R8,#1		;R8=R8+1
		SUB R11,R11,#1		;R11=R11-1
		MOV R6,#0			;reset R6=0
		B while				;}
endwhile
	;
	; Write your progam here to compute the mode in R0
	;

STOP	B	STOP

tstN	DCD	8			; N (number of numbers)
tstvals	DCD	5, 3, 7, 5, 3, 5, 1, 9	; numbers

	END
