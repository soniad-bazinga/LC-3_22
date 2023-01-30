	.ORIG x3000

	;;  R1 adresse de debut de str1
	;;  R2 adresse de debut de str2
	;;  R0 un entier > = ou < a 0 selon que str1 est plus grande,
	;;            egal ou plus petite que str2


	LEA R1, str1
	LEA R2, str2
	LEA R6, stack
	JSR strcmp

	NOP

	;; sous-programme
	
	;; chargement de la pile
strcmp:	ADD R6, R6, -2
	STR R1, R6, 0
	STR R2, R6, 1
	

	AND R0, R0, 0           ; init de la valeur de retour à 0

loop:	LDR R3, R1, 0           ; Deref du charac courant de la str1 dans R3
	BRz over1               ; str1 finie
	LDR R4, R2, 0           ; Deref du charac courant de la str1 dans R4
	BRz over2               ; str2 finie
	NOT R4, R4		; On stocke -char à la place de char dans R4
	ADD R4, R4, 1		; (il faut add 1 car cplmt à 2)
	ADD R0, R3, R4		; si *str1 == *str2 alors R0 = 0
	ADD R1, R1, 1           ; charac suivant de str1
	ADD R2, R2, 1           ; charac suivant de str2
	BR loop

over1:	LDR R4, R2, 0           ; si str2 est finie aussi on peut laisser R0
	BRz end                 ; à sa valeur courante
	LD R0, neg              ; sinon str1 < str2
	BR end
	
over2:	ADD R3, R3, 0           ; si str1 est finie aussi
	BRz end
	LD R0, pos              ; sinon str1 > str2
	
	;; déchargement 
end:	LDR R1, R6, 0
	LDR R2, R6, 1
	ADD R6, R6, 2
	
	RET

pos:	.FILL 1
neg:	.FILL -1

	.BLKW 2
stack:	.FILL 0
	
str1:	.STRINGZ "hope"
str2:	.STRINGZ "hopl"

	.END