# DIO - Trilha .NET - Banco de Dados
www.dio.me

## Desafio de projeto
Para este desafio, você precisará usar seus conhecimentos adquiridos no módulo de banco de dados, da trilha .NET da DIO.

## Contexto
Você é responsável pelo banco de dados de um site de filmes, onde são armazenados dados sobre os filmes e seus atores. Sendo assim, foi solicitado para que você realize uma consulta no banco de dados com o objetivo de trazer alguns dados para análises.

## Proposta
Você precisará realizar 12 consultas ao banco de dados, cada uma retornando um tipo de informação.
O seu banco de dados está modelado da seguinte maneira:

![Diagrama banco de dados](Imagens/diagrama.png)

As tabelas sao descritas conforme a seguir:

**Filmes**

Tabela responsável por armazenar informações dos filmes.

**Atores**

Tabela responsável por armazenar informações dos atores.

**Generos**

Tabela responsável por armazenar os gêneros dos filmes.

**ElencoFilme**

Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e atores, ou seja, um ator pode trabalhar em muitos filmes, e filmes
podem ter muitos atores.

**FilmesGenero**

Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e gêneros, ou seja, um filme pode ter mais de um gênero, e um genêro pode fazer parte de muitos filmes.

## Preparando o banco de dados
Você deverá executar o arquivo **Script Filmes.sql** em seu banco de dados SQL Server, presente na pasta Scripts deste repositório ([ou clique aqui](Script%20Filmes.sql)). Esse script irá criar um banco chamado **Filmes**, contendo as tabelas e os dados necessários para você realizar este desafio.

## Objetivo
Você deverá criar diversas consultas, com o objetivo de retornar os dados a seguir. Abaixo de cada pedido tem o retorno esperado. O seu retorno deve ser igual ao da imagem.

## Minha Solução: 

### 1. Buscar o nome e ano dos filmes:

Esta consulta seleciona as colunas Nome e Ano da tabela Filmes. O resultado será uma lista com o nome e ano de cada filme.

```sql
SELECT Nome, Ano FROM Filmes
```

### 2. Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano:

Esta consulta seleciona as colunas Nome, Ano e Duracao da tabela Filmes. O resultado será uma lista com o nome, ano e duração de cada filme, ordenada por ano em ordem crescente.

```sql
SELECT Nome, Ano, Duracao FROM Filmes
ORDER BY Ano ASC
```

### 3. Buscar pelo filme "De Volta para o Futuro", trazendo o nome, ano e a duração:

Esta consulta usa o operador LIKE para buscar por filmes que contêm a string "De Volta para o Futuro" na coluna Nome. O resultado será uma lista com o nome, ano e duração do filme "De Volta para o Futuro".

```sql
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Nome LIKE '%De Volta para o Futuro%'
```

### 4. Buscar os filmes lançados em 1997:

Esta consulta usa o operador LIKE para buscar por filmes que contêm a string "1997" na coluna Ano. O resultado será uma lista com o nome, ano e duração dos filmes lançados em 1997.

```sql
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Ano LIKE '%1997%'
```

### 5. Buscar os filmes lançados após o ano 2000:

Esta consulta usa o operador > para buscar por filmes com valor na coluna Ano superior a 2000. O resultado será uma lista com o nome, ano e duração dos filmes lançados após o ano 2000.

```sql
SELECT 
    Nome, 
    Ano, 
    Duracao
FROM Filmes
WHERE Ano > 2000
```

### 6. Buscar os filmes com duração entre 100 e 150 minutos, ordenando pela duração em ordem crescente:

Esta consulta usa os operadores > e < para buscar por filmes com valores na coluna Duracao entre 100 e 150. A consulta também ordena os resultados por Duracao em ordem crescente.

```sql
SELECT 
    Nome, 
    Ano, 
    Duracao
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
```

### 7. Buscar a quantidade de filmes lançados por ano, agrupando por ano e ordenando pela quantidade em ordem decrescente:

Esta consulta usa a função COUNT() para contar a quantidade de filmes para cada ano. A consulta também agrupa os resultados por Ano e ordena por QuantidadeAno em ordem decrescente.

```sql
SELECT Ano, COUNT(Nome) AS QuantidadeAno
FROM Filmes
GROUP BY Ano
ORDER BY COUNT(Nome) DESC
```

### 8. Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome:

Esta consulta busca por atores com valor na coluna Genero igual a "M". O resultado será uma lista com o PrimeiroNome e UltimoNome dos atores do gênero masculino.

```sql
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'M'
```

### 9. Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome:

Esta consulta busca por atores com valor na coluna Genero igual a "F". O resultado será uma lista com o PrimeiroNome e UltimoNome dos atores do gênero feminino, ordenada por PrimeiroNome.

```sql
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome
```

### 10. Buscar o nome do filme e o gênero:

Esta consulta usa um INNER JOIN entre as tabelas Filmes, FilmesGenero e Generos. O resultado será uma lista com o nome do filme e o gênero.

```sql
SELECT
    f.Nome AS NomeFilme,
    g.Genero AS NomeGenero
FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON f.Id = fg.IdFilme
INNER JOIN Generos AS g ON fg.IdGenero = g.Id
```

### 11. Buscar o nome do filme e o gênero do tipo "Mistério":

Esta consulta usa um INNER JOIN entre as tabelas Filmes, FilmesGenero e Generos e usa o operador LIKE para buscar por filmes com gênero "Mistério". O resultado será uma lista com o nome do filme e o gênero "Mistério".

```sql
SELECT
    f.Nome AS NomeFilme,
    g.Genero AS NomeGenero
FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON f.Id = fg.IdFilme
INNER JOIN Generos AS g ON fg.IdGenero = g.Id
WHERE Genero LIKE '%Mistério%'
```

### 12. Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel:

Esta consulta usa um INNER JOIN entre as tabelas Filmes, ElencoFilme e Atores. O resultado será uma lista com o nome do filme, o PrimeiroNome, UltimoNome e o Papel de cada ator que participa do filme.

```sql
SELECT
    f.Nome AS NomeFilme,
    a.PrimeiroNome,
    a.UltimoNome,
    ef.Papel
FROM Filmes AS f
INNER JOIN ElencoFilme AS ef ON f.Id = ef.IdFilme
INNER JOIN Atores AS a ON ef.IdAtor = a.Id
```


