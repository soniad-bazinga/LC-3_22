		.ORIG  x2000

		LD R7, val
		LD R0, val2
		STR R7, R0, 2


val1:   .FILL 1
val2:   .FILL 3

		
		.END
