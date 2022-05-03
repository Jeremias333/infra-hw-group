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
	
	#ultimo valor n�o printar virgula
	beq $s0, $t0,subOne
	
	#print da virgula
	addi $v0, $0, 4
	la $a0, virgula
	syscall
	
	#verifica��o se t0 � igual ao valor do usuario
	bne $s0, $t0, Print
	j subOne

subOne:
	#verificando se t0 � maior ou igual a 1
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
