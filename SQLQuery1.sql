CREATE DATABASE dB_Optus;

USE dB_Optus;

CREATE TABLE Permissoes (
	IdPermissao INT PRIMARY KEY IDENTITY,
	Tipo VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE Usuarios (
	IdUser INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(250) NOT NULL,
	Email VARCHAR(250) NOT NULL UNIQUE,
	Senha VARCHAR(250) NOT NULL,
	IdPermissao INT FOREIGN KEY REFERENCES Permissoes (IdPermissao)

);

INSERT INTO Permissoes (Tipo) VALUES ('Comum'),('Admin');
INSERT INTO Usuarios (Nome, Email, Senha, IdPermissao)
			VALUES  ('Lucas Amador', 'lucas@gmail.com', '65096093',  1),
					('Gabriel Amador' , 'gabriel@gmail.com' , '650960897' , 1),
					('Admin' ,'admin@gmail.com', 'admin', 2);

SELECT * FROM Permissoes;
SELECT * FROM Usuarios;


CREATE TABLE Vizualizacoes (
	IdVizualizacao  INT PRIMARY KEY IDENTITY,
	Tipo VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(250) NOT NULL 
);

INSERT INTO Vizualizacoes (Tipo) VALUES ('Disponível'),('Indisponível');
INSERT INTO Artistas (Nome) VALUES ('Djavan'),('Imagine Dragons'),('Rita Lee');

SELECT * FROM Vizualizacoes;
SELECT * FROM Artistas;

CREATE TABLE Albuns (
	IdAlbum INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL,
	Lancameto VARCHAR(200) NOT NULl,
	Minutos VARCHAR(200) NOT NULL,
	Pais VARCHAR(100) NOT NULL,
	IdVizualizacao INT FOREIGN KEY REFERENCES Vizualizacoes (IdVizualizacao),
	IdArtista INT FOREIGN KEY REFERENCES Artistas (IdArtista)
);

SELECT * FROM Albuns;

DELETE FROM Albuns;

INSERT INTO Albuns (Nome, Lancameto, Minutos, Pais, IdVizualizacao, IdArtista)
		VALUES ('Rap Pesado', '27/02/2015', '21:40:678', 'Brasil', 1, 2),
		('Jazz', '08/01/2019', '14:18:188', 'Brasil', 1, 1),
		('MPB Bolado', '15/09/2011', '12:00:000', 'Brasil', 1, 3),
		('Eletronic','03/08/2019', '17:30:000', 'EUA',2, 2)

CREATE TABLE Estilos (
	IdEstilo INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE EstilosAlbuns (
	IdEstilo INT FOREIGN KEY REFERENCES Estilos (IdEstilo),
	IdAlbum INT FOREIGN KEY REFERENCES Albuns (IdAlbum),
);

SELECT * FROM Estilos;
SELECT * FROM EstilosAlbuns;

INSERT INTO Estilos (Nome) VALUES ('Rap'),('MPB'),('Reagee'),('Zumba'),('Eletronic'),('Rock');
INSERT INTO EstilosAlbuns (IdAlbum, IdEstilo)
			VALUES  (1,1),
					(2,3),
					(3,2),
					(3,3),
					(4,5)
