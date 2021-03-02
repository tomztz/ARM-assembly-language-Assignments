;
; CSU11021 Introduction to Computing I 2019/2020
; 64-bit Shift
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =0xD9448A9B		; most significaint 32 bits (63 ... 32)
	LDR	R0, =0xB8AA9D3B		; least significant 32 bits (31 ... 0)
	LDR	R2, =4		; shift count
	



		
		CMP R2,#0; 			if(R2<0)
		BGT  else1;			{
		MOV R7,R0;			R7=R0
		MOV R3,R2;			R3=R2
		MOV R4,#0x1;		mask=1
		MOV R4,R4,LSL#31;	mask<<31
while 	CMP R3,#0;			while(R3!=0)
		BEQ endwhile;		{
		AND R5,R0,R4;		R5=R0&R4
		MOV R0,R0,LSL#1;	R0=R0<<1
		MOV R5,R5,LSR#31;	R5=R5>>31
		MOV R1,R1,LSL#1;	R1=R1<<1
		ORR R1,R1,R5;		R1=R1||R5
		ADD R3,R3,#1;		R3=R3+1
		B while;			}
endwhile
		B endnegative;}	
else1	;					else{
		;		mask=1
		MOV R3,R2;
		MOV R4,#0x1;
		MOV R5,R4
	
;		R3=R2
while2	CMP R3,#0;			while(R3!=0)
		BEQ endwhile2;	
		;		{		R3=R3-1
		SUB R3,R3,#1;
		MOV R5,R5,LSL #1;	R5=R4<<R3
		ORR R5,R4,R5;
		
;			R5=R4||R5
		B while2;		}
endwhile2
		AND R6,R1,R5		;R6=R1&R5
		MOV R0,R0,LSR R2	;R0=R0<<R2
		RSB R7,R2,#32		;R7=32-R2
		ORR R0,R0,R6, LSL R7;R0=R0||R5<<R2
		MOV R1,R1,LSR R2;	R1=R1>>R2
		
	; Write your program here
	;
endnegative				;}
STOP	B	STOP

	END
