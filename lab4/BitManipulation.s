;
; CSU11021 Introduction to Computing I 2019/2020
; Bit Manipulation
;

	AREA	RESET, CODE, READONLY
	ENTRY

		LDR	R0, =12	; a = 137
		LDR	R1, =5		; b = 6

		MOV R2,#0;
		MOV R3,#0;
		LDR R4,= 0x80000000 ;
	
while 
		CMP R4,#0
		BEQ endwhile
		MOV R3,R3,LSL#1
		AND R5,R0,R4
		CMP R5,#0
		BEQ endif
		ORR R3,R3,#1
endif	CMP R3,R1
		BLO endif1
		SUB R3,R3,R1
		ORR R2,R2,R4
endif1
		MOV R4,R4,LSR#1
		B while
endwhile
	; Write your program here
	;

STOP	B	STOP

	END
