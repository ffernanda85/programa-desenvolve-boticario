INSERT INTO estoque(produto_id, qtd_estoque)
VALUES
	(1, 100),
	(2, 100),
	(3, 100),
	(4, 100),
	(5, 100);
	
select * from estoque

UPDATE estoque
SET qtd_estoque = 30
WHERE produto_id > 3;

INSERT INTO pedidos(cliente_id, data_pedido, valor_pedido)
VALUES 
	(9, CURRENT_DATE, 900),
	(8, CURRENT_DATE, 800),
	(6, CURRENT_DATE, 700),
	(10, CURRENT_DATE, 600),
	(5, CURRENT_DATE, 500),
	(1, CURRENT_DATE, 400),
	(2, CURRENT_DATE, 300),
	(3, CURRENT_DATE, 100),
	(4, CURRENT_DATE, 20000),
	(1, CURRENT_DATE, 230);

select * from pedidos

INSERT INTO pedidos_produtos(pedido_id, produto_id, qtd_produto)
VALUES
	(1, 1, 1),
    (1, 3, 1),
    (1, 5, 1),
    (2, 2, 1),
    (2, 4, 1),
    (2, 1, 1),
    (3, 3, 1),
    (3, 5, 1),
    (3, 2, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 1, 1),
    (6, 2, 1),
    (7, 4, 1),
    (7, 5, 1),
    (7, 1, 1),
    (8, 1, 1),
    (9, 2, 1),
    (9, 3, 1),
    (10, 3, 1);

select * from pedidos_produtos
select * from estoque

insert into enderecos(cliente_id, rua, bairro, cidade, estado, cep)
values 
	(1, 'rua 1', 'bairro 1', 'cidade 1', '01', 21091-222)











SELECT * FROM estoque;
