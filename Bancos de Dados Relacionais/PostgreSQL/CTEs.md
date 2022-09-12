# CTEs : Common Table Expressions

Cria uma tabela tempororária e seleciona valores dela
```
WITH <nome tabela temporária> AS (
	SELECT <colunas> FROM <tabela>
)
SELECT <colunas> FROM <nome tabela temporária>
```
Exemplo:
```
WITH tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT nome FROM tbl_tmp_banco;
```