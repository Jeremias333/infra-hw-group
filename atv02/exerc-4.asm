#################################################################################################################################################################
#Nome do grupo: LearnWARE 
#Questão de número: 4
#Atividade de número: 2
#Disciplina: Infraestrutura de Hardware
#Professor: Vitor Coutinho
#Semestre Letivo: 3º semestre
#Turma: B
#Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
#Objetivo do algoritmo: Vai pegar um input inteiro do usuário em segundos e transformar isso em um formato de anos, meses, dias, horas, minutos e segundos
#################################################################################################################################################################
.data
	num0: .word 60
	num1: .word 3600
	num2: .word 86400
	num3: .word 2592000 #mês de 30 dias
	num4: .word 31536000 #não é ano bissexto
	msg0: .asciiz " anos, "
	msg1: .asciiz " meses, "
	msg2: .asciiz " dias, "
	msg3: .asciiz " horas, "
	msg4: .asciiz " minutos e "
	msg5: .asciiz " segundos"
	
	#ANO=$s1  MES=$s2  DIA=$s3  HORA=$s4  MINUTO=$s5  SEGUNDO=$s6
	#FORMATO: “Y anos, M meses, D dias, H horas, M minutos e S segundos”
.text
	# Pegar input (valor em segundos) do usuário
	li $v0, 5
	syscall
	
	# Salvar o resultado em $t0
	move $t0, $v0
	
	#Receber valores
	lw $t2, num0 #recebe 60 em $t2
	lw $t3, num1 #recebe 3600 em $t3
	lw $t4, num2 #recebe 86400 em $t4
	lw $t5, num3 #recebe 2592000 em $t5
	lw $t6, num4 #recebe 31536000 em $t6
	
	#Calculo
	div $s1, $t0, $t6 #(Anos == segundos / 31536000)
	rem $t1, $t0, $t6 #(Resto == segundos % 31536000)
	div $s2, $t1, $t5 #(Mes == resto / 2592000)
	rem $t1, $t0, $t5 #(Resto == segundos % 2592000)
	div $s3, $t1, $t4 #(Dias == resto / 86400)
	rem $t1, $t0, $t4 #(Resto == segundos % 86400)
	div $s4, $t1, $t3 #divisão de segundos por 3600 e coloca o resultado em $s4 (Horas == resto / 3600)
	rem $t1, $t0, $t3 #resto da divisão de segundos por 3600 e coloca o resultado em $t1 (Resto == segundos % 3600)
	div $s5, $t1, $t2 #divisão do $t1 por 60 e coloca o resultado em $s5 (Minutos == resto / 60)
	rem $s6, $t1, $t2 #resto da divisão de $t1 por 60 e coloca o resultado em $s6 (Segundos == resto % 60)
	
	#Printar o resultado do calculo de anos
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Mostrar a mensagem formatada de anos
	li $v0, 4
	la $a0, msg0
	syscall
	
	#Printar o resultado do calculo de meses
	li $v0, 1
	move $a0, $s2
	syscall
	
	#Mostrar a mensagem formatada de meses
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Printar o resultado do calculo de dias
	li $v0, 1
	move $a0, $s3
	syscall
	
	#Mostrar a mensagem formatada de dias
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Printar o resultado do calculo de horas
	li $v0, 1
	move $a0, $s4
	syscall
	
	#Mostrar a mensagem formatada de horas
	li $v0, 4
	la $a0, msg3
	syscall
	
	#Printar o resultado do calculo de minutos
	li $v0, 1
	move $a0, $s5
	syscall
	
	#Mostrar a mensagem formatada de minutos
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Printar o resultado do calculo de segundos
	li $v0, 1
	move $a0, $s6
	syscall
	
	#Mostrar a mensagem formatada de segundos
	li $v0, 4
	la $a0, msg5
	syscall
