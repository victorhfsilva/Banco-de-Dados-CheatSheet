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
CREATE DATABASE <nome_banco_de_dados> 
```

