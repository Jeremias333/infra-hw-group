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
	
	assign saida_estado = estado; //descrever comportamento do circuito
	
	always @ (negedge rst, negedge clk) begin // Toda vez que a entrada mudar, vai executar dentro bloco sequencialmente
		if (rst == 1'b0) begin // Reseta
			estado <= 3'd0;
		end
		else begin //comportamento regular (sem reset)
			case (estado) //3'd1=001; 3'd2=010; 3'd3=011; 3'd4=100; 3'd5=101; 3'd6=110; 3'd7=111
				3'd0:
					if (entrada == 1'b1) begin //=1
						estado <= 3'd2; //A  
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd1;// B
					end
					else begin
						estado <= 3'd3; // AB
					end
				3'd1:
					if (entrada == 1'b1) begin
						estado <= 3'd3; // A
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd2;// B
					end
					else begin
						estado <= 3'd4; // AB
					end
				3'd2:
					if (entrada == 1'b1) begin 
						estado <= 3'd4; //A 
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd3;// B
					end
					else begin
						estado <= 3'd5; //AB
					end
				3'd3:
					if (entrada == 1'b1) begin
						estado <= 3'd5;//A 
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd4;//B
					end
					else begin
						estado <= 3'd6; //AB
					end
				3'd4:
					if (entrada == 1'b1) begin
						estado <= 3'd6;//A
					end
					else if (entrada == 1'b1) begin 
						estado <= 3'd5;//B
					end
					else begin
						estado <= 3'd7;//AB
					end//3'd1=001; 3'd2=010; 3'd3=011; 3'd4=100; 3'd5=101; 3'd6=110; 3'd7=111
				3'd5://aqui
					if (entrada == 1'b1) begin
						estado <= 3'd7;//A
					end
					else begin
						estado <= 3'd0;//Reseta
					end
				3'd6:
					estado <= 3'd0;
				3'd7:
					estado <= 3'd6;
			endcase 
		end
	end
	
	always @ (estado) begin
		if ( (estado == 3'd5) || (estado == 3'd6) ) begin
			saida_refri <= 1'b1;
		end
		else if ( (estado == 3'd6) || (estado == 3'd7) ) begin 
			saida_troco <= 1'b1;
		end
		else begin
			saida_geral <= 1'b0;
		end
	end
endmodule 	// Fim do modulo
