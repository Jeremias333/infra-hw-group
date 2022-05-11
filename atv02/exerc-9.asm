#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 9
#Data: 10/05/2022
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: Recebe uma string e retorna a quantidade de caracteres que ela possui.
#################################################################################################################################################################
.data
	string: .space 60
.text

MAIN:
	li $t1, 0   #$t1 é o contador e vamos setta-lo em 0
	li $v0, 8   #settando para ler string
	la $a0, string #carregando endereço com uma variavel a ser utilizada
	la $a1, 60 #definindo tamanho a ser lido
	syscall

	jal COUNTCHAR #chamando função para contar caracteres

	j EXIT #saindo do programa e printando o resultado
    	
COUNTCHAR:
	WHILE:
		lb $t2, 0($a0)  # Carregando o primeiro byte para o endereço $t0
		beq $t2, 10, BREAK # Se for igual a um "Enter" sai do loop
		beqz $t2, BREAK   # se caracter atual for igual a == 0 ou seja \0 então sai do loop
		add $a0, $a0, 1 # else incrementa o endereço da string
		add $t1, $t1, 1 # incrementando mais um no contador
		j WHILE      # repete o loop
	BREAK: # irá sair do loop
	jr $ra # retornando ao MAIN

EXIT:
	#printando valor da contagem de letras da string
	li $v0, 1 #Tipo de impressão
	move $a0, $t1 #movendo ponteiro para valor atual da contagem
	syscall #imprimindo
