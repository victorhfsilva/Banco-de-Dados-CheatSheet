# Clusters e Configurações

## Clusters
**Um cluster é o local do banco de dados.**

Lista os clusters (Ubuntu)
```
pg_lsclusters
```
Cria um cluster
```
pg_createcluster -d <caminho> <versão> <nome_cluster> --start
```
Exemplo:
```
pg_createcluster -d /postgreSQL/Exemplo 14 Exemplo --start
```
*start inicializa o cluster*
Deleta um cluster
```
pg_dropcluster --stop <versão> <nome_cluster> 
```
Controla um cluster
```
pg_ctlcluster <versão> <cluster> <ação>
```
Exemplo:
```
pg_ctlcluster 14 Exemplo <start|stop|status|restart>
```
## Configurações
Mostra as configurações do PostgreSQL
```
SELECT name, setting FROM pg_settings;
```
ou
```
vi /etc/postgresql/<versão>/<cluster>/postgresql.conf
```
Mostra as configurações de autenticação dos usuários
```
vi /etc/postgresql/<versão>/<cluster>/pg_hba.conf
```
Mostra as configurações de identificação dos usuário do S.O. correspondentes aos usuário do PostgreSQL
```
vi /etc/postgresql/<versão>/<cluster>/pg_ident .conf
```
Altera a senha de um usuário
```
ALTER USER <usuário> PASSWORD '<senha>'
```
Exemplo
```
ALTER USER postgres PASSWORD '1234'
```

