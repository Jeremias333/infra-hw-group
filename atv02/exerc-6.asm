.text
main:
	addi $v0, $0, 5 #v0 recebe valor do usuario
	syscall
	move $t0, $v0 #troca para t0
	subi $t0, $t0, 1 #necessario reduzir 1 do valor do usuario (casos base)
	jal fibonacci
	
	#parte para finalizar o programa
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

#começo da sequencia de fibonacci
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

	ble $t0, $t3, return #caso base (0, 1, 1, ...)

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
