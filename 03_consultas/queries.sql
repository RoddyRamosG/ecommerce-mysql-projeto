-- Para o desafio DIO.
-- Primerio Projeto Lógico de Banco de Dados.
-- Cenário de e-commerce. 
-- Roddy E. Ramos Gonzáles.

-- QUERIES SQL --

-- (QUERY_I) Recuperaçõs simples com SELECT Statement.

-- I_A: Listar todos os produtos ativos.
SELECT id_produto, nome, categoria, preco
FROM produto
WHERE ativo = TRUE;

-- I_B: Listar todos os clientes ativos.
SELECT c.id_cliente,
       CASE
           WHEN c.tipo = 'PF' THEN pf.nome
           WHEN c.tipo = 'PJ' THEN pj.razao_social
       END as nome_cliente,
       c.tipo
FROM cliente c
LEFT JOIN cliente_pf pf ON c.id_cliente = pf.id_cliente
LEFT JOIN cliente_pj pj ON c.id_cliente = pj.id_cliente
WHERE c.ativo = TRUE;

-- (QUERY_II) Filtros com WHERE Statement.

-- II_A: Produtos da categoria INFORMATICA com preço acima de R$ 100,00.
SELECT nome, descricao, preco
FROM produto
WHERE categoria = 'INFORMATICA' AND preco > 100.00;

-- II_B: Pedidos com status 'ENVIADO' ou 'ENTREGUE'.
SELECT p.id_pedido,
       CASE
           WHEN c.tipo = 'PF' THEN pf.nome
           WHEN c.tipo = 'PJ' THEN pj.razao_social
       END as cliente,
       p.data_pedido,
       p.valor_total
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN cliente_pf pf ON c.id_cliente = pf.id_cliente
LEFT JOIN cliente_pj pj ON c.id_cliente = pj.id_cliente
WHERE p.status IN ('ENVIADO', 'ENTREGUE');

-- (QUERY_III) Expressões para gerara atributos derivados.

-- III_A: Calcular valor total em estoque por categoria.
SELECT 
    p.categoria,
    COUNT(p.id_produto) as quantidade_produtos,
    SUM(e.quantidade) as total_estoque,
    SUM(e.quantidade * p.preco) as valor_total_estoque,
    ROUND(AVG(p.preco), 2) as preco_medio
FROM produto p
JOIN estoque e ON p.id_produto = e.id_produto
GROUP BY p.categoria;

-- III_B: Classificar produtos por faixa de preço.
SELECT 
    nome,
    preco,
    CASE 
        WHEN preco < 50 THEN 'ECONOMICO'
        WHEN preco BETWEEN 50 AND 500 THEN 'INTERMEDIARIO'
        ELSE 'PREMIUM'
    END as faixa_preco
FROM produto;

-- (QUERY_IV) Ordenações dos dados com ORDER BY.

-- IV_A: Produtos mais vendidos, ordenados por quantidade total vendida.
SELECT 
    p.nome,
    p.categoria,
    SUM(ip.quantidade) as total_vendido,
    SUM(ip.subtotal) as valor_total_vendas
FROM produto p
JOIN item_pedido ip ON p.id_produto = ip.id_produto
GROUP BY p.id_produto, p.nome, p.categoria
ORDER BY total_vendido DESC;

-- IV_B: Clientes que mais gastaram, ordenados por valor total de compras.
SELECT 
    CASE 
        WHEN c.tipo = 'PF' THEN pf.nome 
        WHEN c.tipo = 'PJ' THEN pj.razao_social 
    END as cliente,
    c.tipo,
    COUNT(p.id_pedido) as total_pedidos,
    SUM(p.valor_total) as valor_total_gasto
FROM cliente c
LEFT JOIN cliente_pf pf ON c.id_cliente = pf.id_cliente
LEFT JOIN cliente_pj pj ON c.id_cliente = pj.id_cliente
JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, cliente, c.tipo
ORDER BY valor_total_gasto DESC;

-- (QUERY_V) Condições de filtros aos grupos - HAVING Statement.

-- V_A: Categorias com valor médio de produto acima de R$ 200,00.
SELECT 
    categoria,
    COUNT(*) as quantidade_produtos,
    ROUND(AVG(preco), 2) as preco_medio
