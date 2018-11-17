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


left_pad:
	li $t8, 32 
	lb $t9, 0($a0)
	beq $t8, $t9, first_char
	move $t9, $a0
	j input_len

first char:
	addi $a0, $a0, 1
	j left_pad

input_length:
	addi $t0, $t0, 0
	addi $t1, $t1, 10
	add $t4, $t4, $a0

find_length:
	lb $t2, 0($a0)
	beq $t2, length_found
	beq $t2, $t1, length_found
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j find_length

length_found:
	beqz $t0, error_empty_input
	slti $t3, $t0, 5
	beqz $t3, error_long_input
	move $a0, $t4
	

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

print:
	li $v0, 1
	move $a0, $t7
	syscall

exit:
	li $v0, 10
	syscall


