CREATE DATABASE T_Livros;
USE T_Livros;

/*                  EXERCICIO

﻿Cada livro de uma biblioteca poderá conter somente um autor e somente um gênero vinculado.

DDL
- Criar todas as tabelas de acordo com o proposto na modelagem da pasta exercicios-livros.

DML
- Inserir 3 autores de sua escolha, bem como os gêneros.
- Incluir 5 livros a sua escolha;
- Alterar o nome do livro para que fiquem todas em maiúscula;
- Deletar o livro com o maior Id;

DQL
- Selecionar todos os autores;
- Selecionar todos os gêneros;
- Selecionar todos os livros;
- Selecionar todos os livros e seus respectivos autores;
- Selecionar todos os livros e seus respectivos gêneros;
- Selecionar todos os livros e seus respectivos autores e gêneros;

Desafios Extras
- Incluir uma coluna para incluir a sinopse dos livros;
- Incluir uma coluna de data de lançamento do livro;
- Incluir uma coluna para identificar que o livro ainda está sendo veiculado.
*/

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

-- ALTER altera a tabela
-- UPDATE altera os dados
ALTER TABLE Livros 
ADD Sinopse VARCHAR(3000);

ALTER TABLE Livros 
ADD DataLançamento DATE

ALTER TABLE Livros 
ADD Veinculado BIT

INSERT INTO Autores (Nome) VALUES ('JK. Rollings'), ('Madeline Roux') , ('Steve Jobs') ;
INSERT INTO Generos (Nome) VALUES ('Biografia'), ('Aventura') , ('Ficção') , ('Terror') , ('Romance'), ('Auto-Ajuda'), ('Psicologia');

INSERT INTO Livros (Titulo, IdGenero, IdAutor )
	VALUES ('A Câmara Secreta', 3,1),
			('Steve Jobs a Biografia', 1, 3),
			('O Poder do Hábito', 6 , 3),
			('Asilum', 4,2),
			('Camadas de Emoções' , 7 , 3)

UPDATE Livros
SET Titulo = UPPER(Titulo)

UPDATE Livros
SET Sinopse = 'Após as sofríveis férias na casa dos tios, Harry Potter se prepara para voltar a Hogwarts e começar seu segundo ano na escola de bruxos. Na véspera do início das aulas, a estranha criatura Dobby aparece em seu quarto e o avisa de que voltar é um erro e que algo muito ruim pode acontecer se Harry insistir em continuar os estudos de bruxaria. O garoto, no entanto, está disposto a correr o risco e se livrar do lar problemático.',
DataLançamento = '05/08/2008',
Veinculado = 1
WHERE IdLivro = 1;

UPDATE Livros
SET Sinopse = 'O filme destaca momentos decisivos na vida de Steve Jobs, desde o lançamento do primeiro Macintosh, em 1984, e a criação da NeXT Inc, até a introdução revolucionária do iMac. Fatos da vida pessoal de Jobs também são revelados, especialmente o conturbado relacionamento com sua primeira filha Lisa.',
DataLançamento = '27/11/2015',
Veinculado = 1
WHERE IdLivro = 2;

UPDATE Livros
SET Sinopse = 'O poder do hábito escrito pelo repórter do New York Times Charles Duhigg, que há duas décadas pesquisou como os hábitos funcionam – e, mais importante, como podem ser transformados, elabora um argumento animador: A chave para mudar o que não funciona em sua vida é entender como os hábitos funcionam.',
DataLançamento = '01/04/2000',
Veinculado = 0
WHERE IdLivro = 3;

UPDATE Livros
SET Sinopse = 'Ao entrar pela primeira vez no New Hampshire Colleg, Dan Crawford não imagina que vai viver ali as cinco semanas mais aterrorizantes de sua vida. Best-Seller do New York Times, este livro é um suspense arrepiante diferente de tudo o que já foi lido. Ilustrado com fotografias tenebrosas de manicômios reais, este livro vai surpreender o leitor a cada página virada, afinal: " A loucura é algo relativo. Depende muito de que lado da grade a pessoa está"',
DataLançamento = '30/12/2018',
Veinculado = 1
WHERE IdLivro = 4;

DELETE FROM Livros WHERE IdLivro = 5

SELECT * FROM Autores;
SELECT * FROM Generos;
SELECT * FROM Livros;

SELECT Livros.IdLivro, Livros.Titulo, Livros.IdGenero, Livros.DataLançamento, Livros.Sinopse , Livros.Veinculado, Autores.Nome AS Autor
FROM Livros FULL JOIN Autores
ON Livros.IdAutor = Autores.IdAutor 
-- Obs: removi do select o IdAutor das das duas tabelas

SELECT Livros.IdLivro, Livros.Titulo, Livros.IdAutor,Generos.Nome AS Gênero, Livros.DataLançamento, Livros.Sinopse , Livros.Veinculado
FROM Generos
RIGHT JOIN Livros
ON Livros.IdGenero = Generos.IdGenero
-- Obs: removi do select o IdGenero das duas tabelas

SELECT Livros.IdLivro, Livros.Titulo,Generos.Nome AS Gênero, Autores.Nome AS Autor, Livros.DataLançamento, Livros.Sinopse , Livros.Veinculado
FROM Livros
JOIN Generos ON Livros.IdGenero = Generos.IdGenero
JOIN Autores ON Livros.IdAutor = Autores.IdAutor
-- Obs: Aeeeeee poh select em 3 diferentes tabelas


