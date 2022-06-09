/*
-Nome do grupo: LearnWARE 
-Questão de número: 2
-Data: 09/06/2022
-Atividade de número: 3
-Disciplina: Infraestrutura de Hardware
-Professor: Vitor Coutinho
-Semestre Letivo: 3º semestre
-Turma: B
-Alunos: Paulo Guerreiro, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
-Objetivo do algoritmo: É um registrador de deslocamento síncrono em verilog.
*/
module shiftreg (clk, data_in, data_out, shift_in, ctrl); // Inicio do modulo, dentro do parametro listar as entradas e saídas
	input wire clk, shift_in, ctrl; // Declara o tipo da entrada
	input wire [7:0] data_in; // Declaro o tipo da saída
	output reg [7:0] data_out; // Declaro o tipo da saída (é reg devido a ser usado em um always) e ttem o valor de 8 bits
	
	// Descreve comportamento do código
	always @ (posedge clk) begin // Toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		if (ctrl == 1'b00) begin // Se for 00
			data_out <= data_out[0]; // Mantém a saída (data_out) no estado atual
		end
		else if (ctrl == 2'b01) begin // Se for 01
			data_out <= data_in; // Carrega os bits da entrada paralela para o registrador (data_out)
		end
		else if (ctrl == 2'b10) begin // Se for 10
			data_out <= data_out >> 1; //Deslocamento a direita
			data_out[7]  <= shift_in;
		end
		else begin
			data_out <= data_out >> 1; //Deslocamento a direita
			data_out[6]  <= shift_in;
		end
	end
endmodule 
