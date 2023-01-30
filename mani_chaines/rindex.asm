	.ORIG x3000

	LEA R1, str             ; adresse de début de la chaine
	LD R2, char             ; code du caractère	

	LEA R6, stack           ; chargement de la pile dans R6
	JSR rindex

	NOP

	;; sous-programme
	
	;; on stocke dans R0 adresse de la derniere occurrence de char dans str,
	;;	      0 sinon

	;; pile
rindex:	ADD R6, R6, -2          ; On fixe le ptr de pile au fond 
	STR R1, R6, 0           ; On sauve R1 en bas de la pile  
	STR R2, R6, 1           ; On sauve R2 en haut de la pile 
	
	NOT R2, R2		; On stocke -char à la place de char dans R2
	ADD R2, R2, 1		; (il faut add 1 car cplmt à 2)
	
loop:	LDR R3, R1, 0           ; Déréférençage du ptr sur la string
	BRz end                 ; si R1 -> 0 : la string est finie
	ADD R3, R3, R2		; O si R3==R2, ie *(R1)==R2
	BRz found
	
again:	ADD R1, R1, 1           ; on passe au caractère suivant de la string
	BR loop
	
found:	AND R0, R0, 0		; Reset de R0 et stockage de R1 (R0 contient
	ADD R0, R0, R1		; tjrs soit 0, soit le dernier resultat)
	BR again                ; On continue

	;; déchargement 
end:	LDR R1, R6, 0           ; On restaure R1
	LDR R2, R6, 1           ; On restaure R2
	ADD R6, R6, 2           ; On ramène le ptr de pile en haut de la pile
	
	RET

	.BLKW 2
stack:	.FILL 0

str:	.STRINGZ "hopeworld"
char:	.FILL 111		;Code ASCII de 'o'
	
	.END