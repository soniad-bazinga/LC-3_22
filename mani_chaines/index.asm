	.ORIG x3000

	LEA R1,string ; Chargement dans RO de l'adresse de la chaîne
	
	LD R2,caractere ; Chargement du caractère dans R2

	JSR index

	NOP


index:	ADD R6, R6, -2          ; On fixe le ptr de pile au fond de la pile
	STR R1, R6, 0           ; On sauve R1 en bas de la pile
	STR R2, R6, 1           ; On sauve R2 en haut de la pile 

	AND R0, R0, 0           ; Initialisation du registre de fin (R0) à 0
	NOT R2, R2		; On stocke -char à la place de char dans R2
	ADD R2, R2, 1		; (il faut add 1 car cplmt à 2)
	
loop:	LDR R3, R1, 0           ; Déréférençage du ptr sur la string
	BRz end                 ; si R1 -> 0 : la string est finie
	ADD R3, R3, R2		; O si R3==R2, ie *(R1)==R2
	BRz found               ; si 0 : index trouvé
	ADD R1, R1, 1           ; on passe au caractère suivant de la string
	BR loop                 ; évaluation du caractère suivant
	
found:	ADD R0, R0, R1          ; stockage de l'index de char dans R0




end:	LDR R1, R6, 0           ; On restaure R1
	LDR R2, R6, 1           ; On restaure R2
	ADD R6, R6, 2           ; On ramène le ptr de pile en haut de la pile
	RET

	.BLKW 2
stack:	.FILL 0

str:	.STRINGZ "apt"
char:	.FILL 112		;Code ASCII de 'p'
	
	.END