WITH tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT nome FROM tbl_tmp_banco;
