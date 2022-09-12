-- Inner Join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- Agrupa todos os bancos com agências
SELECT banco.numero, banco.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

-- Conta o número de bancos com agências
SELECT COUNT(banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- Quantos bancos diferentes possuem agências
SELECT COUNT(DISTINCT banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- Left Join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

-- Right Join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
RIGHT JOIN agencia ON agencia.banco_numero = banco.numero;

-- Full Join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

-- Cross Join
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
CROSS JOIN agencia;

-- Inner Join com três tabelas
SELECT banco.nome, agencia.nome, conta_corrente.numero, conta_corrente.digito, cliente.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente ON conta_corrente.banco_numero = agencia.banco_numero
	AND conta_corrente.banco_numero = banco.numero
JOIN cliente ON cliente.numero = conta_corrente.cliente_numero;
