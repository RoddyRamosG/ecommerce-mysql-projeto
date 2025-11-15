-- Para o desafio DIO.
-- Primerio Projeto Lógico de Banco de Dados.
-- Cenário de e-commerce. 
-- Roddy E. Ramos Gonzáles.

-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Tabela Cliente (base para PF e PJ).
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('PF', 'PJ') NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);
-- desc cliente;

-- Tabela Pessoa Física: armazena dados de pessoas físicas.
CREATE TABLE cliente_pf (
    id_pf INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);
-- desc cliente_pf;

-- Tabela Pessoa Jurídica: armazena dados de pessoas jurídicas.
CREATE TABLE cliente_pj (
    id_pj INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);
-- desc cliente_pj;

-- Tabela Endereço: endereços vinculados aos clientes.
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo ENUM('RESIDENCIAL', 'COMERCIAL', 'ENTREGA') NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    principal BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE
);
-- desc endereco;

-- Tabela Fornecedor: empresas fornecedoras de produtos.
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100),
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);
-- desc fornecedor;

-- Tabela Vendedor: representantes comerciais da loja.
CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    comissao DECIMAL(5,2) DEFAULT 0.00,
    ativo BOOLEAN DEFAULT TRUE
);
-- desc vendedor;

-- Tabela Produto: produtos cadastrados.
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    peso_kg DECIMAL(8,3),
    dimensoes VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE
);
-- desc produto;

-- Tabela Estoque: quantidades e localizações dos produtos por fornecedor.
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    localizacao VARCHAR(100),
    data_entrada DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);
-- desc estoque;

-- Tabela Pedido: pedidos feitos pelos clientes.
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDENTE', 'PROCESSANDO', 'ENVIADO', 'ENTREGUE', 'CANCELADO') DEFAULT 'PENDENTE',
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    observacoes TEXT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
-- desc pedido;

-- Tabela Item Pedido: itens de cada pedido.
CREATE TABLE item_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
-- desc item_pedido;

-- Tabela Pagamento: formas e valores de pagamento.
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    forma_pagamento ENUM('CARTAO_CREDITO', 'CARTAO_DEBITO', 'BOLETO', 'PIX', 'TRANSFERENCIA') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status ENUM('PENDENTE', 'APROVADO', 'RECUSADO', 'ESTORNADO') DEFAULT 'PENDENTE',
    data_pagamento DATETIME,
    codigo_transacao VARCHAR(100),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE
);
-- desc pagamento;

-- Tabela Entrega: informações de envio e rastreamento.
CREATE TABLE entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_endereco INT NOT NULL,
    codigo_rastreio VARCHAR(100) UNIQUE,
    status ENUM('PREPARANDO', 'ENVIADO', 'EM_TRANSITO', 'ENTREGUE', 'EXTRAVIADO') DEFAULT 'PREPARANDO',
    data_envio DATE,
    data_prevista DATE,
    data_entrega DATE,
    transportadora VARCHAR(100),
    custo_frete DECIMAL(8,2) DEFAULT 0.00,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);
-- desc entrega;