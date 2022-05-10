.data
	msg: .space 60 #string informada pelo usuario
	c1: .space 2 #char a ser trocado (coloquei space 2 pra ele identificar o enter)
	c2: .space 2 #char que sera posto no lugar (coloquei space 2 pra ele identificar o enter)
	
	frase: .asciiz "Digite a frase desejada: "
	esc_c1: .asciiz "Digite o caractere a ser alterado: "
	esc_c2: .asciiz "Digite o caractere que sera posto no lugar: "

.text
	#Mensagem para o usuario----------
	li $v0, 4 #instrução para printar na tela
	la $a0, frase #string pedindo a frase
	syscall

	#leitura da string
	li $v0, 8 #instução para receber a string
	la $a0, msg #carregando o endereço que vai ser armazenado na memoria 
	la $a1, 60 #numero de bytes que esta sendo esperado
	syscall 
	
	#Mensagem para o usuario-------
	li $v0, 4 #instrução para printar na tela
	la $a0, esc_c1 #string pedindo o char 1
	syscall
	
	#leitura do char a ser trocado
	li $v0, 8 #instução para receber a "string"
	la $a0, c1 #carregando o endereço que vai ser armazenado na memoria 
	la $a1, 3 #numero de bytes que esta sendo esperado
	syscall
	
	#Mensagem para o usuario----------
	li $v0, 4 #instrução para printar na tela
	la $a0, esc_c2 #string pedindo o char 2
	syscall
	
	#leitura do char que sera posto no lugar
	li $v0, 8 #instução para receber a "string"
	la $a0, c2 #carregando o endereço que vai ser armazenado na memoria 
	la $a1, 3 #numero de bytes que esta sendo esperado
	syscall
 
	la $t0, msg # carregando o endereço de msg para um registrador temporario
	la $t1, c1 # carregando o endereço de c1 para um registrador temporario
	la $t2, c2 # carregando o endereço de c2 para um registrador temporario

	lb $t1, 0($t1) # letra a ser alterada (pegando o indice 0 para desconsiderar o enter)
	lb $t2, 0($t2) # letra que será posta no lugar (pegando o indice 0 para desconsiderar o enter)

	#loop percorrendo o tamanho da string
	loop:
		lb $t3, 0($t0) #indice atual da frase
		beqz $t3, termina # se t3 apontar para um \0 cai fora do loop
		beq $t1, $t3, substitui # comparar com t1 para ver se tem que substituir
		add $t0, $t0, 1 #adicionando 1 no contador do loop
		j loop #voltando pro começo do loop

	substitui:
		sb $t2, 0($t0) #pegando o char 2 e salvando na frase
		add $t0, $t0, 1 #adicionando 1 no loop
		j loop # voltando para o loop

	termina:
		li $v0, 4 #instrução para finalizar o programa
		la $a0, msg #printando a frase alterada 
		syscall
