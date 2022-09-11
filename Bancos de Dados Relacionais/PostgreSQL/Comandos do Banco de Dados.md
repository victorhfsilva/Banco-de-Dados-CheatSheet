# Comandos do Banco de Dados

## Inicialização
Muda para o usuário postgres
```
sudo su postgres
```
Executa o postgres com os parâmetros padrões
```
psql
```
Ou
```
sudo -u postgres psql
```
Executa o postgres com outros parâmetros
```
psql -h <endereço_IP> -p <porta> -U <usuário> <banco_de_dados> 
```
URL pgAdmin
```
127.0.0.1/pgadmin4

localhost/pgadmin4
```

## Banco de Dados
Criar Banco de Dados
```
CREATE DATABASE [IF NOT EXISTS] <nome_banco_de_dados> WITH <opções>
```
Opções:
```
OWNER = user_name
TAMPLATE = template
ENCODING = encoding
LC_COLLATE = lc_collate
LC_CTYPE = lc_ctype
TABLESPACE = tablespace_name
ALLOW_CONNECTIONS = allowconn
CONNECTION LIMIT = connlimit
IS_TEMPLATE = istemplate
```
Renomear Banco de Dados
```
ALTER DATABASE <nome_banco_de_dados> RENAME TO <novo_nome>
```
Alterar proprietário do Banco de Dados
```
ALTER DATABASE <nome_banco_de_dados> OWNER TO <novo_proprietário> | CURRENT_USER | SESSION_USER
```
Editar propriedades do Banco de Dados
```
ALTER DATABASE <nome_banco_de_dados> SET <PROPRIEDADE> <valor_propriedade>
```
Exemplo:
```
CREATE TABLESPACE tablespace1 LOCATION '/postgreSQL/tablespace1';

ALTER DATABASE db1 SET TABLESPACE tablespace1;
```
Deletar Banco de Dados
```
DROP DATABASE [IF EXISTS] <nome_banco_de_dados>;
```

## Schema
Criar um Schema
```
CREATE SCHEMA [IF NOT EXISTS] <nome_schema> [AUTHORIZATION <role>]
```
Renomear um Schema
```
ALTER SCHEMA <nome_schema> RENAME TO <novo_nome>
```
Alterar proprietário de um Schema
```
ALTER SCHEMA <nome_schema> OWNER TO <novo_proprietário> | CURRENT_USER | SESSION_USER
```
Deleta um Schema
```
DROP SCHEMA [IF EXISTS] <nome_schema>
```

## Tabelas
### Criação
Criar uma tabela
```
CREATE TABLE [IF NOT EXISTS] <nome_tabela> ( 
	<nome_coluna> <tipo> <regras> <opções>,
...)
```
Exemplo 1:
```
CREATE TABLE IF NOT EXISTS clientes (
	codigo INTEGER PRIMARY KEY
	nome VARCHAR(50) NOT NULL
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
)
```
*Preenche a data de criação com o valor padrão DEFAULT do momento atual NOW().´*

Exemplo 2:
```
CREATE TABLE IF NOT EXISTS compras (
	id SERIAL,
	codigo_cliente INTEGER,
	compra VARCHAR(15) NOT NULL UNIQUE,
	data_compra TIMESTAMP NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo)
)
```
*codigo_cliente é uma chave estrangeira da coluna codigo da tabela clientes.*

Exemplo 3:
```
CREATE TABLE alunos (
	id INTEGER,
	nome TEXT NOT NULL,
	hora_matricula TIME,
	cpf TEXT UNIQUE,
	idade INTEGER CHECK (idade >= 18),
	UNIQUE (Nome_Aluno, Hora_Matrícula)
)
```
*Neste caso o Nome de Aluno pode se repetir na tabela, assim como mais de um aluno pode se matricular no mesmo horário, porém nao é possível que dois alunos com o mesmo nome se matriculem no mesmo horário.*

### Edição
Editar uma tabela
```
ALTER TABLE <nome_tabela> <opções>
```
Adicionar uma coluna na tabela
```
ALTER TABLE <tabela> ADD COLUMN <coluna> <tipo> <opções>
```
Adiciona coluna como Foreign Key:
```
ALTER TABLE <tabela> ADD COLUMN <coluna> <tipo> REFERENCES <tabela_FK>(<foreign_key>)
```
Deleta Constraint:
```
ALTER TABLE <tabela> DROP CONSTRAINT <constraint>
```
Exemplo:
```
ALTER TABLE alunos DROP CONSTRAINT alunos_pkey
```
### Exclusão
Deletar uma tabela
```
DROP TABLE [IF EXISTS] <nome_tabela>
```
### Preenchimento
Inserir valores numa tabela
```
INSERT INTO <nome_tabela> (<colunas>) VALUES (<valores seguindo a ordem das colunas>) [ON CONFLICT (<primary_key>) DO NOTHING]
```
Exemplo 1:
```
INSERT INTO clientes (codigo, nome, ativo, data_criacao) VALUES (1,'victor', TRUE, now()) ON CONFLICT (codigo) DO NOTHING
```
*ON CONFLICT: se já existir uma linha com este valor não faça nada (idempotência).*

Atualizar tabelas:
```
UPDATE <nome_tabela> SET 
	<coluna> = <novo_valor>
	...
WHERE <condições>
```
Deletar linha de tabela
```
DELETE FROM <nome_tabela> WHERE <condições>
```
*Se a condição não for inserida a coluna inteira será atualizada ou deletada.*

Exemplo:
```
DELETE FROM clientes WHERE codigo = 1
```
Esvazia Tabela (Truncate):
```
TRUNCATE TABLE <nome_tabela> [RESTART IDENTITY | CONTINUE IDENTITY] [CASCADE | RESTRICT]
```

## Consulta
Consulta Valores
```
SELECT <colunas> FROM <nome_tabela> WHERE <condições>
```
Exemplo 1:
```
SELECT nome, cpf FROM alunos WHERE id = 1
```
Exemplo 2:
```
SELECT nome, cpf FROM alunos WHERE nome LIKE 'Victor%'
```
Exemplo 3:
```
SELECT nome, cpf FROM alunos WHERE nome ILIKE 'Victor%'
```
*LIKE é case-sensitive mas ILIKE não.*
