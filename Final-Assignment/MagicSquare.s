;
; CS1022 Introduction to Computing II 2018/2019
; Magic Square
;

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	LDR	R0, =arr1
	LDR	R4, =size1
	LDR	R1, [R4]

	;
	BL isMagic; test subroutine isMagic i.e. isMagic(arr1,3)
	;

stop	B	stop


;
;subroutine isMagic 
;determine whether a square two-dimensional array in memory is a Magic Square [1].
;parameter:
;R0:starting address of the array
;R1:the size(width/height)of the array(matrix)
; return boolean R2:
;when it is square matrix return 1 else 0.


isMagic
	PUSH {R4-R8,lr}    				;registers used
	BL getSumOfRow					;get the sum of the first row 
	MOV R4,R3						;store the value in a var comparedVal
	PUSH{R0-R7}				
	SUB R7,R1,#1					;row = row - 1  (we want to get the sum of the rest two rows)
for
	CMP R6,R7                       ;while (count!=number of rows -1)
	BEQ endfor						;{
	ADD R0,R0,R1,LSL#2				;Address = Address + size * 4
	BL getSumOfRow					;getSumOfRow(Address,3)
	MOV R5,R3						;temp= return value of function
	CMP R4,R5						;if(comparedVal!=temp)
	BNE notmagic					;{return 0   i.e. notMagicSquare}
	ADD R6,R6,#1					;count=count+1
	B for							;}
endfor
	POP{R0-R7}
	PUSH{R0-R7}
	MOV R7,R0						;OldAddress=address of array
for01								;while(count!=total number of col)
	CMP R6,R1
	BEQ endfor01					;{
	ADD R0,R7,R6,LSL#2				;Address= OldAddress +count *4
	BL getSumOfCol					;getSumOfCol(Address,3)
	MOV R5,R3						;temp = return value of the function
	CMP R4,R5						;if(temp!=comparedVal){
	BNE notmagic					;return 0}
	ADD R6,R6,#1					;count=count+1
	B for01							;}
endfor01
	POP{R0-R7}
	
	BL getSumOfDiaLeft				;getSumOfDiaLeft(address,size)
	CMP R4,R3						;if(ComparedVal!=return value from function){
	BNE notmagic					;return 0}

	PUSH{R0}
	SUB R8,R1,#1					;get offset=row-1  ;hense there are 2 elements between the right diagonal 
	MOV R7,R0						;tempAddress= startAddress
	ADD R0,R7,R8,LSL#2				;Address= tempAddress+offset*4
	BL getSumOfDiaRight				;getSumofDiaRight(Address,size)
	CMP R4,R3						;if(comparedVal!=return value){
	BNE notmagic					;return 0}
	POP{R0}
	MOV R2,#1						;else return 1 i.e. it is a magicSquare matrix
notmagic
	POP{R4-R8,PC}

	
;subroutine getSumOfRow
;calculate the sum of a row in the matrix
;parameter:
;R0:starting address of the array
;R1:the size(width/height)of the array(matrix)
; return sum of a row R3:

getSumOfRow
	PUSH {R4-R7,lr}
	MOV R5,R1                        ;store total elements in the row
	MOV R4,#0						;initialize the vars
	MOV R7,#0
	MOV R6,#0
for1 								;while(total elements in the row!=count)
	CMP R5,R7						
	BEQ endfor1						;{
	LDR R4,[R0,R7,LSL#2]			;load Array[i+count][j]
	ADD R6,R6,R4					;total=total+Array[i+count][j]
	ADD R7,R7,#1					;count =count+1
	B for1							;}
endfor1
	MOV R3,R6						;return total
	POP {R4-R7,PC}
	
;subroutine getSumOfCol
;calculate the sum of column of a matrix
;parameter:
;R0:starting address of the array
;R1:the size(width/height)of the array(matrix)
; return sum of a column R3:

getSumOfCol
	PUSH {R4-R8,lr}
	MOV R5,R1                     ;store total elements in the column
	MOV R4,#0					;initialize vars into zero
	MOV R7,#0
	MOV R6,#0
for2 
	CMP R5,R7					;while(total elements in the column != count)
	BEQ endfor2					;{
	MUL R8,R5,R7				;offset=total elements in the column*count
	LDR R4,[R0,R8,LSL#2]		;load Array[i][j+offset]
	ADD R6,R6,R4				;total =total+Array[i][j+offset]
	ADD R7,R7,#1				;count=count+1
	B for2						;}
endfor2
	MOV R3,R6					;return total
	POP {R4-R8,PC}
	
;subroutine getSumOfDiaLeft
;calculate the sum of left diagonal of a matrix
;parameter:
;R0:starting address of the array
;R1:the size(width/height)of the array(matrix)
; return sum of a left diagonal R3:

getSumOfDiaLeft
	PUSH {R4-R9,lr}
	MOV R5,R1					;store total elements of the left diagonal
	MOV R4,#0					;initialize vars to 0
	MOV R7,#0
	MOV R6,#0
	MOV R8,#0
	MOV R9,#0
for3								;while(total elements of the diagonal!=count)
	CMP R5,R7
	BEQ endfor3						;{
	MUL R9,R7,R8					;arrayOffset=count *diagonalOffset
	LDR R4,[R0,R9,LSL#2]			;load Array[i+1][j-arrayoffset]
	ADD R6,R6,R4					;total =total+Array[i+1][j-arrayoffset]
	ADD R7,R7,#1					;count=count+1
	ADD R8,R5,#1					;diagonal offset = total elements of the diagonal+1 ;hense there are four elements between each element in this example
	B for3							;}
endfor3
	MOV R3,R6						;return total
	POP {R4-R9,PC}
	
;subroutine getSumOfDiaRight
;calculate the sum of right diagonal of a matrix
;parameter:
;R0:starting address of the array
;R1:the size(width/height)of the array(matrix)
; return sum of a right diagonal R3:

getSumOfDiaRight         			
	PUSH {R4-R9,lr}
	MOV R5,R1						;store total elements of the right diagonal
	MOV R4,#0                       ;initialize vars to 0
	MOV R7,#0
	MOV R6,#0
	MOV R8,#0
	MOV R9,#0
for4
	CMP R5,R7                      ;while (total elements of the right diagonal!=count){	
	BEQ endfor4						;{
	MUL R9,R7,R8					;arrayOffset=count *diagonalOffset
	LDR R4,[R0,R9,LSL#2]			;load Array[i-1][j-arrayoffset]
	ADD R6,R6,R4					;total=total+Array[i-1][j-arrayoffset]
	ADD R7,R7,#1					;count=count+1
	SUB R8,R5,#1					;diagonal offset = total elements of the diagonal-1 ;hense there are 2 elements between each element in this example
	B for4							;}
endfor4
	MOV R3,R6						;return total
	POP {R4-R9,PC}
	
size1	DCD	3		; a 3x3 array
arr1	DCD	2,7,6		; the array
		DCD	9,5,1
		DCD	4,3,8


	END
