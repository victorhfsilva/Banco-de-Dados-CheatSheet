# Administração de Previlégios

## Role
Cria um Role
```
CREATE ROLE <nome_role> WITH <options>
```
Opções:
```
SUPERUSER | NOSUPERUSER
CREATEDB | NOCREATEDB
CREATEROLE | NOCREATEROLE
INHERIT | NOINHERIT
LOGIN | NOLOGIN
REPLECTION | NOREPLECTION
BYPASSRLS | BYPASSRLS
CONNECTION LIMIT <limite_conexões>
[ENCRIPTED] PASSWORD '<senha>' | PASSWORD NULL
VALID UNTIL '<timestamp>'
IN ROLE role
ROLE role
ADMIN role
```
Exemplos:
```
CREATE ROLE administradores WITH
CREATEDB 
CREATEROLE 
INHERIT 
NOLOGIN 
REPLICATION 
BYPASSRLS
CONNECTION LIMIT -1
PASSWORD '1234'
ROLE admin;
```
*admin herda permissões de administradores*

ou
```
CREATE ROLE professores WITH
NOCREATEDB 
NOCREATEROLE 
INHERIT 
NOLOGIN 
NOBYPASSRLS
PASSWORD '1234'
CONNECTION LIMIT 10;
```
ou 
```
CREATE ROLE victor WITH
IN ROLE professores
```
*victor herda permissões de professores*

Conceder permissões de uma role a outra role
```
GRANT <role a ser concedida> TO <role a assumir permissões>
```
Exemplo:
```
GRANT professores TO amanda
```
*amanda herda permissões de professores*

Revogar permissões de role
```
REVOKE <role a ser revogada> FROM <role concedida>
```
Altera permissões de Roles
```
ALTER ROLE <role> WITH <opções>
```
Exclui uma Role
```
DROP ROLE <role>
```
Lista Roles (psql terminal)
```
\du
```
## Administrando Acessos

Garantindo previlégios a banco de dados
```
GRANT <previlégios> ON DATABASE <banco de dados> TO <role>
```
Previlégios:
```
CREATE | CONNECT | TEMPORARY | TEMP | ALL
```
Garantindo previlégios a Schemas
```
GRANT <previlégios> ON SCHEMA <schema> TO <role>
```
Previlégios:
```
CREATE | USAGE
```
Garantindo previlégios a Table
```
GRANT <previlégios> ON {TABLE <tabela> | ALL TABLES IN SCHEMA <schema>} TO <role>
```
Previlégios:
```
SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER | ALL
```
Retirando previlégios de Banco de Dados:
```
REVOKE <previlégios> ON DATABASE <banco de dados> FROM <role>
```
Retirando previlégios de Schemas:
```
REVOKE <previlégios> ON SCHEMA <banco de dados> FROM <role>
```
Retirando previlégios de Tabelas:
```
REVOKE <previlégios> ON TABLE <banco de dados> FROM <role>
```
