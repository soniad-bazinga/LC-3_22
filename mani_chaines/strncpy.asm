;copie la  chaine source dont l'adresse de début est dans R1 dans la chaine ;dest qui est dans R2 sur un nombre de caractères donné par R0

	.ORIG x3000

	LD RO, n   ;on recupere la taille a copier 
	LEA R1, str ; adresse de la chaine source 
	LEA R2, dest ; adresse de la chaine destination 


	LEA R6, pile ; adresse de la pile dans R6 
	JSR strncp

	NOP 


strncp: 	ADD R6, R6, -3
	STR R0, R0, 0
	STR R1, R6, 1
	STR R2, R6, 2

loop:	ADD R0, R0, -1 ; on commence à compter en décrémentant R0
	BRn end ; <0 donc fin de la boucle 
	LDR R3, R1, 0     
	STR R3, R2, 0		
	BRz ending		;fin de chaine atteinte
	ADD R1, R1, 1           ; prochain char de R1 (source)

ending:	ADD R2, R2, 1           ; *(R2) à null
	BR loop
	



	;; === pas dans la pile===
end:	LDR R0, R6, 0
	LDR R1, R6, 1
	LDR R2, R6, 2
	ADD R6, R6, 3
	RET

	.BLKW 3
stack:	.FILL 0

n:	.FILL 5
str:	.STRINGZ "HelloWorld"
empty:	.FILL 0			;Chaine vide
	
	.END