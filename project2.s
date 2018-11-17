.data
	userinput:	.space 512
	emptyinput:	.asciiz "Input is empty"
	longinput:	.asciiz "Input is too long"
	invalidinput:	.asciiz "Invalid bsse-27 number"

.text

error_empty_input:
	la $a0, emptyinput
	li $v0, 4
	syscall
	j exit

error_long_input:
	la $a0, invalidinput
	li $v0, 4
	syscall
	j exit

error_invalid_input:
	la $a0, longinput
	li $v0, 4
	syscall
	j exit
	
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

	sub $s1, $s0, 10 #gets M and stores in $s1
	syscall

first_digit:
	li $s6, 35937
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0, 1
	j base_convert_input	

second_digit:
	li $s6, 1089
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0, 1
	j base_convert_input

third_digit:
	li $s6, 27
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7
	addi $s0, $s0, -1
	addi $a0, $a0
	j base_convert_input

fouth_digit:
	li $s6, 1
	mult $s4, $s6
	mflo $s7
	add $t7, $t7, $s7



.data
myWord: space 4
