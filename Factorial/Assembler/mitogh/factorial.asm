# MIPS
# Iterative Factorial
.data 
msj: 
	.asciiz "N:" 
	
.text
main:
	# Print the message 
	la $a0, msj
	la $v0, 4
	syscall 
	
	# Red an integer
	li $v0, 5
	syscall
	# Saves N in $t0
	move $t0, $v0
	
	# t1 is factorial with = 1
	li $t1, 1 
	# Do not start the loop if n <= 1
	ble $t0, 1, end

factorial: 
	# Factorial t1 = t1 * t0 
	mul $t1, $t1, $t0
	# Substract one from N 
	sub $t0, $t0, 1
	# Repeat the loop
	bge $t0, 1, factorial
	# Finish loop 
	beq $t0, 1, end
	
end: 
	# Move the result to the Output
	move $a0, $t1
	# Prints the rezult
	li $v0, 1
	syscall 
	# Finish the program
	li $v0, 10
	syscall