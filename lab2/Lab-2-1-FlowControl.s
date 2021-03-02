;
; CSU11021 Introduction to Computing I 2019/2020
; Flow Control
;

	AREA	RESET, CODE, READONLY
	ENTRY

; (i)
	CMP R0,#13; if (h >= 13)
	BLO after ;{
	SUB R0,R0,#12; 	h = h - 12;
after; }


; (ii)
	CMP R0,R1; if (a > b) 
	BLS else1;{
	ADD R3,R3,#1;	i = i + 1;
	B end; } 
else1;else {
	SUB R3,R3,#1;	i = i - 1;
end; }


; (iii)
	CMP R0,#10; if (v < 10) 
	BHS elseif;{
	MOV R1,#1; 	a = 1;
	B end; }
elseif
	CMP R0,#100; else if (v < 100) {
	BHS elseif2
	MOV R1,#10; 	a = 10;
	B end; }
elseif2
	CMP R0,#1000; else if (v < 1000) {
	BHS else
	MOV R1,#100; 	a = 100;
	B end; }
else; else {
	MOV R1,#0; 	a = 0;
	end; }


; (iv)
	MOV R0,#3; i = 3;
while
	CMP R0,#1000; while (i < 1000) {
	BHS end
	ADD R1,R1,#1; 	a = a + i;
	ADD R0,R0,#3; 	i = i + 3;
	B while
end; }


; (v) 

	MOV	R0,#3; for (int i = 3; i < 1000; i = i + 3) {
while
	CMP R0,#1000
	BHS end
	ADD R1,R1,#1
	ADD R0,R0,#3
	B while
end
; 	a = a + i;
; }


; (vi)
	MOV R0,R0,#1 ; p = 1;
do; do {
	MOV R1,#10
	MUL R0,R1,R0; 	p = p * 10;
	CMP R3,R0; } while (v < p);
	BHS do


; (vii)
	CMP R0,#'A'; if (ch >= 'A' && ch <= 'Z') {
	BLO after
	CMP R0,#'Z'
	BHI after
	SUB R0,R0,#0X20
	
	ADD R0,R0,#1; 	upper = upper + 1;
after; }


; (viii)
	CMP R0,#'a'; if (ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u')
	BNE then
then
    CMP R0,#'e'
	BNE then1
then1
	CMP R0,#'i'
	BNE then2
then2
	CMP R0,#'o'
	BNE then3
then3
	CMP R0,#'u'
	BNE end
	
	
; {
	ADD R3,R3,#1; 	v = v + 1;
end; }


STOP	B	STOP

	END
