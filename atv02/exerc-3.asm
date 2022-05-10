#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 3
#Data: 03/05/2022
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: recebe um valor N e printa todos os valores ate n, em seguida printa uma nova 
#			linha e vai at� n-1 continua fazendo isso ate chegar no valor 1
#################################################################################################################################################################
.data
	virgula: .asciiz ", "
	newline: .asciiz "\n"
	
.text
main:
	#receber um input e salvar em t0
	addi $v0, $0, 5 #v0 recebe valor do usuario
	syscall
	add $s0, $0,$v0 #s0 salva o valor do usuario
	jal Print
	
Print:
	#print input
	addi $t0, $t0, 1 #t0++
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	#ultimo valor não printar virgula
	beq $s0, $t0,subOne
	
	#print da virgula
	addi $v0, $0, 4
	la $a0, virgula
	syscall
	
	#verificação se t0 é igual ao valor do usuario
	bne $s0, $t0, Print
	j subOne

subOne:
	#verificando se t0 é maior ou igual a 1
	beq $s0, 1, exit
	
	#resetando t0 e subtraindo 1 do valor do usuario
	add $t0, $0, $0
	subi $s0, $s0, 1
	
	#printando nova linha
	addi $v0, $0, 4
	la $a0, newline
	syscall
	j Print

exit: 
	addi $v0, $0, 10
	syscall