FROM produto
GROUP BY categoria
HAVING preco_medio > 200.00;

-- V_B: Fornecedores com mais de 50 produtos em estoque.
SELECT 
    f.razao_social,
    COUNT(e.id_produto) as tipos_produtos,
    SUM(e.quantidade) as total_estoque
FROM fornecedor f
JOIN estoque e ON f.id_fornecedor = e.id_fornecedor
GROUP BY f.id_fornecedor, f.razao_social
HAVING total_estoque > 50;
 
-- (QUERY_VI) Junções entre tabelas.

-- VI_A: Relação completa de pedidos com informações de cliente, pagamento e entrega.
SELECT 
    p.id_pedido,
    CASE 
        WHEN c.tipo = 'PF' THEN pf.nome 
        WHEN c.tipo = 'PJ' THEN pj.razao_social 
    END as cliente,
    p.data_pedido,
    p.valor_total,
    p.status as status_pedido,
    pg.forma_pagamento,
    pg.status as status_pagamento,
    e.codigo_rastreio,
    e.status as status_entrega,
    v.nome as vendedor
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN cliente_pf pf ON c.id_cliente = pf.id_cliente
LEFT JOIN cliente_pj pj ON c.id_cliente = pj.id_cliente
LEFT JOIN pagamento pg ON p.id_pedido = pg.id_pedido
LEFT JOIN entrega e ON p.id_pedido = e.id_pedido
LEFT JOIN vendedor v ON p.id_vendedor = v.id_vendedor;

-- VI_B: Relação de produtos, fornecedores e estoques.
SELECT 
    p.nome as produto,
    p.categoria,
    f.razao_social as fornecedor,
    f.nome_fantasia,
    e.quantidade,
    e.localizacao,
    p.preco as preco_venda,
    (e.quantidade * p.preco) as valor_total_estoque
FROM produto p
JOIN estoque e ON p.id_produto = e.id_produto
JOIN fornecedor f ON e.id_fornecedor = f.id_fornecedor
ORDER BY f.razao_social, p.nome;

-- (QUERY_VII) Quantos pedidos foram feitos por cada clienete?.
SELECT 
    CASE 
        WHEN c.tipo = 'PF' THEN CONCAT('PF - ', pf.nome)
        WHEN c.tipo = 'PJ' THEN CONCAT('PJ - ', pj.razao_social)
    END as cliente,
    c.tipo,
    COUNT(p.id_pedido) as total_pedidos,
    SUM(p.valor_total) as valor_total_gasto,
    ROUND(AVG(p.valor_total), 2) as ticket_medio
FROM cliente c
LEFT JOIN cliente_pf pf ON c.id_cliente = pf.id_cliente
LEFT JOIN cliente_pj pj ON c.id_cliente = pj.id_cliente
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, cliente, c.tipo
ORDER BY total_pedidos DESC;

-- (QUERY_VIII) Vendedor também é fornecedor?.
SELECT 
    v.nome as vendedor,
    f.razao_social as fornecedor,
    v.email,
    v.telefone
FROM vendedor v
JOIN fornecedor f ON (v.email = f.email OR v.telefone = f.telefone)
WHERE v.ativo = TRUE AND f.ativo = TRUE;

-- (QUERY_IX) Análise de desempenho de vendedores.
SELECT 
    v.nome as vendedor,
    v.comissao,
    COUNT(p.id_pedido) as total_vendas,
    SUM(p.valor_total) as valor_total_vendido,
    ROUND(SUM(p.valor_total * v.comissao / 100), 2) as comissao_total,
    ROUND(AVG(p.valor_total), 2) as ticket_medio
FROM vendedor v
LEFT JOIN pedido p ON v.id_vendedor = p.id_vendedor
WHERE v.ativo = TRUE
GROUP BY v.id_vendedor, v.nome, v.comissao
ORDER BY valor_total_vendido DESC;

-- (QUERY_X) Análise de métodos de pagamento.
SELECT 
    forma_pagamento,
    COUNT(*) as total_pagamentos,
    SUM(valor) as valor_total,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM pagamento)), 2) as percentual
FROM pagamento
GROUP BY forma_pagamento
ORDER BY total_pagamentos DESC;