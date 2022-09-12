-- Função somar
CREATE OR REPLACE FUNCTION fc_somar(INTEGER,INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
	SELECT $1 + $2;
$$;
SELECT fc_somar(1,4);

-- A mesma função somar, nomeando os parâmetros
CREATE OR REPLACE FUNCTION fc_somar(num1 INTEGER, num2 INTEGER)
RETURNS INTEGER
LANGUAGE SQL
AS $$
	SELECT num1 + num2;
$$;
SELECT fc_somar(1,4);

-- Insere valores em tabela
CREATE OR REPLACE FUNCTION fc_bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS TABLE (numero INTEGER, nome VARCHAR)
RETURNS NULL ON NULL INPUT -- Retorna nulo se o input for nulo
LANGUAGE SQL
AS $$
	INSERT INTO banco (numero, nome, ativo)
	VALUES (p_numero, p_nome, p_ativo);
	
	SELECT numero, nome FROM banco 
	WHERE numero = p_numero;
$$;
SELECT fc_bancos_add(1452,'Banco Novo',FALSE);
SELECT numero, nome, ativo, data_criacao FROM banco WHERE numero = 1452;
