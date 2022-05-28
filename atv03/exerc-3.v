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
	output reg [8*6:1] msg0;                                                       // Declaro o tipo da saída
  	output reg [8*8:1] msg1, msg2, msg3;                                           // Declaro os tipos das saídas
  	output reg [8*11:1] msg4;                                                      // Declaro o tipo da saída
  	output reg [8*9:1] msg5;                                                       // Declaro o tipo da saída
  
  	parameter NUM0 = 2’d60                    // Rotulando a cadeia de 2 bits 60 como NUM0
  	parameter NUM1 = 4’d3600                  // Rotulando a cadeia de 4 bits 3600 como NUM1
  	parameter NUM2 = 5’d86400                 // Rotulando a cadeia de 5 bits 86400 como NUM2
  	parameter NUM3 = 7’d2592000               // Rotulando a cadeia de 7 bits 2592000 como NUM3
  	parameter NUM4 = 8’d31536000              // Rotulando a cadeia de 8 bits 31536000 como NUM4
  
  	always @ (in_seg) begin            // toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
   		anos = in_seg / NUM4                    // (Anos == segundos / 31536000)
    		resto = in_seg % NUM4                   // (Resto == segundos % 31536000)
    		mes = resto / NUM3                      // (Mes == resto / 2592000)
    		resto = in_seg % NUM3                   // (Resto == segundos % 2592000)
    		dias = resto / NUM2                     // (Dias == resto / 86400)
    		resto = in_seg % NUM2                   // (Resto == segundos % 86400)
    		horas = resto / NUM1                    // (Horas == resto / 3600)
   		resto = in_seg % NUM1                   // (Resto == segundos % 3600)
   		minutos = resto / NUM0                  // (Minutos == resto / 60)
   		segundos = resro % NUM0                 // (Segundos == resto % 60)
   		$display("anos=%d msg0=%s mes=%d msg1=%s dias=%d msg2=%s horas=%d msg3=%s minutos=%d msg4=%s segundos=%d msg5=%s", anos, msg0, mes, msg1, dias, msg2, horas, msg3, minutos, msg4, segundos, msg5); // Mostra na tela e quebra linha
	end
endmodule                            // Fim do modulo
