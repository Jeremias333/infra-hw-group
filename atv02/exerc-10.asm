#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 10
#Data: 01/05/2022
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: ***********
#################################################################################################################################################################
.data
	#inicializando valores aleatorios para criação das variaveis.
	zero: .float 0.0
	case1: .asciiz "X maior que Y"
	case2: .asciiz "Y maior que X"
	case3: .asciiz "X igual a Y"

.text
	#inicializando registradores floats com valor 0.0
	lwc1 $f2, zero #variavel X
	lwc1 $f4, zero #variavel Y
	
	#lendo valores para $f0
	li $v0, 6
	syscall
	#adicionando valor atual do $f0 ao valor inicial do $f2 que resultará
	#no registrador $f12 sendo nossa variável X
	add.s $f12, $f0, $f2

	#lendo valores mais uma vez para $f0	
	li $v0, 6
	syscall
	#adicionando valor atual do $f0 ao valor inicial do $f4 que resultará
	#no registrador $f13 sendo nossa variável Y
	add.s $f13, $f0, $f4
	
	#verificando se Y é menor que X
	c.lt.s  $f13, $f12 # y < x
	bc1t CASE1 #irá chamar label que printa resultado para este caso
	
	#verificando se X é igual a Y
	c.eq.s $f12, $f13 # x == y
	bc1t CASE3 #irá chamar a label que printa resultado para este caso
	
	#Se nenhum dos casos acima forem chamados, este será
	#X é menor que Y
	b CASE2 # x < y
	
	CASE1:
		#Irá printar case 1 e logo em seguida chamar label de saída.
		li $v0, 4
		la $a0, case1
		syscall
		j EXIT
	CASE2:
		#Irá printar valor do case 2 e logo em seguida chamar label de saída.
		li $v0, 4
		la $a0, case2
		syscall
		j EXIT
	CASE3:
		#Irá printar valor do case 3 e logo em seguida sair do programa.
		li $v0, 4
		la $a0, case3
		syscall
		j EXIT
	
	EXIT:
