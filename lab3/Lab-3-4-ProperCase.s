;
; CSU11021 Introduction to Computing I 2019/2020
; Proper Case
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

        
		MOV R3,#1	 ;set a boolean value to 1
		
		
while	LDRB R2,[R0];Load the memory R0 to the register R2
		ADD R0,R0,#1 ;Load the next address of value from memory
		CMP R2,#0    ;while R2 != 0
		BEQ endwhile ;{
		
		CMP R2,#0x20	;if R2= space
		BNE elseif		;{
		MOV R3,	#1		;Set boolean to one}
		B endif9		;}

elseif	CMP R3,#0    ;elseif R3=0
		BNE elseif1	;{
		CMP R2,#'a' ;if R2<a{
		BLO endif7	;R2=R2+0x20}
	    CMP R2,#'z'	;elseif R2<z but >=a{
		BLS endif9
endif7	ADD R2,R2,#0x20   
		B endif9    ;}
		

elseif1	CMP R3,#1   ;elseif R3=1
		BNE endif9	;{
		MOV R3,#0   ;Set R3 to 0
		CMP R2,#'A' ; if R2 > A && R2<Z
		BHI endif6	;{
endif6	CMP R2,#'Z'
		BLO endif9	;}
		SUB R2,R2,#0x20;else { R2-= hex 20
		B endif9;}
		
		
	
endif9	STRB R2,[R1]	;store R2 to the address R1
		ADD R1,R1,#1	; store the next number in the next memory
		B while			;}
		
endwhile

		

	; Write your program here to create the Proper Case string
	;

STOP	B	STOP

tststr	DCB	"HELLO world",0

	END
