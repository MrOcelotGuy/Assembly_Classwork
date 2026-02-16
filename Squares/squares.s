@Ocelot Guy hw wowie
/*
Program Description:

This program goes through numbers 0-99 and prints out their squares
using a do-while loop so that only 1 branch is used.
*/

.data
tempR4:		.word 1
tempLR:		.word 1

copyright:	.ASCIZ "redacted for github\n"
headStr:	.ASCIZ "Number\t Square\n"
@Format so that R1 appears first, then there's a tab, then R2 appears last and a new line
printStr:	.ASCIZ "%d\t %d\n"

.TEXT
.GLOBAL main 

main:
	@saving R4 register since I need a persistent counter
	LDR R12, =tempR4
	STR R4,	[ R12 ]
	
	@saving LR register since I used BL
	LDR R12, =tempLR
	STR	LR,	 [ R12 ]
	
	@print out copyright almost forgot
	LDR R0, =copyright
	BL printf
	
	@print out the head thingy
	LDR R0, =headStr
	BL printf
	
	@give r4 the starting value of 0 so I can have my strings until 99
	MOV R4, #0
	
	@The do while loop
	Loop:
	
		@Input the number into the string
		MOV R1, R4
	
		@Input the square into the string and square it
		MOV R2, R4
		MUL R2, R4, R4
		
		@Load the format string into R0 and then print it
		
		LDR R0, =printStr
		BL printf
		
		@BL should reset R0-R2 values
		
		@Add 1 to the value of R4 for the counter
		ADD R4, R4, #1
		
		//Make sure that R4 is less than 100
		CMP R4,	#100
		BNE Loop
	
	Exit:
	
	@restoring registers
	LDR	R12, =tempR4
	LDR R4,	[ R12 ]
	LDR R12, =tempLR
	LDR LR,	[ R12 ]
	
	@exit the program
	MOV   R0, #0  
    BX    LR
	
