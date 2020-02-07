-- CRIA O BANCO DE DADOS
CREATE DATABASE Gufi_Tarde;

-- DEFINE QUAL BANCO DE DADOS ESTÁ SENDO UTILIZADO
USE Gufi_Tarde;

-- CRIA AS TABELAS DO BANCO DE DADOS
CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY
	,TituloTipoUsuario VARCHAR (255) NOT NULL UNIQUE
);

CREATE TABLE TipoEvento (
	IdTipoEvento INT PRIMARY KEY IDENTITY
	,TituloTipoEvento VARCHAR (255) NOT NULL UNIQUE
);

CREATE TABLE Instituicao (
	IdInstituicao INT PRIMARY KEY IDENTITY
	,CNPJ CHAR (14) NOT NULL UNIQUE
	,NomeFantasia VARCHAR (255) NOT NULL UNIQUE
	,Endereco VARCHAR (255) NOT NULL UNIQUE
);

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY IDENTITY
	,NomeUsuario VARCHAR (255) NOT NULL
	,Email VARCHAR (255) NOT NULL UNIQUE
	,Senha VARCHAR (255) NOT NULL
	,Genero VARCHAR (255) NOT NULL 
	,DataNascimento DATETIME2 NOT NULL
	,IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);

CREATE TABLE Evento (
	IdEvento INT PRIMARY KEY IDENTITY
	,NomeEvento VARCHAR (255) NOT NULL
	,DataEvento DATETIME2 NOT NULL
	,Descricao VARCHAR (255) NOT NULL
	,AcessoLivre BIT DEFAULT (1) NOT NULL
	,IdInstituicao INT FOREIGN KEY REFERENCES Instituicao (IdInstituicao)
	,IdTipoEvento INT FOREIGN KEY REFERENCES TipoEvento (IdTipoEvento)
);

CREATE TABLE Presenca (
	IdPresenca INT PRIMARY KEY IDENTITY
	,IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
	,IdEvento INT FOREIGN KEY REFERENCES Evento (IdEvento)
	,Situacao VARCHAR (255) NOT NULL
);
--ddl
SELECT * FROM TipoUsuario;
SELECT * FROM TipoEvento;
SELECT * FROM Instituicao;
SELECT * FROM Usuario;
SELECT * FROM Evento;
SELECT * FROM Presenca;

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES ('Adm'), ('comum');

INSERT INTO TipoEvento (TituloTipoEvento)
Values ('c#'), ('REACT'), ('SQL');

INSERT INTO Instituicao (CNPJ,NomeFantasia,Endereco)
VALUES (111111111111,'Escola Senai de informatica','Endereco');

INSERT INTO Usuario (NomeUsuario,Email,Senha,Genero,DataNascimento,IdTipoUsuario)
VALUES ('Adm','Adm@adm.com','adm132','nao informado','06/02/2020',1),
	   ('Carol','carol@email.com','carol132','Feminino','06/02/2020',2),
	   ('Saulo','saulo@email.com','saulo123','Masculino','06/02/2020',2);

INSERT INTO Evento (NomeEvento,DataEvento,Descricao,AcessoLivre,IdInstituicao,IdTipoEvento)
VALUES ('Introdução ao C#','07/02/2020','Conceitos sobre os pilares da programação orientada a objetos',1,1,1),
       ('Ciclo de vida','07/02/2020','Como utilizar o ciclo de vida com ReactJs',0,1,2),
	   ('Optimização de banco de dados','07/02/2020','Aplicação de índices clusterizados e não clusterizados',1,1,3);

INSERT INTO Presenca (IdUsuario,IdEvento,Situacao)
VALUES (2,2,'Agendada'),
(2,3,'CONFIRMADO'),
(3,1,'NÃO COMPARECEU');

--DQL
SELECT Usuario.NomeUsuario,Usuario.Email,Usuario.DataNascimento,Usuario.Genero,TipoUsuario.TituloTipoUsuario FROM Usuario
INNER JOIN TipoUsuario ON Usuario.IdTipoUsuario = TipoUsuario.IdTipoUsuario;


SELECT Instituicao.CNPJ,Instituicao.NomeFantasia,Instituicao.Endereco, 
CASE 
	WHEN [AcessoLivre] = 1 THEN 'publico' 
	WHEN [AcessoLivre] = 0 THEN 'privado'
END as AcessoLivre
FROM Instituicao
INNER JOIN Evento ON Evento.IdInstituicao = Instituicao.IdInstituicao


SELECT Evento.NomeEvento,Evento.DataEvento,Evento.AcessoLivre,Evento.Descricao,TipoEvento.TituloTipoEvento,Instituicao.NomeFantasia, 
case when Evento.AcessoLivre = 1 then 'Publico' else 'Privado' end
FROM Evento
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
Inner JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
Where Evento.AcessoLivre=1;

SELECT Evento.NomeEvento,Evento.DataEvento,Evento.Descricao,Instituicao.NomeFantasia,TipoEvento.TituloTipoEvento from Evento
Inner JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento;


SELECT Evento.NomeEvento,Evento.DataEvento,Evento.Descricao,Instituicao.NomeFantasia,TipoEvento.TituloTipoEvento,Usuario.NomeUsuario,Usuario.Email,Usuario.Genero, TipoUsuario.TituloTipoUsuario from Evento
Inner JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento
INNER JOIN Presenca ON Presenca.IdEvento = Evento.IdEvento
Inner JOIN Usuario on Usuario.IdUsuario = Presenca.IdUsuario
INNER JOIN TipoUsuario ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario
WHERE Usuario.IdUsuario = 2;


SELECT Usuario.NomeUsuario, Usuario.Email, Evento.NomeEvento, TipoEvento.TituloTipoEvento as Tipo_Evento, Eventos.DataEvento, Eventos.AcessoLivre as Pub_Priv , Eventos.Descricao, Instituicoes.NomeFantasia as NomeInstituicao, Instituicoes.Endereco
FROM Eventos INNER JOIN Presencas ON Presencas.IdEvento = Eventos.IdEvento
INNER JOIN TiposEventos ON Eventos.IdTipoEvento = TiposEventos.IdTipoEvento
INNER JOIN Instituicoes ON Instituicoes.IdInstituicao = Eventos.IdInstituicao
INNER JOIN Usuarios ON Usuarios.IdUsuario = Presencas.IdUsuario
WHERE Usuarios.IdUsuario = 2 AND Presencas.Situacao = 'Confirmada'

