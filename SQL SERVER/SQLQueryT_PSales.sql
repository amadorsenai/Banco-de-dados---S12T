-- cria o banco de dados poh
CREATE DATABASE T_PSales;

-- Coloca em uso essta tabela
-- OBS: Começar com a tamela qua não tem uma fk;
USE T_PSales;

-- Criar Tabelas
CREATE TABLE Cursos(
	-- tipo de dado, tipo de chave, autoIncremento;
	IdCurso INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Disciplinas(
	IdDiscipllina INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(250) NOT NULL,
	IdCurso INT FOREIGN KEY REFERENCES Cursos(IdCurso) 
);

CREATE TABLE Alunos(
	IdAluno INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL,
);

CREATE TABLE AlunosCursos(
	IdCurso INT FOREIGN KEY REFERENCES Cursos(IdCurso),
	IdAluno INT FOREIGN KEY REFERENCES Alunos(IdAluno),
);

-- DDl Data Definition Language 
--DML Data 

-- INSERIR DADOS 

INSERT INTO Cursos (Nome) VALUES ('Técnicos em Dev. Sistemas');
INSERT INTO Cursos VALUES ('Técnicos em Redes'),('Técnicos em Algo de TI'),('Técnico em Desing Web e GAME');


-- SELECT VIZUALIZA OS DADOS

SELECT IdCurso, Nome FROM Cursos;
SELECT * FROM Cursos WHERE IdCurso = 1;
SELECT * FROM Cursos;

-- UPDATE ATUALIZA OS DADOS
UPDATE Cursos
SET Nome = 'Técnico em Desenvolvimento de Sistemas'
	WHERE  IdCurso = 1;

	-------------------------------------------------------------------------------
INSERT INTO Disciplinas (Nome , IdCurso)
				VALUES ('HTML' , '1');

SELECT * FROM Disciplinas;

DELETE FROM Cursos
	WHERE IdCurso = 4;

