;
; CSU11021 Introduction to Computing I 2019/2020
; GCD
;

	AREA	RESET, CODE, READONLY
	ENTRY
	LDR R2,=32
	LDR R3,=24
	
while 
	CMP R2,R3;while (a!=b)
	BEQ end;{
	CMP R2,R3;if (a>b)
	BLS continue;{
	SUB R2,R2,R3;a=a-b
	MOV R0,R2;store a into R0
continue;}else
	SUB R3,R3,R2;b=b-a
	MOV R0,R2;store b into R0
	B while;}
	
end
	

STOP	B	STOP

	END