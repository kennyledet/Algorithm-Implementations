#  MIPS  Assembler
.data 
msj:
	.asciiz  "N: "
	
.text
main: 
	# Priint msj
	la $a0, msj
	li $v0, 4
	syscall
	
	# Read the n  from the standar input (keyboard)
	li $v0, 5
	syscall
	# Saves n in $t3
	move $t3, $v0
	
	# if the input is zero
	move $a0, $zero
	beq $t3, $zero, end
	
	# i, j
	li $t0, 0
	li $t1, 1
	
fibonacci: 
	# Sum of the last two elements
	add $t2,  $t0,  $t1
	# Save the fibo number in $a0
	move $a0, $t2
	# Sum for the next two values
	add $t1, $zero, $t0
	add $t0, $zero, $t2
	# Extract one number from n
	sub $t3, $t3, 1
	# Call to the function
	bne $t3, $zero, fibonacci
	# Finish the program
	beq $t3, $zero, end
	
end: 
	# Outputs the result
	li $v0, 1
	syscall
	
	# Ends correctly
	li $v0, 10
	syscall
