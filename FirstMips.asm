
# Declare main as a global function
.globl main 


.data
array: .space 40
max:	.word 0
maxS: .asciiz "The Maximum is "
sumS: .asciiz "\nThe Sum is "
newline: .asciiz "\n"

.text 		


main:
	#loading array#
	la $t6, array
	li $t0, 0

	li $t1, 11
	sw $t1, 0($t6)

	#addi $t6, $t6, 4

	li $t1, 12
	sw $t1, 4($t6)

	#addi $t6, $t6, 4

	li $t1, -10
	sw $t1, 8($t6)

	#addi $t6, $t6, 4

	li $t1, 13
	sw $t1, 12($t6)

	#addi $t6, $t6, 4

	li $t1, 9
	sw $t1, 16($t6)

	#addi $t6, $t6, 4

	li $t1, 12
	sw $t1, 20($t6)

	#addi $t6, $t6, 4

	li $t1, 14
	sw $t1, 24($t6)

	#addi $t6, $t6, 4

	li $t1, 15
	sw $t1, 28($t6)

	#addi $t6, $t6, 4

	li $t1, -20
	sw $t1, 32($t6)

	#addi $t6, $t6, 4

	li $t1, 0
	sw $t1, 36($t6)

	#addi $t6, $t6, 4

	#Find Max#
	jal findmax

	#Find Sum#t6 is still array head
	jal findsum

	li $v0, 10
	syscall
##################################################
findmax:
	la $a0, maxS
	li $v0, 4
	syscall

	la $t0, array
	#li $t2, 36
	#add $t2, $t0, $t2

	la $t5, array
	addi $t5, $t5, 40
	lw $a0, 0($t6)

	j loop
loop:
	lw $t3, 0($t0)
	slt $t4, $t3, $a0
	addi $t0, $t0, 4
	beq $t0, $t5, end
	beq $t4, $zero, asn

	j loop
asn:
	
	#$a0 is the max
	addi $a0, $t3, 0
	
	j loop

end:

	
	li $v0, 1
	syscall

	#li $v0, 10
	#syscall
	jr $ra
	#syscall # Exit
##################################################
findsum:
	la $a0, sumS
	li $v0, 4
	syscall

	la $t0, array
	la $t5, array
	addi $t5, $t5, 40
	li $a0, 0

	j looptwo

looptwo:
	#lw $t3, 0($t0)
	#addi $t0, $t0, 4
	
	lw $t2, 0($t0)
	add $a0 $a0, $t2
	addi $t0, $t0, 4

	beq $t0, $t5, endtwo
	j looptwo

endtwo:
	li $v0, 1
	syscall

	li $v0, 10
	syscall
	jr $ra
##################################################