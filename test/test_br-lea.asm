		.ORIG x2000


		BRp labell
		LEA R7, labell
		BRp labell
		NOT R7, R7

labell: NOT R7, R7


		.END
		