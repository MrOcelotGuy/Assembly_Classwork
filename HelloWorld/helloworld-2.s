.data
tempLocation:	.WORD 1
helloString:	.ASCIZ "Hello World!"
nameString:		.ASCIZ "\n name and class redacted for github"

.TEXT
.GLOBAL main

main:
	LDR	R12, = tempLocation
	STR	LR, [R12]	
	
	LDR	R0, =helloString
	BL	printf
	
	LDR R0,	=nameString
	BL printf
	
	LDR	R12, =tempLocation
	LDR	LR, [R12]
	
	MOV	R0, #11
	BX	LR
