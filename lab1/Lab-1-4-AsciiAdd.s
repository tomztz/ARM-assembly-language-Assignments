;
; CSU11021 Introduction to Computing I 2019/2020
; Adding the values represented by ASCII digit symbols
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='4'	; Load R2 with ASCII code for symbol '4'

	; your program goes here
	SUB R1, R1,#0x30 ;add hex 30 to change 2 to value
	SUB R2, R2,#0x30 ;add hex 30 to change 4 to value
	
	ADD R5, R1,R2  ;add the values R1 and R2 store in R5
	ADD R0,R5,#0x30;change the value in R5 back to text store in total
	

STOP	B	STOP

	END
