programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t

	
	const inteiro ROSA  = 0xE81E4A 
	const inteiro FUNDO = 0x0B1D21 
	const inteiro AZUL  = 0x078A85 
	const inteiro VERDE = 0x68BAAB 
	const inteiro CREME = 0xEDD5C5 

	funcao inicio()
	{
         //VARIAVEIS DO TIPO REAL 0,00, INTEIRO, CADEIA (VARCHAR) 
		real valor_desconto_dia = 0.0
		real total_recebido_loja = 0.0
		real valores_gastos[6]
		inteiro total_clientes_com_desconto = 0
		cadeia nomes_clientes[6]
		real valores_finais[6]
		cadeia status_desconto[6]

		//ENTRADA DE DADOS
		escreva("=== GERENCIADOR DE VENDAS DIÁRIAS - LOJA DE JOGOS ===\n\n")
		
		escreva("Informe o valor do desconto especial de hoje (R$): ")
		leia(valor_desconto_dia)
		escreva("\n--------------------------------------------------\n")
		escreva("   COLETA DE DADOS DOS 6 CLIENTES DO DIA\n")
		escreva("--------------------------------------------------\n")

		//ESTRUTURA DE REPETICAO PARA LER OS DADOS DOS SEIS CLIENTES
		para (inteiro i = 0; i < 6; i++)
		{
			escreva("\n[Cliente #", i + 1, "]\n")
			escreva("Nome: ")
			leia(nomes_clientes[i])
			escreva("Valor total gasto (R$): ")
			leia(valores_gastos[i])

			//LOGICA VERIFICANDO SE O GASTO E MAIOR QUE 100
			se (valores_gastos[i] > 100.00)
			{
				valores_finais[i] = valores_gastos[i] - valor_desconto_dia
				status_desconto[i] = "GANHOU DESCONTO"
				total_clientes_com_desconto++ // Incrementa o contador
			}
			senao
			{
				valores_finais[i] = valores_gastos[i]
				status_desconto[i] = "SEM DESCONTO"
			}

			//TOTAL SOMADO EM CADA PASSAGEM DO ALGORITIMO
			total_recebido_loja = total_recebido_loja + valores_finais[i]
		}

          //PARTE GRAFICA 
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(700, 600)
		g.definir_titulo_janela("Painel de Vendas Diárias - Loja de Jogos")

		
		enquanto (nao t.tecla_pressionada(t.TECLA_ESC))
		{
			g.definir_cor(FUNDO) 
			g.limpar()
			
			g.definir_cor(ROSA)
			g.desenhar_retangulo(40, 20, 620, 50, falso, verdadeiro)
			
			g.definir_cor(CREME)
			g.definir_tamanho_texto(18.0)
			g.desenhar_texto(190, 35, "BALANÇO DE VENDAS DA LOJA DE JOGOS")
			
			g.definir_tamanho_texto(14.0)
			
			g.definir_cor(AZUL)
			g.desenhar_texto(50, 100, "CLIENTE")
			g.desenhar_texto(240, 100, "VALOR BRUTO")
			g.desenhar_texto(390, 100, "STATUS")
			g.desenhar_texto(540, 100, "VALOR FINAL")

			g.definir_cor(CREME)
			g.desenhar_linha(40, 120, 660, 120)

			inteiro espacamento_y = 140

			//PARTE DOS CLIENTES PARA CADA CLIENTE PRECISA TER UM ESPACAMENTO 
			para (inteiro i = 0; i < 6; i++)
			{
				g.definir_cor(CREME)
				g.desenhar_texto(50, espacamento_y, nomes_clientes[i])
				g.desenhar_texto(240, espacamento_y, "R$ " + valores_gastos[i])

				
				se (status_desconto[i] == "GANHOU DESCONTO") {
					g.definir_cor(VERDE)
				} senao {
					g.definir_cor(ROSA)
				}
				g.desenhar_texto(390, espacamento_y, status_desconto[i])

				g.definir_cor(CREME)
				g.desenhar_texto(540, espacamento_y, "R$ " + valores_finais[i])

				espacamento_y = espacamento_y + 35 
			}
	
			g.definir_cor(AZUL)
			g.desenhar_retangulo(40, 380, 620, 140, verdadeiro, falso)

			g.definir_cor(CREME)
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(60, 410, "Faturamento Total Recebido pela Loja:")
			g.definir_cor(VERDE)
			g.desenhar_texto(460, 410, "R$ " + total_recebido_loja)

			g.definir_cor(CREME)
			g.desenhar_texto(60, 450, "Quantidade de Clientes Beneficiados com Desconto:")
			g.definir_cor(VERDE)
			g.desenhar_texto(540, 450, "" + total_clientes_com_desconto)
			
			g.definir_cor(CREME)
			g.desenhar_texto(60, 490, "Valor do desconto diário configurado:")
			g.definir_cor(ROSA)
			g.desenhar_texto(460, 490, "R$ " + valor_desconto_dia)

			
			g.definir_cor(CREME)
			g.definir_tamanho_texto(12.0)
			g.desenhar_texto(260, 550, "Pressione ESC para encerrar")

			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3623; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */