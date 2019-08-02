CREATE DATABASE T_Livros;
USE T_Livros;

CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL 
);

CREATE TABLE Livros (
	IdLivro INT PRIMARY KEY IDENTITY, 
	Titulo VARCHAR(200) NOT NULL,
	IdGenero INT FOREIGN KEY REFERENCES Generos (IdGenero),
	IdAutor INT FOREIGN KEY REFERENCES Autores (IdAutor)
);

INSERT INTO Autores (Nome) VALUES ('JK. Rollings'), ('Madeline Roux') , ('Steve Jobs') ;
INSERT INTO Generos (Nome) VALUES ('Biografia'), ('Aventura') , ('Ficção') , ('Terror') , ('Romance') ;
INSERT INTO Generos (Nome) VALUES ('Auto-Ajuda'), ('Psicologia');

INSERT INTO Livros (Titulo, IdGenero, IdAutor )
	VALUES ('A Câmara Secreta', 2,1),
			('Steve Jobs a Biografia', 1, 3),
			('O Poder do Hábito', 6 , 2),
			('Asilum', 4,2),
			('Camadas de Emoções' , 7 , 3)

SELECT * FROM Autores;
SELECT * FROM Generos;
SELECT * FROM Livros;

SELECT Livros.* , Autores.*
FROM Livros FULL JOIN Autores 
ON Livros.IdAutor = Autores.IdAutor





