.data
	num0: .word 7
	num1: .word 2 
	num2: .word 5
	
	msg1: .asciiz "TRUE"
	msg2: .asciiz "FALSE"
	
	#A=$s1  B=$s2  C=$s3  D=$s4
.text
	# Pegar input (A) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s1
	move $s1, $v0
	
	# Pegar input (B) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s2
	move $s2, $v0
	
	# Pegar input (C) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s3
	move $s3, $v0
	
	# Pegar input (D) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s4
	move $s4, $v0
	
	#Calculo
	add $t0, $s1, $s4 #soma A+D e coloca o resultado num registrador temporario $t0
	lw $t1, num0 #recebe 7 em $t3
	lw $t2, num1 #recebe 2 em $t4
	lw $t3, num2 #recebe 5 em $t5
	beq $t0, $t1, L1 #se A+D==7 vai para LABEL1
	beq $s2, $t2, L1 #se B==2 vai para LABEL2
	bne $s2, $t2, Else #caso argumento anterior seja falso vai para o Else
	
	L1: beq $s2, $t2, Else #se B==2 vai para Else, pois é "or"
	bne $s3, $t3, L3 #se C!=5 vai para LABEL3
	beq $s3, $t5, Else #caso argumento anterior seja falso vai para o Else
	
	L2: bne $s3, $t3, L3 #se C!=5 vai para LABEL3
	beq $s3, $t5, Else #caso argumento anterior seja falso vai para o Else
	
	L3: li $v0, 4
	la $a0, msg1 #Imprime "TRUE"
	syscall
	
	#Sair
	addi $v0, $0, 10
	syscall
	
	Else: li $v0, 4
	la $a0, msg2 #Imprime "FALSE"
	syscall
