		.ORIG x3000

		LD R0, val1
		LD R1, val2
		LDR R7, R0, 1

val1:   .FILL 2
val2: 	.FILL 4

		
		.END