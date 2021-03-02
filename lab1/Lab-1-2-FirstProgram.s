;
; CSU11021 Introduction to Computing I 2019/2020
; First Program
;

	AREA	RESET, CODE, READONLY
	ENTRY

	MOV	R0,R1 ;make R1 the subtotal
	ADD R0,R0,R0; total= total+total
	ADD R0,R0,R0 ; total= total+total
	ADD R0,R0,R0 ; total= total+total

STOP	B	STOP

	END
