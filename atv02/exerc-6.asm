.text
main:
	addi $v0, $0, 5 #v0 recebe valor do usuario
	syscall
	move $t5, $v0
	
	sub $t0, $t5, 1
	jal fibonacci
	
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

fibonacci:
	move $t1, $0
	move $t2, $sp
	li $t3, 1
	
	addi $sp, $sp, -4
	sw $t0, 0($sp)

recursive:
	beq $sp, $t2, fibExit

	lw $t4, 0($sp)
	addi $sp, $sp, 4

	bleu $t4, $t3, earlyReturn

	sub $t4, $t4, 1
	addi $sp, $sp, -4
	sw $t4, 0($sp)

	sub $t4, $t4, 1
	addi $sp, $sp, -4
	sw $t4, 0($sp)

	j recursive

earlyReturn:
	add $t1, $t1, $t4
	j recursive

fibExit:
	jr $ra
	
exit:
	li $v0, 10
	syscall