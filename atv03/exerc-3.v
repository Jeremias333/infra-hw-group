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
module exerc_tres(in_seg, resto, anos, mes, dias, horas, minutos, segundos);     // Inicio do modulo, dentro do parametro listar entrada e saída
	input wire [31:0] in_seg;                                                      // Declaro o tipo da entrada
	output reg [31:0] resto, anos, mes, dias, horas, minutos, segundos;            // Declaro os tipos das saídas
       
  	always @ (in_seg) begin            // toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		anos = (in_seg / 32'd315360000);              // (Anos == segundos / 31536000)
		resto = (in_seg % 32'd315360000);             // (Resto == segundos % 31536000)
		mes = (resto / 32'd2592000);                  // (Mes == resto / 2592000)
		resto = (in_seg % 32'd2592000);               // (Resto == segundos % 2592000)
		dias = (resto / 32'd86400);                   // (Dias == resto / 86400)
		resto = (in_seg % 32'd86400);                 // (Resto == segundos % 86400)
		horas = (resto / 32'd3600);                   // (Horas == resto / 3600)
		resto = (in_seg % 32'd3600);                  // (Resto == segundos % 3600)
		minutos = (resto / 32'd60);                   // (Minutos == resto / 60)
		segundos = (resto % 32'd60);                  // (Segundos == resto % 60)
		$display("%d anos, %d meses, %d dias, %d horas, %d minutos e %d segundos", anos, mes, dias, horas, minutos, segundos); // Mostra na tela e quebra linha
	end
endmodule                                  // Fim do modulo
