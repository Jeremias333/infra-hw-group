/*
-Nome do grupo: LearnWARE 
-Questão de número: 1
-Data: 09/06/2022
-Atividade de número: 3
-Disciplina: Infraestrutura de Hardware
-Professor: Vitor Coutinho
-Semestre Letivo: 3º semestre
-Turma: B
-Alunos: Paulo Guerreiro, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
-Objetivo do algoritmo: É uma unidade lógico aritmética em verilog para fazer operações: add, sub, shift left, NOR.
*/

module ula (a, b, f1, f2, r);
	// a e b são entradas para o calculo com 8 bits
	input [7:0] a, b;
	// f1 e f2 são entradas para o calculo com 1 bit cada 
	// (no ULA da questão 2 da primeira atividade utilizamos apenas uma variável de 2 bits
	// porém aqui vamos mudar a abordagem).
	input f1, f2;
	//saída em r com 8 bits assim como a entrada.
	output reg [7:0] r;

	//aqui vai ficará definido o fluxo que vai acontecer no ULA
	//recebe a que é a primeira entrada, recebe b que é a segunda entrada
	//recebe também f1 e f2 que são as entradas de 1 bit para definir qual caminho o ula vai seguir
	always @ (a or b or f1 or f2) begin
		case ({f1, f2}) // duas variáveis de controle da ula que juntos configuram dois bits
			2'b00: r = a + b; //caso a combinação seja 00 o ula irá fazer a soma (ADD)
			2'b01: r = a - b; //caso a combinação seja 01 o ula irá fazer a subtração (SUB)
			2'b10: r = a << b; //caso a combinação seja 10 o ula irá fazer o shift left
			2'b11: r = ~a || ~b; //caso a combinação seja 11 o ula irá fazer o NOR
		endcase
	end
endmodule