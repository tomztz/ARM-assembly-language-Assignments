;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;

	AREA	RESET, CODE, READONLY
	ENTRY

		LDR	R0, =0x40000000	; start address for pseudo-random sequence
		LDR	R1, =64		; number of pseudo-random values to generate
		LDR R2, = 74	;seed
	
while 	CMP  R1,#0		;while(R1!=0)
		BEQ endwhile	;{
		MOV R4,R2		;R4=R2
		MUL R2,R4,R2	;R2=R4*R2
		MOV R2,R2,LSR #7;R2=R2<<7
		MOV R2,R2,LSL #7;R2=R2<<7
		ADD R2,R4,R2;	R2=R4+R2
		SUB R1,R1,#1;	R1=R1-1
		STR R2,[R0];	store R2 to address at R0
		ADD R0,R0,#4;	R0=R0+4
		B while	;}
endwhile
	;
	; Write your program here
	;	

STOP	B	STOP

	END
