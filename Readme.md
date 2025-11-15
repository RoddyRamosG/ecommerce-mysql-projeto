PROJETO BANCO DE DADOS E-COMMERCE

Autor:      Roddy Ramos G.

Data:       14_NOV_2025.

Ferramenta: MySQL.

Projeto desenvolvido como atividade acadêmica e prática de modelagem e implementação de banco de dados.

-------------------------------------------------------------------------

DESCRIÇÃO DO DESAFIO:

  Replique a modelagem do projeto lógico de banco de dados para o cenário 
de e-commerce.
  Fique atento as definições de chave primária e estrangeira, assim como 
as constraints presentes no cenário modelado. 
  Perceba que dentro desta modelagem haverá relacionamentos presentes no
modelo EER. Sendo assim, consulte como proceder para estes casos. 
  Além disso, aplique o mapeamento de modelos aos refinamentos propostos
no módulo de modelagem conceitual.
  Assim como demonstrado durante o desafio, realize a criação do Script SQL
para criação do esquema do banco de dados.
  Posteriormente, realize a persistência de dados para realização de testes.
  Especifique ainda queries mais complexas dos que apresentadas durante a 
explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:
  - Recuperações simples com SELECT Statement.
  - Filtros com WHERE Statement.
  - Crie expressões para gerar atributos derivados.
  - Defina ordenações dos dados com ORDER BY.
  - Condições de filtros aos grupos – HAVING Statement.
  - Crie junções entre tabelas para fornecer uma perspectiva mais complexa
    dos dados.

DIRETRIZES:

  - Não há um mínimo de queries a serem realizadas;
  - Os tópicos supracitados devem estar presentes nas queries;
  - Elabore perguntas que podem ser respondidas pelas consultas;
  - As cláusulas podem estar presentes em mais de uma query;

-------------------------------------------------------------------------

DESCRIÇÃO DO PROJETO LÓGICO - E-COMMERCE.

CONTEXTO DO SISTEMA:
O Sistema de e-commerce desenvolvido é uma plataforma completa de comércio eletrônico que gerencia todo o ciclo de vendas online, desde o cadastro de clientes até a entrega dos produtos.

O sistema foi modelado para atender tanto pessoas físicas (PF) quanto pessoas jurídicas (PJ), seguindo as melhores práticas de normalização e integridade referencial.

OBJETIVOS PRINCIPAIS:

  - Gerenciar múltiplos tipos de clientes (PF/PJ).
  - Controlar estoque distribuído por fornecedores.
  - Processar pedidos com múltiplos itens.
  - Gerenciar diversas formas de pagamento.
  - Rastrear entregas com status detalhados.
  - Analisar performance de vendedores.
  - Fornecer relatórios gerenciais completos.

ARQUITETURA LÓGICA:

A. Modelagem de Clientes (PF/PJ):

   cliente (tabela base) --> cliente_pf (dados pessoa física)
   
                         --> cliente_pj (dados pessoa jurídica)
						 
B. Módulo de Produtos e Estoque:

   produto <-- estoque --> fornecedor

C. Processo de Vendas:

   cliente --> pedido --> item_pedido --> produto
   
                      --> vendedor (com comissão)
					  
D. Fluxo Financeiro e Logístico:

   pedido --> pagamento (múltiplas formas)
   
          --> entrega (rastreamento completo)

RELACIONAMENTOS PRINCIPAIS:

  - Cliente    <--> Pedido      (1:N)
  - Pedido     <--> Item_Pedido (1:N) 
  - Produto    <--> Item_Pedido (1:N)
  - Fornecedor <--> Estoque     (1:N)

  - Cliente <--> Cliente_PF (1:1)
  - Cliente <--> Cliente_PJ (1:1)

  - Pedido --> Pagamento (1:N)
  - Pedido --> Entrega   (1:1)

FUNCIONALIDADES IMPLEMENTADAS:

A. Gestão de Clientes:
  - Cadastro diferenciado PF/PJ.
  - Múltiplos endereços por cliente.
  - Histórico completo de compras.

B. Controle de Estoque:
  - Estoque distribuído por fornecedor.
  - Rastreamento de localização.
  - Múltiplos fornecedores por produto.

C. Processo de Vendas:
  - Vendedores com comissão individual.
  - Carrinho com múltiplos itens.

D. Sistema de Pagamento:
  - Múltiplas formas de pagamento por pedido.
  - Status individual de cada transação.

E. Logística e Entrega:
  - Código de rastreamento único.
  - Status detalhado do envio.
  - Múltiplas transportadoras.
  - Custos de frete individualizados.

CAPACIDADES ANALÍTICAS:

A. Métricas de Negócio:
  - Performance por vendedor.
  - Ticket médio por cliente.
  - Produtos mais vendidos.
  - Métodos de pagamento preferidos.
  - Estoque por categoria/fornecedor.

B. Relatórios Estratégicos:
  - Clientes que mais compram.
  - Categorias mais lucrativas.
  - Fornecedores principais.
  - Eficiência de entregas.
  - Conversão de vendas.

CONSTRAINTS E VALIDAÇÕES:

A. Integridade Referencial:
  - Todas as chaves estrangeiras com [ON DELETE CASCADE] ou restrições 
    apropriadas.
  - Chaves únicas em CPF, CNPJ, códigos de rastreio.

B. Regras de Negócio:
  - Cliente é PF ou PJ (não ambos).
  - Múltiplos pagamentos por pedido.
  - Status sequenciais lógicos (pedido --> entrega).
  - Comissão personalizada por vendedor.

C. Validações de Dados:
  - Tipos ENUM para status fixos.
  - Campos obrigatórios definidos.
  - Valores padrão para campos comuns.

FLUXOS DE TRABALHO:

A. Novo Pedido:

   Cliente --> Item_pedido --> Pedido --> Pagamento --> Entrega

B. Controle de Estoque:

   Fornecedor --> Estoque --> Produto --> Venda --> Atualização Estoque

C. Processo de Entrega:

   Pedido --> Separação --> Envio --> Rastreamento --> Entrega

APLICAÇÕES PRÁTICAS:

A. Para o Cliente:
  - Experiência de compra unificada.
  - Múltiplas opções de pagamento.
  - Rastreamento de entregas.
  - Histórico de pedidos.

B. Para a Empresa:
  - Controle total do inventário.
  - Performance da equipe comercial.
  - Análise de métodos de pagamento.
  - Gestão de relacionamento com fornecedores.

C. Para Gestores:
  - Relatórios de vendas.
  - Análise de estoque.
  - Métricas financeiras.
  - Indicadores operacionais.

EXEMPLOS DE CONSULTAS:

01. Lista de todos os produtos ativos.
02. Lista de todos os clientes ativos.
03. Produtos da categoria "INFORMATICA" com preço acima de R$ 100.
04. Pedidos com status "ENVIADO" ou "ENTREGUE".
05. Calculo do valor total em estoque por categoria.
06. Classificar produtos por faixa de preço.
07. Produtos mais vendidos, ordenados por quantidade total vendida.
08. Clientes que mais gastaram, ordenados por valor de compras.
09. Categorias com valor médio de produto acima de R$ 200.
10. Fornecedores com mais de 50 produtos em estoque.
11. Relação completa de pedidos com informações de cliente, pagamento e entrega. 
12. Relação de produtos, fornecedores e quantidades.
13. Quantos pedidos foram feitos por cada cliente?
14. Vendedor também é fornecedor?
15. Análise de desempenho de vendedores.
16. Análise de métodos de pagamento.
	





