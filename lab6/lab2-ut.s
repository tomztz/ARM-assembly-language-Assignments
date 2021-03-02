;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Upper Triangular
;

N	EQU	4		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	LDR R0,=0				;R0=0             
	LDR R1,=N				;R1=N
	LDR R2,= ARR_A			;R2=ARR_A
	
while 	CMP R3,#N			;While(R3<N)
		BHS endwhile		;{	
		MOV R4,#0			;R4=false i.e assume the matrix is not ut

while2  CMP R4,R3			;while (R4<R3)
		BHS endwhile2		;{
		MUL R6,R1,R3		;R6=R1*R3    calculate the number of elements before the current row
		
		ADD R6,R6,R4		;R6=R6+R4	calculate the number of elements before the current element on the same row
		LDR R7,[R2,R6,LSL#2];load R2 +R6*4 to R7    
		
		
		CMP R7,#0			;if(R7!=0){
		BNE  STOP			; break;}
		
		ADD R4,R4,#1		;R4=R4+1
		B while2			;}
endwhile2
		
		ADD R3,R3,#1		;R3=R3+1
		B while				;}
		
endwhile
		MOV R0,#1			;R0=true i.e. it is upper triangular matrix
	;
	; write your program here to determine whether ARR_A
	;   (below) is a matrix in Upper Triangular form.
	;
	; Store 1 in R0 if the matrix is in Upper Triangular form
	;   and zero otherwise.
	;


STOP	B	STOP

 
;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 0,  6,  7,  8
	DCD	 0,  0, 11, 12
	DCD	 0,  0,  0, 16

	END
