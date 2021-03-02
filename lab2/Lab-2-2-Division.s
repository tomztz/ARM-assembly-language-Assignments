;
; CSU11021 Introduction to Computing I 2019/2020
; Division (inefficient!)
;

	AREA	RESET, CODE, READONLY
	ENTRY

			MOV R2,#4
			MOV R3,#1
while
			CMP R3,#0
			BNE continue
continue	CMP R2,R3
			BLO end
			SUB R2,R2,R3
			ADD R0,R0,#1
			MOV R1,R2
			B while
end
	
	; Your program goes here
	;

STOP	B	STOP

	END
