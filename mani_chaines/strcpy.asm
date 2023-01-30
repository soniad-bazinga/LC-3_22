	.ORIG x3000


	LEA R1, str             ; récuperation de la chaine à copier
	LEA R2, empty           ; récuperatuin de l'adresse où copier la chaine
	LEA R6, stack           ; chargement de la pile dans R6
	JSR strcpy

	NOP

	;; sous-programme

	;; chargement de la pile
strcpy:	ADD R6, R6, -2      ; On fixe le ptr de pile au fond 
	STR R1, R6, 0           ; R1 est en bas de la pile  
	STR R2, R6, 1           ; R2 est en haut de la pile 




loop:	LDR R0, R1, 0           ; déréférençage (dans R0) du ptr sur string
	STR R0, R2, 0			; stockage du charactère pointé dans R2
	BRz end                 ; if char == 0, fin de la chaine (EOS)
	ADD R1, R1, 1           ; prochain char de la string
	ADD R2, R2, 1           
	BR loop                 ; boucle (jsq fin de la chaine)
	
	;; déchargement
end:	LDR R1, R6, 0           ; on restaure R1                             
	LDR R2, R6, 1           ; on restaure R2                             
	ADD R6, R6, 2           ; on ramène le ptr de pile en haut de la pile
	
	RET

	.BLKW 2
stack:	.FILL 0

str:	.STRINGZ "Hello!"
empty:	.FILL 0			; Chaine de caracteres vide

	.END