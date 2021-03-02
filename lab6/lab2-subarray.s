;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Subarray
;

N	EQU	7
M	EQU	3		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	LDR R0,=0;boolean isSubarray=false
	MOV R3, #N;load row element of LargeA
	MOV R4,#M;load row elemrnt of SmallA
	MOV R12,#M;R12=M
	
	SUB R5,R3,R4	;R5=N-M
for 					;for{
	LDR R1,=LARGE_A			;reload base address of Large_A
	LDR R2,=SMALL_A			;reload base address of Small_A
	MOV R3, #N				;R3=N
	MOV R4,#M				;R4=M
	MUL R6,R3,R3			;R6=N*N 							;(Hense, get the total elements in LargeA)
	SUB R6,R6,#1			;R6=R6-1							;(index=total-1)i.e index always one less than total elements
	CMP R6,R7				;if(R6=R7)      					;stop when it hits the last element
	BEQ STOP				;{break}
	LDR R8,[R1,R7,LSL#2]	;load base address of largeA plus offset to R8				;(R7+1 each time)
	LDR R9,[R2,R10,LSL#2]	;load base address of smallA plus offset to R9				; (R10=0 unless find same element)
	 
	
  	CMP R8,R9				;if (R8=R9)
	BEQ if1					; {      								;(look at if1)
	MOV R10,#0				;R10=0 									;because they are not equal need to start again to make sure they are entirely the same
	CMP R7,R5				;if(R7=M-N+nM)        					;hense,the remaining row is less than the row size of the Small Array, no need to compare,
							;jump to next line
  	BEQ if2					;{ if2
	ADD R7,R7,#1			;R7++
	B for					;branch back to for
if1
	MUL R6,R4,R4			;R6=M*M 								;the total element of the small array
	SUB R6,R6,#1			;index=total-1
	CMP R10,R6				;if(R10=R6)								; i.e all elemnts of SmallA were checked against LargeA
	BEQ endfor				;{go to endfor}
	ADD R10,R10,#1			;R10++          
	ADD R7,R7,#1			;R7++									;continue to compare elements in two array
	
	CMP R10,R12				;if(R10>M+nM){							;i.e when checking at the end of row SmallA everytime ;i.e first time 3 next 6 next 9
	BHS if3					;go to if3
	B for					;branch back to for 

if3							
	SUB R11,R3,R4			;R11=N-M
	ADD R7,R7,R11			;R7=R7+R11   							;jump to the next row of the same column
	ADD R12,R12,R4			;R12=R12+R4	
	B for					;branch for
if2 	
	
	ADD R7,R7,R4			;R7=R7+M 								;i.e go to next line
	ADD R5,R5,R3			;R5=R5+R3  								;update the row of elements
	
	B for					;branch back 
	

	
endfor 
	MOV R0,#1				;R0=true
	;
	; Write your program here to determine whether SMALL_A
	;   is a subarray of LARGE_A
	;
	; Store 1 in R0 if SMALL_A is a subarray and zero otherwise
	;


STOP	B	STOP


;
; test data
;

LARGE_A	
	DCD	 48, 37, 15, 44,  3, 17, 26
	DCD	  2,  9, 12, 18, 14, 33, 16
	DCD	 13, 20,  1, 22,  7, 48, 21
	DCD	 27, 19, 44, 49, 44, 18, 10
	DCD	 29, 17, 22,  4, 46, 43, 41
	DCD	 37, 35, 38, 34, 16, 25,  0
	DCD	 17,  0, 48, 15, 27, 35, 11

SMALL_A	
	DCD	 26, 2, 9
	DCD	 16, 13, 20
	DCD	 21, 27, 19

	END
