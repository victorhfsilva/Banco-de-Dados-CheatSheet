-- Cria e Consulta Views
CREATE OR REPLACE VIEW view_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);
SELECT numero, nome FROM view_bancos;

CREATE OR REPLACE VIEW view_bancos2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo FROM banco
);
SELECT banco_numero, banco_nome, banco_ativo FROM view_bancos2;

-- Insere Valores em Views
INSERT INTO view_bancos2 (banco_numero,banco_nome,banco_ativo) 
VALUES (51,'Banco Boa Ideia', TRUE);
SELECT banco_numero, banco_nome FROM view_bancos2 WHERE banco_numero = 51;
SELECT numero, nome FROM banco WHERE numero = 51;

-- Edita Valores de Views
UPDATE view_bancos2 SET banco_ativo = FALSE WHERE banco_numero = 51;
SELECT banco_numero, banco_nome, banco_ativo FROM view_bancos2 WHERE banco_numero = 51;
SELECT numero, nome, ativo FROM banco WHERE numero = 51;

-- Deleta Valores de Views
DELETE FROM view_bancos2 WHERE banco_numero = 51;

-- Cria View Temporária (Só funciona nesta sessão)
CREATE OR REPLACE TEMPORARY VIEW view_agencia AS (
	SELECT nome FROM agencia
);
SELECT nome FROM view_agencia;

-- Cria View com Condição
CREATE OR REPLACE VIEW view_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;
-- Retorna erro por não satisfazer condição
INSERT INTO view_bancos_ativos (numero,nome,ativo) 
VALUES (51,'Banco Boa Ideia', FALSE);

-- Views com a opção cascaded checam as condições desta e da view superior
CREATE OR REPLACE VIEW view_bancos_ativos_com_A AS(
	SELECT numero,nome,ativo
	FROM view_bancos_ativos
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION;
INSERT INTO view_bancos_ativos_com_A (numero, nome, ativo) VALUES (333,'Alfa Omega',TRUE);
-- Retorna erro pois não satisfaz a condição desta view
INSERT INTO view_bancos_ativos_com_A (numero, nome, ativo) VALUES (332,'Beta Sigma',TRUE);
-- Retorna erro pois não satisfaz a condição da view superior
INSERT INTO view_bancos_ativos_com_A (numero, nome, ativo) VALUES (331,'Alfa Beta',FALSE);
SELECT numero, nome, ativo FROM view_bancos_ativos_com_A;
