--1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano FROM Filmes

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao FROM Filmes
ORDER BY Ano ASC

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Nome LIKE '%volta para o futuro%'

--Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Ano LIKE '%1997%'

--Buscar os filmes lançados APÓS o ano 2000
SELECT 
	Nome, 
	Ano, 
	Duracao
FROM Filmes
WHERE Ano > 2000

--Buscar os filmes com a duracao maior que 100 e menor que 150, 
--ordenando pela duracao em ordem crescente
SELECT 
	Nome, 
	Ano, 
	Duracao
FROM Filmes
WHERE Duracao >100 AND  Duracao <150

--Buscar a quantidade de filmes lançadas no ano, 
--agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT  Ano, COUNT(Nome) AS QuantidadeAno
FROM Filmes
GROUP BY Ano
ORDER BY COUNT(Duracao) DESC

--Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome, UltimoNome, Genero
FROM Atores
WHERE Genero = 'M'

-- Buscar os Atores do gênero feminino, retornando o 
--PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome, Genero
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

--- Buscar o nome do filme e o gênero
SELECT
	f.Nome AS NomeFilme,
	g.Genero AS NomeGenero
FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON f.Id = fg.IdFilme
INNER JOIN Generos AS g ON fg.IdGenero = g.Id

-- Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
	f.Nome AS NomeFilme,
	g.Genero AS NomeGenero
FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON f.Id = fg.IdFilme
INNER JOIN Generos AS g ON fg.IdGenero = g.Id
WHERE Genero LIKE '%Mistério%'

--Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
	f.Nome as NomeFilme,
	at.PrimeiroNome, 
	at.UltimoNome,
	elenc.Papel
FROM Filmes AS f
INNER JOIN ElencoFilme AS el ON f.Id = el.IdFilme
INNER JOIN Atores AS at ON el.IdAtor = at.Id
INNER JOIN ElencoFilme AS elenc ON at.Id = elenc.Id

