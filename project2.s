.text
	main:
	
	la $a0, myWord #stores myWord into a0
	li $a1, 5 #string has max of 5 characters
	syscall

	li $v0, 8 #gets the input
	syscall


	li $v0, 10
	syscall

	div $a0, 10 #gets the last number of the string
	mfhi $t0
	add $s0, $t0, 27 #gets the base N and stores into s0
	syscall

.data
myWord: space 4
