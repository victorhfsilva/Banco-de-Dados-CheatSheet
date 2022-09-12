# Joins
## Inner Join
Fazer consultas utilizando Inner Joins
```
SELECT <tabela 1>.<coluna>, <tabela 2>.<coluna> FROM <tabela 1> JOIN <tabela 2> ON <tabela 2>.<coluna> = <tabela 1>.<coluna>
```
*Recomenda-se que a coluna da tabela 2 seja uma FK e a coluna da tabela 1 seja uma PK.*
## Left Join
Fazer consultas utilizando Outer Left Join
```
SELECT <tabela 1>.<coluna>, <tabela 2>.<coluna> FROM <tabela 1> LEFT JOIN <tabela 2> ON <tabela 2>.<coluna> = <tabela 1>.<coluna>
```
## Right Join
Fazer consultas utilizando Outer Right Join
```
SELECT <tabela 1>.<coluna>, <tabela 2>.<coluna> FROM <tabela 1> RIGHT JOIN <tabela 2> ON <tabela 2>.<coluna> = <tabela 1>.<coluna>
```
## Full Join
Fazer consultas utilizando Full Join
```
SELECT <tabela 1>.<coluna>, <tabela 2>.<coluna> FROM <tabela 1> FULL JOIN <tabela 2> ON <tabela 2>.<coluna> = <tabela 1>.<coluna>
```
## Cross Join
Fazer consultas utilizando Cross Join
```
SELECT <tabela 1>.<coluna>, <tabela 2>.<coluna> FROM <tabela 1> CROSS JOIN <tabela 2>
``` 