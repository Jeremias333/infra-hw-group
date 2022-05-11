#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 7
#Data: 10/05/2022
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: Calcular a PG usando recursividade, recebendo dois input
#################################################################################################################################################################
.text
main:
	# Pegar input (razão q) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s1
	move $s1, $v0 #valor de q
	
	# Pegar input (termo n da PG que deseja ser calculado) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $s2
	move $s2, $v0 #valor de n
	
	#Receber o valor
	move $t1, $0 #recebe 0 em $t1
	
	#Chama a fun��o calculopg (n)
	jal calculopg
	
	#Printar o valor calculo
	li $v0, 1
	move $a0, $s3 #alterar
	syscall
	
	j exit
	
calculopg:
	sub $sp, $sp, 8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	slti $t0, $a0, 1
	beq $t0, $0, label
	
	li $v0, 1
	add $sp, $sp, 8
	jr $ra
	
label:  
	sub $a0, $a0, 1
	jal calculopg
	
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	add $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra

exit:
	#Fim do programa
	li $v0,10
	syscall
