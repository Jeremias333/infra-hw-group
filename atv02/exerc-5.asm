#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 5
#Data: 10/05/2022
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: Calcula uma média móvel de um array de inteiros, unindo todos num array de saídas
#################################################################################################################################################################
.data
	n_invalido: .asciiz "N invalido\n"
	quebra_d_linha: .byte '\n'
	
.text
		main:
		li $v0, 5 #receber o N
		syscall
		
		move $s0, $v0 #salvando o N em s0
		
		blt $s0, 6, invalido #se N for menor que 6 vai para label invalido
		
		mul $s0, $s0, 4 #multiplicando n por 4(tamanho de bytes de um inteiro)
		subi $s1, $s0, 20 #pegando o N do array de saida y
		
		#alocando na memoria o array de entrada
		li $v0, 9
		add $a0, $0, $s0
		syscall
		add $s2, $0, $v0 #guardando o endereço de memoria em um lugar seguro
		
		#alocando na memoria o array de saida y
		li $v0, 9 
		add $a0, $0, $s1
		syscall
		add $s3, $0, $v0 #guardando o endereço de memoria em um lugar seguro
		
		add $t0, $0, $0 #iniciaizando como 0 para servir de contador
		
		#loop para percorrer e preencher o array de entrada
		loopx:
			bge $t0, $s0, saidax #se contador maior ou igual a N*4 sai do loop
			
			li $v0, 5 #recebendo o input do indice
			syscall
			
			#armazenando o indice no array de entrada
			add $t1, $t0, $s2 #t1 recebe um indice t0 mais o endereço de memoria de x
			sw $v0, 0($t1) #salvando o input no array
			addi $t0, $t0, 4 #adicionando 4 no contador(indo de 4 em 4 porque indices são inteiros)
			j loopx # voltando para o começo do loop
		saidax:
		
		add $t0, $0, $0 #inicilizando de novo o contador como 0
		
		#loop para preencher a array de saida y
		loopy: 
			bge $t0, $s1, saiday #verificando se o contaador é maior ou igual ao tamanho to array de saida y		
			
			add $t2, $0, $t0 #iniciando um contador pro loop de calculo do indice do array y 
			calcular:
				bge $t2, $s0, sair # verfica se é maior que o N para sair
				
				add $t4, $s2, $t2 #percorrendo o array
				lw $t4, 0($t4) #carregando o indice pra poder usar o add abaixo
				add $t3, $t3, $t4 #somando o total da soma com o indice atual
				
				add $t2, $t2, 4 #adicionando 4 no contador
				j calcular #voltando para o loop calcular
			sair:
			add $t1, $t0, $s3 #t1 recebe um indice t0 mais o endereço de memoria de y
			div $t3, $t3, 6 #dividindo o total da soma por 6
			sw $t3, 0($t1) #salvando a soma no indice atual do array de saida y
			add $t3, $0, $0 #zerando a soma
			addi $t0, $t0, 4 #adicionando 4 no contador(indo de 4 em 4 porque indices são inteiros)
			j loopy #voltando para o começo do loop y
		saiday:
		
		add $t0, $0, $0 #inicilizando de novo o contador como 0
		
		#imprimindo o \n para a quebra de linha
		li $v0, 4
		la $a0, quebra_d_linha
		syscall
		
		#loop para printar o array de entrada
		printx:
			add $t1, $t0, $s2
			bge $t0, $s0, saidaprintx
			lw $a0, 0($t1)
			li $v0, 1
			syscall
			addi $t0, $t0, 4
			
			#imprimindo o \n para a quebra de linha
			li $v0, 4
			la $a0, quebra_d_linha
			syscall
			j printx
		saidaprintx:
		
		add $t0, $0, $0 #inicilizando de novo o contador como 0
		
		#imprimindo o \n para a quebra de linha
		li $v0, 4
		la $a0, quebra_d_linha
		syscall
		
		#loop para printar o array de saida y
		printy:
			add $t1, $t0, $s3
			bge $t0, $s1, saidaprinty
			lw $a0, 0($t1)
			li $v0, 1
			syscall
			addi $t0, $t0, 4
			
			#imprimindo o \n para a quebra de linha
			li $v0, 4
			la $a0, quebra_d_linha
			syscall
			j printy
		saidaprinty:
			
		#finalizar o programa
		li $v0, 10 # instrução para finalizar o programa
		syscall
    
	invalido:
		#printa mensagem de N invalido
		li $v0, 4 #instrução para printar string
		la $a0, n_invalido #printando a string de numero invalido
		syscall
		
		j main #voltando pro main para pedir um novo número 
