#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 9
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: ***********
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

	jal COUNTCHAR

	j EXIT
    	
COUNTCHAR:
	WHILE:
		lb $t2, 0($a0)  # Carregando o primeiro byte para o endereço $t0
		beq $t2, 10, BREAK
		beqz $t2, BREAK   # if $t2 == 0 então va para label end
		add $a0, $a0, 1 # else incrementa o endereço
		add $t1, $t1, 1 # incrementando mais um no contador
		j WHILE      # fim do loop
	BREAK:
	jr $ra

EXIT:
	#printando valor da contagem de letras da string
	li $v0, 1
	move $a0, $t1
	syscall
