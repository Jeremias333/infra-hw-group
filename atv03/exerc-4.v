/*
-Nome do grupo: LearnWARE 
-Questão de número: 4
-Data: 27/05/2022
-Atividade de número: 3
-Disciplina: Infraestrutura de Hardware
-Professor: Vitor Coutinho
-Semestre Letivo: 3º semestre
-Turma: B
-Alunos: Paulo Guerreiro, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
-Objetivo do algoritmo: É uma multiplicar sem usar o operador de multiplicação em verilog.
*/
module mult #(parameter N=2) // Inicio do modulo, dentro tem a quantidade de parametro
	(input start, rst, // Declaro o tipo da entrada (que tem start e o reset)
	 output reg saida); // Declaro o tipo da saída (é reg devido a ser usado em um always)

	while(incrementar <= b) begin // Enquanto o incremento for menor ou igual a b
		saida += a; // Vai fazer as somas de e colocar no resultado
		incrementar++; // E soomar o incremento 
	end
endmodule //Fim do modulo
