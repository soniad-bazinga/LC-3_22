		.ORIG x2000

		LD R7, cst
		JMP R7
		NOT R7, R7

cast:	.FILL 4

finish: NOT R7, R7

		.END