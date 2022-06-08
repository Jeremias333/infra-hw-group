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
-Objetivo do algoritmo: Vai pegar um input inteiro do usuário em segundos e transformar isso em um formato de anos, meses, dias, horas, minutos e segundos
*/
module maquuina_estados(entrada, clk, rst, saida, saida_estado); // Inicio do modulo, dentro do parametro listar entrada e saída
	input wire entrada, clk, rst;  // Declaro o tipo da entrada (que tem entrada, clock e o reset)
	output reg saida; // Declaro o tipo da saída (é reg devido a ser usado em um always)
	output wire [2:0] saida_estado; // Declaro o tipo da saída
	
	reg [2:0] estado; // Definir variáveis internas, o registrador de estado (aqui equivale a 8 estados)
	
	assign saida_estado = estado; //descrever comportamento do circuito
	
	always @ (posedge rst, posedge clk) begin // toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		if (rst == 1'b1) begin //reseta
			estado <= 3'd0;
		end
		else begin //comportamento regular (sem reset)
			case (estado) 
				3'd0:
					if (entrada == 1'b1) begin
						estado <= 3'd1;
					end
					else begin
						estado <= 3'd2;
					end
				3'd1:
					if (entrada == 1'b1) begin
						estado <= 3'd3;
					end
					else begin
						estado <= 3'd2;
					end
				3'd2:
					if (entrada == 1'b1) begin
						estado <= 3'd3;
					end
					else begin
						estado <= 3'd4;
					end
				3'd3:
					if (entrada == 1'b1) begin
						estado <= 3'd5;
					end
					else begin
						estado <= 3'd4;
					end
				3'd4:
					if (entrada == 1'b1) begin
						estado <= 3'd5;
					end
					else begin
						estado <= 3'd6;
					end
				3'd5:
					if (entrada == 1'b1) begin
						estado <= 3'd7;
					end
					else begin
						estado <= 3'd6;
					end
				3'd6:
					if (entrada == 1'b1) begin
						estado <= 3'd7;
					end
					else begin
						estado <= 3'd0;
					end
				3'd7:
					if (entrada == 1'b1) begin
						estado <= 3'd1;
					end
					else begin
						estado <= 3'd0;
					end
				default:
					estado <= 3'd0;
			endcase 
		end
	end
	
	always @ (estado) begin
		if ( (estado == 3'd6) || (estado == 3'd7) ) begin
			saida <= 1'b1;
		end
		else begin
			saida <= 1'b0;
		end
	end
endmodule 	// Fim do modulo
		
//$display(); // Mostra na tela e quebra linha                    
