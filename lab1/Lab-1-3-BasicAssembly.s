;
; CSU11021 Introduction to Computing I 2019/2020
; Basic ARM Assembly Language
;

	AREA	RESET, CODE, READONLY
	ENTRY
	
; Write your solution for all parts (i) to (iv) below.

; Tip: Right-click on any instruction and select 'Run to cursor' to
; "fast forward" the processor to that instruction.

; (i) 3x+y
	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	; your program goes here
	MOV R0, #3  ; set 3 to the subtotal
	MUL R0,R1,R0 ; total= 3*x
	ADD R0,R0,R2 ; total= total+y
	
	
	
	
; (ii) 3x^2+5x

	LDR	R1, =2	; x = 2

	; your program goes here
	MUL R0,R1,R1; total= x*x
	MOV R2,#3 ; set R2 to 3 
	MUL R0,R2,R0 ; total= total*3
	MOV R2,#5 ; reset R2 to 5
	MUL R2,R1,R2 ;R2= 5 *x
	ADD R0,R0,R2 ; total= total+5x
	

; (iii) 2x^2+6xy+3y^2

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	; your program goes here
	MUL R0,R1,R1;total= x*x
	MOV R3,#2;set R3 to 2 
	MUL R0,R3,R0;total= 2x^2
	
	MOV R3,#6  ;reset R3 to 6
	MUL R3,R1,R3; R3= 6*x
	MUL R3,R2,R3;R3 = 6x*y
	ADD R0,R3,R0 ;total= total + 6xy
	
	MOV R3,#3 ;reset R3 to 3
	MUL R3,R2,R3 ; R3= 3*y
	MUL R2,R3,R2  ;R2=3y*y
	ADD R0,R2,R0;total= total+3y^2
	

; (iv) x^3-4x^2+3x+8

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	; your program goes here
	MUL R0,R1,R1 ;total= x*x
	MUL R0,R1,R0; total= x^2*x
	
	MOV R3,#4  ;set R3 to 4 
	MUL R3,R1,R3 ;R3= 4*x
	MUL R3,R1,R3;R3=4x*x
	SUB R0,R0,R3; total=total- 4x^2
	
	MOV R3,#3; reset R3 to 3
	MUL R3,R1,R3; R3=3*x
	ADD R0,R3,R0;R3= total+3x
	
	MOV R3,#8; ;reset R3 to 8
	ADD R0,R0,R3;total= total+8

STOP	B	STOP

	END
