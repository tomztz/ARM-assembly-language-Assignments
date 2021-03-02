;
; CS1022 Introduction to Computing II 2019/2020
; eTest Group 3 Q1
;

	AREA	globals, DATA, READWRITE

arrA	SPACE	1024
arrB	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialise the system stack pointer
	LDR	SP, =0x40010000

	;
	; initialise arrays by copying from ROM to RAM
	;

	LDR	R0, =arrA	; destination in RAM
	LDR	R1, =initA	; source in ROM
	LDR	R4, =sizeA
	LDR	R2, [R4]	; size of arrA
	BL	copy_arr

	
	MOV R0,R0		;parameter1=arrA
	MOV R1,R4		;parameter2=sizeA
	PUSH{R0-R1}		;PUSH to make sure R0 and R1 are not overwritten
	
	LDR	R0, =arrB	; destination in RAM
	LDR	R1, =initB	; source in ROM
	LDR	R4, =sizeB
	LDR	R2, [R4]	; size of arrB
	BL	copy_arr

	
	
	MOV R2,R0		;parameter3=arrB
	MOV R3,R4		;parameter4=sizeB
	POP {R0-R1}		;get parameter1 and 2
	BL difference	;difference ( arrA , sizeA , arrB , sizeB )

	
STOP	B	STOP

;
; Initial data
;
sizeA	DCD	10				; test array size
initA	DCD	6, 2, 7, 9, 1, 3, 2, 6, 9, 1	; test array elements

sizeB	DCD	4				; test array size
initB	DCD	2, 7, 5, 3			; test array elements



;difference subroutine
; remove elements from arrA that are also in arrB
;Parameters:
;R0 - start address of arrayA
;R1 - size of arrA
;R2- start address of arrB
;R3- size of arrB
;no return value
difference
	PUSH {R5-R8,lr}				;registers used R5-R8
	MOV R5,#0					;for(i=0
	
for 
	CMP R5,R3					;i<sizeB
	BHS endfor
	MOV R6,#0					;for(j=0
for1
	CMP R6,R1					;j<sizeA
	BHS endfor1
	LDR R7,[R0,R6,LSL#2]		;arrA[j]
	LDR R8,[R2,R5,LSL#2]		;arrB[i]
	CMP R7,R8					;if(arrA[j]==arrB[i])
	BNE endif1					;{
	PUSH {R0-R3}				;push parameters in difference subroutine
	MOV R0,R0					;first parameter= ArrayA
	MOV R2,R1					;third parameter= sizeA
	MOV R1,R6					;second parameter= j
	
	BL  remove					;remove ( arrA , j , sizeA ) ;
	POP {R0-R3}					;pop parameters in difference subroutine
	SUB R1,R1,#1				;SizeA=SizeA-1
endif1
	ADD R6,R6,#1				;j++
	B for1
endfor1
	ADD R5,R5,#1				;i++
	B for
endfor
	POP {R5-R8,PC}				;return
	

; remove subroutine
; Removes an element from an array of word size values
; Parameters:
;   R0 - start address of array
;   R1 - index of element to remove
;   R2 - number of elements in the array
; Return Value:
;   none
remove
	PUSH	{R4-R6}

	ADD	R4, R1, #1
whRemove
	CMP	R4, R2
	BHS	eWhRemove
	LDR	R5, [R0, R4, LSL #2]
	SUB	R6, R4, #1
	STR	R5, [R0, R6, LSL #2]
	ADD	R4, R4, #1
	B	whRemove
eWhRemove
	POP	{R4-R6}
	BX	LR



; copy_arr subroutine
; Copies an array of words in memory
; Parameters:
;   R0 - destination address
;   R1 - source address
;   R2 - number of words to copy
; Return Value:
;   none
copy_arr
	PUSH	{R4-R5}
	LDR	R4, =0
wh_copy_arr
	CMP	R4, R2
	BHS	ewh_copy_arr
	LDR	R5, [R1, R4, LSL #2]
	STR	R5, [R0, R4, LSL #2]
	ADD	R4, R4, #1
	B	wh_copy_arr
ewh_copy_arr
	POP	{R4-R5}
	BX	LR

	END
