-- Para o desafio DIO.
-- Primerio Projeto Lógico de Banco de Dados.
-- Cenário de e-commerce. 
-- Roddy E. Ramos Gonzáles.

-- INSERÇÃO DOS DADOS PARA TESTES --

-- Inserir clientes: 5 clientes.
INSERT INTO cliente (tipo) VALUES 
('PF'), ('PF'), ('PF'), ('PJ'), ('PJ');
-- select * from cliente;

-- Inserir clientes PF: 3 clientes.
INSERT INTO cliente_pf (id_cliente, nome, cpf, email, telefone) VALUES
(1, 'João Silva', '12345678901', 'joao@email.com', '(11) 9999-1111'),
(2, 'Maria Santos', '23456789012', 'maria@email.com', '(11) 9999-2222'),
(3, 'Pedro Oliveira', '34567890123', 'pedro@email.com', '(11) 9999-3333');
-- select * from cliente_pf;

-- Inserir clientes PJ: 2 clientes.
INSERT INTO cliente_pj (id_cliente, razao_social, nome_fantasia, cnpj, email, telefone) VALUES
(4, 'Tech Solutions LTDA', 'TechSol', '11222333000144', 'vendas@techsol.com', '(11) 3333-4444'),
(5, 'Comércio Express ME', 'Comex', '55666777000188', 'contato@comex.com', '(11) 3333-5555');
-- select * from cliente_pj;

-- Inserir endereços: 3 endereços.
INSERT INTO endereco (id_cliente, tipo, logradouro, numero, complemento, bairro, cidade, estado, cep, principal) VALUES
(1, 'RESIDENCIAL', 'Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01234000', TRUE),
(1, 'ENTREGA', 'Av. Paulista', '1000', 'Sala 501', 'Bela Vista', 'São Paulo', 'SP', '01311000', FALSE),
(4, 'COMERCIAL', 'Rua da Tecnologia', '500', NULL, 'Vila Olímpia', 'São Paulo', 'SP', '04543000', TRUE);
-- select * from endereco;

-- Inserir fornecedores: 3 fornecedores.
INSERT INTO fornecedor (razao_social, nome_fantasia, cnpj, email, telefone) VALUES
('Eletrônicos Brasil LTDA', 'EletroBr', '99888777000166', 'vendas@eletrobr.com', '(11) 4444-1111'),
('Componentes Importados SA', 'CompImport', '77666555000133', 'compras@compimport.com', '(11) 4444-2222'),
('Tecidos Nacional ME', 'TexNacional', '55444333000199', 'contato@texnacional.com', '(11) 4444-3333');
-- select * from fornecedor;

-- Inserir vendedores: 3 vendedores.
INSERT INTO vendedor (nome, email, telefone, comissao) VALUES
('Carlos Mendes', 'carlos@email.com', '(11) 8888-1111', 5.00),
('Ana Costa', 'ana@email.com', '(11) 8888-2222', 6.50),
('Roberto Alves', 'roberto@email.com', '(11) 8888-3333', 4.75);
-- select * from vendedor;

-- Inserir produtos: 5 produtos.
INSERT INTO produto (nome, descricao, categoria, preco, peso_kg, dimensoes) VALUES
('Smartphone Galaxy X', 'Smartphone Android 128GB', 'ELETRONICOS', 1500.00, 0.18, '15x7x0.8cm'),
('Notebook Ultra Pro', 'Notebook i7 16GB RAM 512GB SSD', 'INFORMATICA', 3500.00, 1.5, '35x25x2cm'),
('Mouse Gamer RGB', 'Mouse óptico 6400DPI', 'INFORMATICA', 120.00, 0.12, '12x6x3cm'),
('Camiseta Básica', 'Camiseta 100% algodão', 'VESTUARIO', 29.90, 0.15, 'ÚNICO'),
('Teclado Mecânico', 'Teclado mecânico switches blue', 'INFORMATICA', 250.00, 0.85, '44x15x3cm');
-- select * from produto;

-- Inserir estoque: 5 registros.
INSERT INTO estoque (id_produto, id_fornecedor, quantidade, localizacao, data_entrada) VALUES
(1, 1, 50, 'Prateleira A1', '2024-01-15'),
(2, 1, 20, 'Prateleira B2', '2024-01-10'),
(3, 2, 100, 'Prateleira C3', '2024-01-20'),
(4, 3, 200, 'Prateleira D4', '2024-01-05'),
(5, 2, 30, 'Prateleira E5', '2024-01-25');
-- select * from estoque;

-- Inserir pedidos: 5 pedidos.
INSERT INTO pedido (id_cliente, id_vendedor, status, valor_total, observacoes) VALUES
(1, 1, 'ENTREGUE', 1740.00, 'Presente para aniversário'),
(2, 2, 'ENVIADO', 3500.00, 'Urgente'),
(4, 3, 'PROCESSANDO', 1549.00, 'Pedido corporativo'),
(1, 1, 'PENDENTE', 120.00, NULL),
(3, 2, 'ENVIADO', 3000.00, 'Fragil');
-- select * from pedido;

-- Inserir itens do pedido: 7 itens.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1500.00),
(1, 3, 2, 120.00),
(2, 2, 1, 3500.00),
(3, 4, 10, 29.90),
(3, 5, 5, 250.00),
(4, 3, 1, 120.00),
(5, 1, 2, 1500.00);
-- select * from item_pedido;

-- Inserir pagamentos: 4 pagamentos.
INSERT INTO pagamento (id_pedido, forma_pagamento, valor, status, data_pagamento, codigo_transacao) VALUES
(1, 'CARTAO_CREDITO', 1740.00, 'APROVADO', '2024-01-20 10:30:00', 'CC123456'),
(1, 'PIX', 1740.00, 'APROVADO', '2024-01-20 10:35:00', 'PIX789012'),
(2, 'BOLETO', 3500.00, 'APROVADO', '2024-01-21 14:20:00', 'BLT345678'),
(3, 'TRANSFERENCIA', 1549.00, 'APROVADO', '2024-01-22 09:15:00', 'TFR901234');
-- select * from pagamento;

-- Inserir entregas: 4 entregas.
INSERT INTO entrega (id_pedido, id_endereco, codigo_rastreio, status, data_envio, data_prevista, transportadora, custo_frete) VALUES
(1, 1, 'BR123456789SP', 'ENTREGUE', '2024-01-21', '2024-01-25', 'Correios', 15.00),
(2, 2, 'BR987654321RJ', 'EM_TRANSITO', '2024-01-22', '2024-01-26', 'Transportadora X', 25.00),
(3, 3, 'BR456789123MG', 'ENVIADO', '2024-01-23', '2024-01-28', 'Transportadora Y', 35.00),
(5, 1, 'BR789123456RS', 'PREPARANDO', NULL, '2024-01-30', 'Correios', 20.00);
select * from entrega;