CREATE DATABASE T_SStop;

USE T_SStop;

----------

CREATE TABLE EstilosMusicas (
	IdEstilosMusical INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL UNIQUE
);

INSERT INTO EstilosMusicas VALUES ('Rock�n Roll'), ('Metal'), ('MPB'), ('POP'), ('Eletronic'), ('Rap'), ('Jazz');
SELECT * FROM EstilosMusicas;

---------


CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	IdEstiloMusical INT FOREIGN KEY REFERENCES EstilosMusicas(IdEstilosMusical),
	Nome VARCHAR(200) NOT NULL
);

INSERT INTO Artistas (IdEstiloMusical , Nome)
				VALUES (1,'Legi�o Urbana'),
						(2,'Metalica'),
						(6,'F�bio Brazza'),
						(6,'Sabotage'),
						(7,'Joe Willians'),
						(3,'Djavan'),
						(3,'Caetano Veloso'),
						(5,'Marshmellow'),
						(5,'David Guetta')

SELECT * FROM Artistas;
DELETE FROM Artistas WHERE IdArtista = 1;

INSERT INTO Artistas (IdEstiloMusical , Nome)
				VALUES (3,'Legi�o Urbana')

DELETE FROM Artistas WHERE IdEstiloMusical = 2;
						

SELECT * FROM Artistas;
SELECT * FROM EstilosMusicas;

SELECT * FROM EstilosMusicas;
SELECT * FROM EstilosMusicas WHERE IdEstilosMusical = 1;
SELECT * FROM EstilosMusicas WHERE Nome = 'Rock�n Roll';
SELECT * FROM EstilosMusicas WHERE Nome = 'Rock�n Rol';
SELECT * FROM EstilosMusicas WHERE Nome LIKE 'Rock�n Rol%';
SELECT * FROM EstilosMusicas WHERE Nome LIKE '%Rock�n Roll';
SELECT * FROM EstilosMusicas WHERE Nome LIKE '%R%';

SELECT Artistas.*, EstilosMusicas.*
	FROM  Artistas
	FULL JOIN EstilosMusicas -- ou RITHG JOIN EstilosMusical ou LEFT JOIN EstilosMusical ou s� JOIN
	ON Artistas.IdArtista = EstilosMusicas.IdEstilosMusical;

INSERT INTO Artistas (Nome) VALUES ('Jo�o Neto')
INSERT INTO EstilosMusicas(Nome) VALUES ('Funk')
INSERT INTO EstilosMusicas(Nome) VALUES ('K-Pop')
INSERT INTO EstilosMusicas(Nome) VALUES ('Lo-Fi')




