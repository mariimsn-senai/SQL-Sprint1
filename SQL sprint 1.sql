CREATE DATABASE OPTUS; 

USE OPTUS; 

  

CREATE TABLE TipoUsuario ( 

IdTipoUsuario	INT PRIMARY KEY IDENTITY, 

Titulo			VARCHAR(200) 

); 

  

CREATE TABLE Usuario ( 

IdUsuario		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200), 

IdTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario) 

); 

  

CREATE TABLE Artista ( 

IdArtista		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200) 

); 

  

CREATE TABLE Estilo ( 

IdEstilo		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200) UNIQUE 

); 

  

CREATE TABLE Albuns ( 

IdAlbum			INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200), 

DataLancamento	DATE, 

QtdMinutos		VARCHAR (200), 

Visualizacao	VARCHAR (200), 

IdArtista		INT FOREIGN KEY REFERENCES Artista (IdArtista), 

IdEstilo		INT FOREIGN KEY REFERENCES Estilo (IdEstilo) 

); 

  

  

  

  

--DML LINGUAGEM DE MANIPULAÇÃO DE DADOS 

  

SELECT * FROM Estilo; 

SELECT * FROM Artista; 

SELECT * FROM Albuns; 

SELECT * FROM Usuario; 

SELECT * FROM TipoUsuario; 

  

-- COMANDO DE INSERIR DADOS 

INSERT INTO	Estilo (Nome) 

VALUES ('Pagode'),('Samba'),('Rock'),('Rap'),('Funk'),('Pop'); 

  

INSERT INTO Artista (Nome) 

VALUES ('Ferrugem'),('Post Malone'),('MC Kevin'); 

  

INSERT INTO Albuns (Nome, DataLancamento, QtdMinutos, Visualizacao, IdArtista, IdEstilo) 

VALUES ('Pagode de fim de tarde', '19/03/2020', '140', '5.873.190', 3, 1);  

  

INSERT INTO TipoUsuario (Titulo) 

VALUES ('Administrador'), ('Comum'); 

  

INSERT INTO Usuario (Nome, IdTipoUsuario) 

VALUES ('ADM', 1), ('Roberto', 2), ('Gary', 2), ('Finn', 2), ('Kleber', 2), ('Rolindo', 2); 

  

--Update para alterar dados 

UPDATE	Estilo 

SET		Nome = 'Samba' 

WHERE	IdEstilo = 2  

  

  

--APAGAR DADOS  

DELETE FROM		Estilo  

WHERE			IdEstilo = 6; 

  

DELETE FROM		Albuns 

WHERE			IdAlbum = 1; 

  

--APAGAR TODOS OS DADOS DA TABELA	 

TRUNCATE TABLE	Estilo; 

TRUNCATE TABLE	Albuns; CREATE DATABASE OPTUS; 

USE OPTUS; 

  

CREATE TABLE TipoUsuario ( 

IdTipoUsuario	INT PRIMARY KEY IDENTITY, 

Titulo			VARCHAR(200) 

); 

  

CREATE TABLE Usuario ( 

IdUsuario		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200), 

IdTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario) 

); 

  

CREATE TABLE Artista ( 

IdArtista		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200) 

); 

  

CREATE TABLE Estilo ( 

IdEstilo		INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200) UNIQUE 

); 

  

CREATE TABLE Albuns ( 

IdAlbum			INT PRIMARY KEY IDENTITY, 

Nome			VARCHAR (200), 

DataLancamento	DATE, 

QtdMinutos		VARCHAR (200), 

Visualizacao	VARCHAR (200), 

IdArtista		INT FOREIGN KEY REFERENCES Artista (IdArtista), 

IdEstilo		INT FOREIGN KEY REFERENCES Estilo (IdEstilo) 

); 

  

  

  

  

--DML LINGUAGEM DE MANIPULAÇÃO DE DADOS 

  

SELECT * FROM Estilo; 

SELECT * FROM Artista; 

SELECT * FROM Albuns; 

SELECT * FROM Usuario; 

SELECT * FROM TipoUsuario; 

  

-- COMANDO DE INSERIR DADOS 

INSERT INTO	Estilo (Nome, IdEstilo) 

VALUES ('Pagode' 1),('Samba', 2),('Rock', 3),('Rap', 4),('Funk', 5),('Pop', 6); 

  

INSERT INTO Artista (Nome, IdArtista) 

VALUES ('Ferrugem', 1),('Post Malone', 2),('MC Kevin', 3); 

  


INSERT INTO Albuns (Nome, DataLancamento, QtdMinutos, Visualizacao, IdArtista, IdEstilo) 

VALUES ('nxzero', '18/03/2020', 140, 5873190, 3, 1),
 ('turma do pagode', '21/03/2001', 150 , 0998989, 2, 2);



  

