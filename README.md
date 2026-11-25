# ecommerce-mysql-projeto
Projeto para DIO de Banco de Dados MySQL para e-commerce

# Banco de Dados para E-commerce

Projeto de banco de dados relacional desenvolvido em **MySQL** para representar as principais operações de uma plataforma de comércio eletrônico.

O projeto contempla a modelagem e a implementação de entidades relacionadas a clientes, produtos, fornecedores, vendedores, pedidos, pagamentos, entregas e estoque.

## Objetivo

Construir um banco de dados relacional capaz de armazenar e consultar informações relevantes de um ambiente de e-commerce.

O projeto foi desenvolvido com os seguintes objetivos:

- Criar um esquema lógico para o cenário de e-commerce;
- Definir tabelas, chaves primárias e chaves estrangeiras;
- Representar os relacionamentos entre as entidades;
- Inserir dados para testes;
- Desenvolver consultas SQL para responder a perguntas do negócio;
- Praticar modelagem relacional e organização de projetos de banco de dados.

## Contexto do projeto

Uma plataforma de e-commerce precisa administrar diferentes informações, como:

- Clientes;
- Produtos;
- Fornecedores;
- Vendedores;
- Estoques;
- Pedidos;
- Formas de pagamento;
- Entregas.

A modelagem busca organizar essas informações de forma estruturada, evitando redundâncias desnecessárias e permitindo a recuperação dos dados por meio de consultas SQL.

## Tecnologias utilizadas

- MySQL.
- MySQL Workbench.
- SQL.
- Git.
- GitHub.

## Estrutura do repositório

```text
ecommerce-mysql-projeto/
├── 01_esquema/
├── 02_dados/
├── 03_consultas/
├── 04_diagramas/
└── README.md
```

### `01_esquema`

Contém os scripts utilizados para a criação do banco de dados, das tabelas, das chaves e dos relacionamentos.

### `02_dados`

Contém os comandos de inserção dos dados utilizados para testar o funcionamento do banco.

### `03_consultas`

Contém as consultas SQL desenvolvidas para recuperar, filtrar, agrupar e relacionar as informações armazenadas.

### `04_diagramas`

Contém os diagramas utilizados para representar visualmente a estrutura e os relacionamentos do banco de dados.

## Competências demonstradas

Este projeto demonstra conhecimentos em:

- Modelagem de banco de dados relacional;
- Criação de tabelas;
- Definição de chaves primárias e estrangeiras;
- Integridade referencial;
- Inserção e manipulação de dados;
- Filtros e ordenações;
- Agregações;
- Agrupamentos;
- Junções entre tabelas;
- Documentação de projetos SQL.

## Perguntas de negócio

A estrutura do banco e suas consultas podem ser utilizadas para responder a perguntas como:

- Quantos pedidos foram realizados por cada cliente?
- Quais produtos apresentam maior participação nos pedidos?
- Quais fornecedores estão associados aos produtos?
- Qual é a situação dos pedidos e das entregas?
- Quais vendedores disponibilizam produtos na plataforma?
- Como os produtos estão distribuídos entre os estoques?
- Quais formas de pagamento estão associadas aos pedidos?

## Como executar

1. Faça o download ou clone este repositório.
2. Abra o MySQL Workbench ou outro cliente compatível com MySQL.
3. Execute primeiro os scripts disponíveis na pasta `01_esquema`.
4. Execute os scripts da pasta `02_dados`.
5. Utilize os arquivos da pasta `03_consultas` para executar e analisar as consultas.
6. Consulte a pasta `04_diagramas` para visualizar a modelagem do banco.

## Aprendizados

O desenvolvimento deste projeto permitiu praticar a transformação de um cenário de negócio em uma estrutura relacional.

Também possibilitou aplicar conceitos de relacionamento entre entidades, integridade dos dados e elaboração de consultas para extrair informações úteis do banco.

## Próximas melhorias

- Ampliar a quantidade de dados de teste;
- Adicionar consultas com funções de janela;
- Criar uma documentação individual para as consultas;
- Implementar views para análises recorrentes;
- Adicionar índices e avaliar o desempenho das consultas;
- Incluir uma seção com resultados obtidos;
- Criar um dashboard conectado aos dados do projeto.

## Origem

Projeto desenvolvido como parte de um desafio de banco de dados da DIO, com organização e documentação para composição de portfólio profissional.

## Autor

**Roddy Ramos Gonzáles**

- [GitHub](https://github.com/RoddyRamosG)
- [LinkedIn](https://www.linkedin.com/in/roddy-ramos-g-38483a1a/)
