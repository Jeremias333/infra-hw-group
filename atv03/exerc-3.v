/*
-Nome do grupo: LearnWARE 
-Questão de número: 3
-Data: 27/05/2022
-Atividade de número: 3
-Disciplina: Infraestrutura de Hardware
-Professor: Vitor Coutinho
-Semestre Letivo: 3º semestre
-Turma: B
-Alunos: Diego Moura, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
-Objetivo do algoritmo: Vai pegar um input inteiro do usuário em segundos e transformar isso em um formato de anos, meses, dias, horas, minutos e segundos
*/
module exerc_tres();     // Inicio do modulo, dentro do parametro listar entrada e saída
	input wire [31:0] ;                                                      // Declaro o tipo da entrada
	output reg [31:0] ;            // Declaro os tipos das saídas
       
  	always @ () begin            // toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		
		$display(); // Mostra na tela e quebra linha
	end
endmodule                                  // Fim do modulo
