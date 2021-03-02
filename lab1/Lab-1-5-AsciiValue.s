;
; CSU11021 Introduction to Computing I 2019/2020
; Convert a sequence of ASCII digits to the value they represent
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='1'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='2'	; Load R2 with ASCII code for symbol '0'
	LDR	R3, ='3'	; Load R3 with ASCII code for symbol '3'
	LDR	R4, ='4'	; Load R4 with ASCII code for symbol '4'
	
	SUB R1, R1, #0x30 ;change R1 from text form into value.
	SUB R2,R2,#0X30    ;change R2 from text form into value.
	SUB R3, R3, #0x30  ;change R3 from text form into value.
	SUB R4,R4, #0x30   ; change R4 from text form into value.
	
	MOV R5,#1000    ; 2 is stored as the first digit in R0, so need to mul 1000,set R5 to value 1000
	MUL R1,R5,R1     ;mul R1 by 1000 , restore in R1
	ADD R0, R0, R1   ;add total to R0
	MOV R5, #100     ; 0 is stored as the second digit in R0, so need to mul 100,set R5 to value 100
	MUL R2,R5,R2      ;mul R2 by 100 , restore in R2
	ADD R0,R0,R2     ; add total to R0
	MOV R5,#10       ;  3 is stored as the third digit in R0, so need to mul 10,set R5 to value 10
	MUL R3,R5,R3      ;mul R3 by 10 , restore in R3
	ADD R0, R0, R3    ;add total to R0
	ADD R0,R0,R4      ; R4 is the last digit, only needs to add to total.
	
	
	

	; your program goes here

STOP	B	STOP

	END
