;
; CSU11021 Introduction to Computing I 2019/2020
; Simple ARM Assembly Language Demonstration
;

	AREA	RESET, CODE, READONLY
	ENTRY

	MOV	R0, R1; Make the first number the subtotal 
	ADD	R0, R0, R2; Add the second number to the subtotal 
	ADD	R0, R0, R3; Add the third number to the subtotal 
	ADD	R0, R0, R4 ;Add the fourth number to the subtotal

STOP	B	STOP

	END
