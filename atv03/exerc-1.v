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
-Objetivo do algoritmo: É uma unidade lógico aritmética em verilog.
*/
module ula (a, b, r, f, status_d, ctrl_f);
	input wire opcode, ctrl_f;
	input wire [7:0] a, b;   
	output reg [7:0] r;
	outpu reg status_d;

	always @(a or b or opcode) begin
		case(opcode) //2'b1=01; 2'b2=010; 2'b3=11
			2'b0: r = a + b;
			2'b1: r = a - b;
			2'b2: r = a << b;
			2'b3: r = ~a || ~b;
		endcase
	end

endmodule
