programa
{

	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Texto --> txt


	const inteiro ROSA     = 0xE81E4A 
	const inteiro FUNDO    = 0x0B1D21 
	const inteiro AZUL     = 0x078A85 
	const inteiro VERDE   = 0x68BAAB 
	const inteiro CREME    = 0xEDD5C5 
	const inteiro AMARELO  = 0xE6C229 
	const inteiro VERMELHO = 0xD14949 

	funcao inicio()
	{
		//VARIAVEIS
		cadeia nome = "", vegetariano = "", dieta = "", forma_pagamento = ""
		cadeia prato_sugerido = "", mensagem_desconto = ""
		inteiro cor_prato = CREME, cor_desconto = CREME

		//ENTRADA DE DADOS
		escreva("=== SISTEMA DE RESTAURANTE LARICOTA ===\n")
		escreva("Digite o nome do cliente: ")
		leia(nome)
		escreva("O cliente é vegetariano? (sim/nao): ")
		leia(vegetariano)
		escreva("O cliente está em dieta? (sim/nao): ")
		leia(dieta)
		escreva("Forma de pagamento (dinheiro/cartao): ")
		leia(forma_pagamento)

		//TRATAMENTO DE TEXTO 
		vegetariano = txt.caixa_baixa(vegetariano)
		dieta = txt.caixa_baixa(dieta)
		forma_pagamento = txt.caixa_baixa(forma_pagamento)

		//CONDICIONAIS E OPERADORES LÓGICOS (LOGICA BASICA DA ATIVIDADE)
		
		se (dieta == "sim" e vegetariano == "sim")
		{
			prato_sugerido = "Saladas"
			cor_prato = VERDE
		}
		
		senao se (dieta == "sim" e vegetariano == "nao")
		{
			prato_sugerido = "Frango grelhado"
			cor_prato = AZUL
		}
		
		senao se (dieta == "nao" e vegetariano == "sim")
		{
			prato_sugerido = "Macarrão"
			cor_prato = AMARELO
		}
		
		senao se (dieta == "nao" ou vegetariano == "nao")
		{
			prato_sugerido = "Feijoada"
			cor_prato = VERMELHO
		}
		senao
		{
			prato_sugerido = "Dados inválidos digitados no perfil!"
			cor_prato = VERMELHO
		}
		 
		//DESCONTO
		se (forma_pagamento == "dinheiro")
		{
			mensagem_desconto = "O cliente tem 15% de desconto"
			cor_desconto = VERDE
		}
		senao
		{
			mensagem_desconto = "Pagamento realizado sem desconto."
			cor_desconto = AZUL
		}


		// BIBLIOTECAS AVANCADAS FORAM UTILIZADAS PARA INTERFACE GRÁFICA
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(600, 500)
		g.definir_titulo_janela("Sistema de Restaurante - " + nome)

		//REPETICAO PARA FAZER O PROGRAMA RODAR ENQUANTO NAO APERTAR O ESC
		enquanto (nao t.tecla_pressionada(t.TECLA_ESC))
		{
			//FUNDO
			g.definir_cor(FUNDO) 
			g.limpar()

			//CABEÇALHO (ROSA)
			g.definir_cor(ROSA) //COR
			g.desenhar_retangulo(50, 30, 500, 60, falso, verdadeiro) //DESENHO DE UM RETANGULO COM A BIBLIOTECA GRAFICOS
			
			g.definir_cor(CREME) // TEXTO
			g.definir_tamanho_texto(20.0) //TAMANHO
			g.desenhar_texto(170, 50, "RESTAURANTE LARICOTA")  //TEXTO DENTRO DO RETANGULO

			g.definir_cor(CREME)
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(50, 130, "Cliente: " + nome)

			g.definir_cor(ROSA) 
			g.desenhar_retangulo(50, 180, 500, 120, verdadeiro, falso) 
			
			g.definir_cor(CREME)
			g.definir_tamanho_texto(18.0)
			g.desenhar_texto(200, 200, "SUGESTÃO DE PRATO")

			
			g.definir_cor(cor_prato) 
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(80, 250, "Prato sugerido: " + prato_sugerido) 

			
			g.definir_cor(cor_desconto) 
			g.desenhar_retangulo(50, 330, 500, 80, verdadeiro, falso) 
			
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(80, 360, mensagem_desconto)

			
			g.definir_cor(CREME)
			g.definir_tamanho_texto(12.0)
			g.desenhar_texto(220, 450, "Pressione ESC para sair")

			
			g.renderizar()
               g.limpar()
               
			//FONTES: https://youtu.be/Ue92PK7w1r8?si=NNPPdITYUt825VtR

		}
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3483; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */