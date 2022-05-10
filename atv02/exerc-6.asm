#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#QuestÃ£o de nÃºmero: 6
#Data: 07/05/2022
#Atividade de nÃºmero: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3Âº semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: encontrar o valor que corresponde a posição N na 
#			sequencia de fibonacci.
#################################################################################################################################################################
.text
main:
	addi $v0, $0, 5 #v0 recebe N
	syscall
	move $t0, $v0 #troca para t0
	subi $t0, $t0, 1 #-1 para tornar a posição de numero 1 como a primeira posição
	jal fibonacci
	
	#parte para finalizar o programa
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

#comeÃ§o da sequencia de fibonacci
fibonacci:
	move $t1, $0 #caso base
	move $t2, $sp #salvar o primeiro chamado da pilha
	li $t3, 1
	
	addi $sp, $sp, -4
	sw $t0, 0($sp) #salvando o valor do usuario -1

#entra por ordem logica
recursive:
	beq $sp, $t2, fibExit #quando voltar pro primerio, retorno para main

	lw $t0, 0($sp) #salvando valor da pilha
	addi $sp, $sp, 4 #percorrendo de 4 em 4 bytes

	ble $t0, $t3, return 

	sub $t0, $t0, 1 #n-1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	sub $t0, $t0, 1 #n-2
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	j recursive

return:
	add $t1, $t1, $t0 #fib(n-1) + fib(n-2)
	j recursive

fibExit:
	jr $ra
	
exit:
	li $v0, 10
	syscall
