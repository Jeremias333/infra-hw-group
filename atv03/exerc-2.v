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
module maq_states (clk, data_in, data_out, shift_in, ctrl);
	//declarar entradas e saídas
	input wire clk, shift_in, ctrl;
	input wire [7:0] data_in; //8 bits
	output reg [7:0] data_out; //8 bits
	
	//descrever comportamento
	always @ (posedge clk) begin //2'b1=01; 2'b2=010; 2'b3=11
		if (ctrl == 2'b1) begin
			data_out <= data_in;
		end
		else if (ctrl == 2'b2) begin 
			data_out <= data_out >> 1; //Deslocamento a direita
			data_out[7]  <= shift_in;
		end
		else begin
			data_out <= data_out >> 1;
			data_out[7]  <= shift_in / 2; //?
		end
	end
endmodule 
