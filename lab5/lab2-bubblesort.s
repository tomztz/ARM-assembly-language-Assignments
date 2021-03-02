;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	11

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED					;R4= sorted array
	LDR	R5, =UNSORT					;R5=unsorted array
	LDR	R6, =0						;r6=0
whInit	
	CMP	R6, #N					;while(R6<N)
	BGE	eWhInit							;{
	LDR	R7, [R5, R6, LSL #2]		;load the meamory R5+R6*4 to R7
	STR	R7, [R4, R6, LSL #2]		;store R7 to address R4+R6*4 
	ADD	R6, R6, #1					;R6++
	B	whInit 						;}
eWhInit

	LDR	R4, =SORTED					;R4= sorted array
	LDR	R5, =UNSORT					;R5=unsorted array

	;
	
do									;do{
	MOV R0,#0							;R0=0
	MOV R9,#1							;R9=1
for CMP R9,#N							;while (R9<N0
	BGE endfor								;{
	LDR R10,[R4,R9,LSL#2]				;load the address R4+R9*4 to R10
	SUB R9,R9,#1						;R9--
	LDR R8,[R4,R9,LSL#2]				;load R8 from address R4+R9*4 to R8
	ADD R9,R9,#1						;R9++
	CMP R8,R10							;if (R8>R10)
	BLE endif1							;{
	MOV R6,R8							;R6=R8
	SUB R9,R9,#1						;R9--
	STR R10,[R4,R9,LSL#2]				;Store R10 to address R4 +R9*4
	ADD R9,R9,#1						;R9++
	
	STR R6,[R4,R9,LSL#2]				;store R6 to address R4+R9*4
	MOV R0,#1							;R0=1
	
endif1									;}
	ADD R9,R9,#1							;R9++
	B for								;}
endfor   
	CMP R0,#1							;while(R0!=1)
	BEQ do
	
	;

stop	B stop

UNSORT	DCD	0,3,0,1,6,2,4,7,8,5,-4

	END
