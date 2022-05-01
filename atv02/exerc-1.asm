.data
	num0: .word 7
	num1: .word 2 
	num2: .word 5
	
	msg1: .asciiz "TRUE"
	msg2: .asciiz "FALSE"
	
	#A=$s1  B=$s2  C=$s3  D=$s4
.text
	addi $v0, $0, 5 #v0 recebe valor do usuario de A
	add $s1, $0, $v0 #s1 salva o valor do usuario de A
	addi $v0, $0, 5 #v0 recebe valor do usuario de B
	add $s2, $0, $v0 #s2 salva o valor do usuario de B
	addi $v0, $0, 5 #v0 recebe valor do usuario de C
	add $s3, $0, $v0 #s3 salva o valor do usuario de C
	addi $v0, $0, 5 #v0 recebe valor do usuario de D
	add $s4, $0, $v0 #s4 salva o valor do usuario de D
	
	add $t0, $s1, $s4 #soma A+D e coloca o resultado num registrador temporario $t0
	lw $t1, num0 #recebe 7 em $t3
	lw $t2, num1 #recebe 2 em $t4
	lw $t3, num2 #recebe 5 em $t5
	beq $t0, $t1, L1 #se A+D==7 vai para LABEL1
	beq $s2, $t2, L1 #se B==2 vai para LABEL1
	bne $s2, $t2, Else #caso argumento anterior seja falso vai para Else
	
	L1: bne $s3, $t3, L2 #se C!=5 vai para LABEL3
	beq $s3, $t5, Else #caso argumento anterior seja falso vai para Else
	
	L2: addi $s0, $0, 1
	la $a0, msg1 #carrega o endereco base da string em  $t2
	syscall #Imprime "TRUE"
	
	Else: addi $s0, $0, 1
	la $a0, msg2 #carrega o endereco base da string em  $t1
	syscall #Imprime "FALSE"
