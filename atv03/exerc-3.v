/*
-Nome do grupo: LearnWARE 
-Questão de número: 3
-Data: 27/05/2022
-Atividade de número: 3
-Disciplina: Infraestrutura de Hardware
-Professor: Vitor Coutinho
-Semestre Letivo: 3º semestre
-Turma: B
-Alunos: Paulo Guerreiro, Elder Lamarck, Jacquelin Busch, Jeremias Oliveira
-Objetivo do algoritmo: É uma máquina de moore em verilog.
*/
module maq_states(entrada, clk, rst, saida_geral, saida_refri, saida_troco, saida_estado); // Inicio do modulo, dentro do parametro listar entrada e saída
	input wire entrada, clk, rst;  // Declaro o tipo da entrada (que tem entrada, clock e o reset)
	output reg saida_geral, saida_refri, saida_troco; // Declaro o tipo da saída (é reg devido a ser usado em um always)
	output wire [2:0] saida_estado; // Declaro o tipo da saída
	
	reg [2:0] estado; // Definir variáveis internas, o registrador de estado (aqui equivale a 8 estados)
	
	assign saida_estado = estado; // Descrever comportamento do circuito
	
	always @ (negedge rst, negedge clk) begin // Toda vez que a entrada mudar, vai executar dentro bloco sequencialmente, quando é negedge é sensível a borda de descida do sinal de clock
		if (rst == 1'b0) begin 
			estado <= 3'd0; // Reseta
		end
		else begin // Comportamento regular, sem reset
			case (estado) // OBS: 3'd1=001; 3'd2=010; 3'd3=011; 3'd4=100; 3'd5=101; 3'd6=110; 3'd7=111
				3'd0: // Estágio 1
					if (entrada == 1'b1) begin // Se for 1
						estado <= 3'd2; // A entrada A vai para o estágio 3
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd1; // A entrada B vai para o próximo estágio 2
					end
					else begin
						estado <= 3'd3; // Quando a situação AB ocorre vai para o estágio 4
					end
				3'd1: // Estágio 2
					if (entrada == 1'b1) begin
						estado <= 3'd3; // A entrada A vai para o estágio 4
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd2; // A entrada B vai para o próximo estágio 3
					end
					else begin
						estado <= 3'd4; // Quando a situação AB ocorre vai para o estágio 5
					end
				3'd2: // Estágio 3
					if (entrada == 1'b1) begin 
						estado <= 3'd4; // A entrada A vai para o estágio 5
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd3; // A entrada B vai para o próximo estágio 4
					end
					else begin
						estado <= 3'd5; // Quando a situação AB ocorre vai para o estágio 6
					end
				3'd3: // Estágio 4
					if (entrada == 1'b1) begin
						estado <= 3'd5; // A entrada A vai para o estágio 6
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd4; // A entrada B vai para o próximo estágio 5
					end
					else begin
						estado <= 3'd6; // Quando a situação AB ocorre vai para o estágio 7
					end
				3'd4: // Estágio 5
					if (entrada == 1'b1) begin
						estado <= 3'd6; // A entrada A vai para o estágio 7
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd5; // A entrada B vai para o próximo estágio 6
					end
					else begin
						estado <= 3'd7; // Quando a situação AB ocorre vai para o estágio 8
					end
				3'd5: // Estágio 6
					if (entrada == 1'b1) begin
						estado <= 3'd7; // A entrada A vai para o estágio 8
					end
					else begin
						estado <= 3'd0; // Reseta e vai para o estágio 1
					end
				3'd6: // Estágio 7
					estado <= 3'd0; // Reseta e vai para o estágio 1
				3'd7: // Estágio 8
					estado <= 3'd6; // Reseta e vai para o estágio 7
			endcase 
		end
	end
	
	always @ (estado) begin // Toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		if ( (estado == 3'd5) || (estado == 3'd6) ) begin  // Se for o estágio 6 e 7
			saida_refri <= 1'b1; // A saída do refrigerante é 1
		end
		else if ( (estado == 3'd6) || (estado == 3'd7) ) begin // Senão se for o estágio 7 e 8
			saida_troco <= 1'b1; // A saída do troco é 1
		end
		else begin // Senão todas as saídas é 0
			saida_geral <= 1'b0; // A saída é 0
		end
	end
endmodule // Fim do modulo
