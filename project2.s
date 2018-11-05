.text
	main:
	
	la $a0, myWord #stores myWord into a0
	li $a1, 5 #string has max of 5 characters

	li $v0, 8 #gets the input
	syscall


	li $v0, 10
	syscall

.data
myWord: space 4
