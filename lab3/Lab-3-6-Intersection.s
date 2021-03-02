;
; CSU11021 Introduction to Computing I 2019/2020
; Intersection
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; address of sizeC
	LDR	R1, =0x40000004	; address of elemsC
	
	LDR	R6, =sizeA	; address of sizeA
	LDR	R2, [R6]	; load sizeA
	LDR	R3, =elemsA	; address of elemsA
	
	LDR	R6, =sizeB	; address of sizeB
	LDR	R4, [R6]	; load sizeB
	LDR	R5, =elemsB	; address of elemsB

	
	while 	CMP R2,R7		;while (R2=R7){
			BEQ	endwhile	;{
			LDR R8,[R3]		;load values of address to R8
			LDR	R5, =elemsB ;reload the elements of B
			MOV R9,#0		;set a counter R9=0
whilet		CMP R4,R9		;while (R4!=R9)
			BEQ endwhilet	;{
			LDR R10,[R5]	;load R5 to R10
 			ADD R5,R5,#4	;R5=R5+4
			CMP R10,R8		;if R10=R8
			BNE endif1		;{
			STR R10,[R1]	;Store the value in R10 to address R1
			ADD R1,R1,#4	; R1=R1+4
			ADD R11,R11,#1	;R11=R11+1
			CMP R10,R8		;if (R10!=R8)
			BEQ endwhilet	;{
endif1		ADD R9,R9,#1;	; R9=R9+1}
			B whilet		;}
endwhilet
			ADD R3,R3,#4    ;R3=R3+4
			ADD R7,R7,#1	;R7=R7+1
			B while			
endwhile					;}
			STR R11,[R0]	;srore the size of C
			;Your program to compute the interaction of A and B goes here
	;
	; Store the size of the intersection in memory at the address in R0
	;
	; Store the elements in the intersection in memory beginning at the
	;   address in R1
	;

STOP	B	STOP

sizeA	DCD	4
elemsA	DCD	7, 14, 6, 3

sizeB	DCD	9
elemsB	DCD	20, 11, 14, 5, 7, 2, 3, 12, 17

	END