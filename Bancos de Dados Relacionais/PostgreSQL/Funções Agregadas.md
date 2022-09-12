# Funções Agregadas

### Média
Calcula a média de uma coluna
```
SELECT AVG(<coluna>) FROM <tabela>;
```
### Contagem
Calcula o número de elementos de uma coluna
```
SELECT COUNT(<coluna>) FROM <tabela>;
```
Exemplo com agrupamento condicional:
```
SELECT MAX(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id HAVING COUNT(id)>150;
```
### Máximo
Calcula o maior valor da coluna
```
SELECT MAX(<coluna>) FROM <tabela>;
```
Exemplo com agrupamento:
```
SELECT MAX(valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id ASC;
```
*Calcula o valor máximo para cada tipo de transação e ordena ascendente.*
### Mínimo
Calcula o menor valor da coluna
```
SELECT MIN(<coluna>) FROM <tabela>;
```
### Soma
Calcula a soma de todos os valores
```
SELECT SUM(<coluna>) FROM <tabela>
```
