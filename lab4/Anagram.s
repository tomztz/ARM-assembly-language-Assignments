;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string
	LDR R10,=0x40000000; load the address of R10

while	LDRB R2,[R0];	load the teststr to R2
		CMP R2,#0	;while (R2!=0)
		BEQ endwhile;{
		STRB R2,[R10];store fisrt letter in mem at R10
		ADD R0,R0,#1; R0=R0+1
		ADD R3,R3,#1 ;R3=R3+1
		ADD R10,R10,#1;R10=R10+1
		B while;		}
endwhile
		
while2	LDRB R4,[R1]; load teststr2 to R4
		CMP R4,#0	; while(R4!=0)
		BEQ endwhile2;{
		ADD R1,R1,#1	;R1=R1+1
		ADD R5,R5,#1	;R5=R5+1
		B while2		;}
endwhile2

		CMP R3,R5; if R3=R5
		BEQ endif;{
		MOV R0,#0;	R0=0
		CMP R3,R5 ;elseif(R3!=R5)
		BNE endall; endprogram
		
endif	;}
		
	LDR	R0, =tststr1	;reload teststr1
	LDR	R1, =tststr2	;reload teststr2
		
		
		MOV R6,R3		;R6=R3
		
		
while3	LDR R10,=0x40000000	;do{reload the address of R10 from start
		MOV R9,R5			;R9=R5
		LDRB R4,[R1]		;load teststr2 to R4
		CMP R6,#0			;while(R6!=0)
		BEQ endwhile3
while4	LDRB R7,[R10]		;do{load address R10 to R7
		CMP R9,#0			;while(R9!=0)
		BEQ endwhile4		;
		CMP R7,R4			;if(R7!=R4){
		BNE if1
		
		MOV R11,#0x00		;else{R11=0
		STRB R11,[R10]		;delete the letter in address R10
		CMP R7,R4			;if (R7=R4){
		BEQ endloop			;break}
if1							;}
		ADD R10,R10,#1		;R10=R10+1
		SUB R9,R9,#1		;R9=R9+1
		
		B while4			;}
endloop	ADD R1,R1,#1		;R1=R1+1
		SUB R6,R6,#1		;R6=R6-1
		B while3			;}
endwhile3
		MOV R0,#1			;R0=1
		B endall			;STOP
		
endwhile4 					;R0=0
		MOV R0,#0
endall				
STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0


	END
