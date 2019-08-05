CREATE DATABASE T_Moda;
USE T_Moda;

CREATE TABLE Tamanhos (
	IdTamanho INT PRIMARY KEY IDENTITY,
	Valor VARCHAR(200) NOT NULL
);

CREATE TABLE Marcas (
	IdMarca INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Cores (
	IdCor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Camisetas (
	IdCamiseta INT PRIMARY KEY IDENTITY,
	IdTamanho INT FOREIGN KEY REFERENCES Tamanhos(IdTamanho),
	IdMarca INT FOREIGN KEY REFERENCES Marcas(IdMarca),
	IdCor INT FOREIGN KEY REFERENCES Cores(IdCor)
);

INSERT INTO Tamanhos (Valor) VALUES ('P'),('M'),('G');
INSERT INTO Marcas (Nome) VALUES ('Polo'),('Adidas'),('Holliester'),('Ralph Lauren'),('Calvin Clein');
INSERT INTO Cores (Nome) VALUES ('Azul'),('Preto'),('Verde'),('Vermelho'),('Roxo'),('Marrom');
INSERT INTO Camisetas (IdTamanho, IdMarca, IdCor) VALUES (1,5,6),(1,4,5),(2,1,4),(3,2,3),(2,2,2),(3,3,1);

UPDATE Camisetas
SET IdMarca = 3
WHERE IdCamiseta = 4; 

UPDATE Camisetas
SET IdMarca = 4
WHERE IdCamiseta = 6; 

DELETE Camisetas WHERE IdCamiseta = 6;

SELECT * FROM Camisetas;
SELECT * FROM Tamanhos;
SELECT * FROM Marcas;
SELECT * FROM Cores;

--CAMISETA/MARCA
SELECT Camisetas.IdCamiseta, Camisetas.IdTamanho, Camisetas.IdMarca, Marcas.Nome, Marcas.QuantidadeLojas, Marcas.DataCriação
FROM Camisetas JOIN Marcas
ON Camisetas.IdMarca = Marcas.IdMarca;

--CAMISETA/COR
SELECT  Camisetas.IdCamiseta, Camisetas.IdTamanho, Camisetas.IdMarca, Cores.Nome
FROM Camisetas JOIN Cores
ON Camisetas.IdCor = Cores.IdCor;

--CAMISETA/TAMANHO
SELECT  Camisetas.IdCamiseta, Camisetas.IdTamanho, Camisetas.IdMarca, Tamanhos.Valor
FROM Camisetas JOIN Tamanhos
ON Camisetas.IdTamanho= Tamanhos.IdTamanho;

------------  E X T R A S -------------

ALTER TABLE Marcas ADD QuantidadeLojas INT DEFAULT(1);
ALTER TABLE Marcas ADD DataCriação DATE;
ALTER TABLE Camisetas ADD Lavavel BIT DEFAULT(0);
ALTER TABLE Tamanhos ADD Medidas VARCHAR(100);

INSERT INTO Marcas (Nome, QuantidadeLojas, DataCriação)
	VALUES ('Element', 4,'23/06/2003');

UPDATE Marcas 
SET QuantidadeLojas = 1, DataCriação = '15/09/2012'
WHERE IdMarca < 2;

UPDATE Marcas 
SET QuantidadeLojas = 6, DataCriação = '08/09/2005'
WHERE IdMarca = 5;

UPDATE Marcas 
SET QuantidadeLojas = 7, DataCriação = '22/12/2017'
WHERE IdMarca = 3;

UPDATE Marcas 
SET DataCriação = '22/02/2003'
WHERE IdMarca = 2;

UPDATE Marcas 
SET DataCriação = '04/09/2018'
WHERE IdMarca = 4;