INSERT INTO TipoUsuario (Titulo) 

VALUES ('Administrador'), ('Comum'); 

  

INSERT INTO Usuario (Nome, IdTipoUsuario) 

VALUES ('ADM', 1), ('Roberto', 2), ('Gary', 2), ('Finn', 2), ('Kleber', 2), ('Rolindo', 2); 

  

--Update para alterar dados 

UPDATE	Estilo 

SET		Nome = 'Samba' 

WHERE	IdEstilo = 2  

  

  

--APAGAR DADOS  

DELETE FROM		Estilo  

WHERE			IdEstilo = 6; 

DELETE FROM Albuns

WHERE IdArtista = 2;

DELETE FROM Albuns

WHERE IdArtista = 3;



DELETE FROM Albuns
WHERE IdArtista = 4;




DELETE FROM		Albuns 

WHERE			IdAlbum = 1; 

  

--APAGAR TODOS OS DADOS DA TABELA	 

TRUNCATE TABLE	Estilo; 

TRUNCATE TABLE	Albuns; 

-- DQL LINGUAGEM DE CONSULTA DE DADOS

SELECT * FROM Artista;

SELECT Nome from Artista;

SELECT Nome, DataLancamento from Albuns;

-- Operação < , > , =

SELECT * FROM Albuns WHERE IdEstilo = 1;

SELECT * FROM Albuns WHERE IdEstilo > 1;

-- OR OU 
SELECT Nome, QtdMinutos FROM Albuns
WHERE (DataLancamento IS NULL) or (Visualizacao IS NULL);

-- A frase é a "pitty canta rock"
--'pitty' acha a palavra 
--'pitty%' acha a palavra no começo
--'%pitty' acha do final da frase
--'%pitty%' acha no meio 

SELECT IdArtista, Nome FROM Albuns
WHERE Nome LIKE '%Pagode de fim de tarde%' 

--ordem invertida do (maior para o menor ou alfabetico)

SELECT IdArtista, Nome, QtdMinutos FROM Albuns
Order By IdAlbum;

--ordem invertida do (menor para o maior ou alfabetico)
SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
Order By IdAlbum DESC

SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
Order By IdAlbum ASC;

--COUNT (conta as coisas que tem na tabela)

SELECT COUNT(IdAlbum) FROM Albuns;

-- SELECIONAR OS ALBUNS DO MESMO ARTISTA 
SELECT * FROM Albuns WHERE IdArtista = 2;

--USANDO INNER JOIN (JUNÇÃO DE DUAS OU MAIS TABELA)
SELECT  Artista.Nome, Albuns.Nome FROM Artista
INNER JOIN Albuns ON Artista.IdArtista = Albuns.IdEstilo
WHERE Albuns.IdArtista = 2;

--SELECIONAR OS AALBUNS LANÇADOS NA MESMA DATA
SELECT * FROM Albuns WHERE DataLancamento = '21/03/2001';

-- INNER JOIN
SELECT * FROM Artista
INNER JOIN Albuns ON Artista.IdArtista = Albuns.IdArtista
WHERE DataLancamento = '21/03/2001';

--SELECIONAR ALBUNS E ARTISTAS E ORDENAR POR DATA DE LANÇAMENTO (MAIS ANTIGO PARA O MAIS RECENTE)
SELECT * FROM Albuns ORDER BY DataLancamento asc;

-- COM JOIN 
SELECT Artista.Nome as NomeArtista, Albuns.Nome as NomeAlbum, DataLancamento -- atributos com o apeldo
FROM Artista 
INNER JOIN Albuns ON Artista.IdArtista = Albuns.IdArtista
ORDER BY DataLancamento asc;

--SELECIONAR ARTISTAS DO MESMO ESTILO MUSICAL
SELECT IdArtista, IdEstilo from Albuns where IdEstilo = 2;

--DESAFIO REALIZAR EXERCICIOS 
--COM INNER JOIN, COM 3 TABELAS ( NOME DO ARTISTA, ALBUM E ESTILO) 
SELECT Artista.Nome as IdArtista, Estilo.Nome
from artista
INNER JOIN Albuns ON Artista.IdArtista = Albuns.IdArtista
INNER JOIN Estilo ON Albuns.IdEstilo = Estilo.IdEstilo
where Estilo.IdEstilo = 2;



--EXERCÍCIO SPRINT 1

SELECT * FROM Albuns WHERE IdArtista = 2;

SELECT * FROM Albuns WHERE DataLancamento = '21/03/2001';

SELECT * FROM Albuns WHERE IdEstilo = 2;

SELECT DataLancamento FROM Albuns
Order By IdAlbum ASC;

