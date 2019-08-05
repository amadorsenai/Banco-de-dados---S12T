CREATE DATABASE T_DPS;
USE T_DPS;

CREATE TABLE Salarios(
	IdSalario INT PRIMARY KEY IDENTITY,
	Valor FLOAT 
);

CREATE TABLE Departamentos(
	IdDepartamento INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200) NOT NULL UNIQUE,
	QuantFuncionarios INT DEFAULT(0)
);

CREATE TABLE Profissoes(
	IdProfissao INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200) NOT NULL,
	Descricao VARCHAR(800)
);

CREATE TABLE Funcionarios(
	IdFuncionario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200) NOT NULL,
	IdSalario INT FOREIGN KEY REFERENCES Salarios(IdSalario),
	IdDepartamento INT FOREIGN KEY REFERENCES Departamentos(IdDepartamento),
	IdProfissao INT FOREIGN KEY REFERENCES Profissoes(IdProfissao)
);

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Tipo VARCHAR(200) NOT NULL UNIQUE 
);

CREATE TABLE HabilidadeFuncionario(
	IdFuncionario INT FOREIGN KEY REFERENCES Funcionarios(IdFuncionario),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
);

-------------------
SELECT * FROM Funcionarios;

INSERT INTO Habilidades (Tipo) VALUES ('Extroversão'),('AutoData'),('Liderança'),('Comunicação'),('AutoConfiança'),('Persuasão');
INSERT INTO Salarios (Valor) VALUES (650),(900),(1200),(1500),(2100);
INSERT INTO Departamentos (Nome, QuantFuncionarios) VALUES ('Administrativo', 16),('Recursos Humanos', 14),('Financeiro', 28),('Comercial', 40),('Estoque', 18);
INSERT INTO Profissoes (Nome, Descricao) VALUES ('Analista de Sistemas', 'Analisar Sistemas'), ('Programador','Programar'), ('Analista de Curriculos','Analisar Curriculos e competências'), ('Gestor de Pessoas','Gerir o clima da empresa'),('Estocador','Estoca Materiais Reservas'), ('Contabilizador', 'Contabiliza gastos e investimentos');
INSERT INTO Funcionarios (Nome, IdSalario, IdDepartamento, IdProfissao)
				VALUES ('Vladmir', 2, 4,6), ('Cilano', 3, 3,2), ('Ficano', 5, 2, 1), ('Schorsch', 1, 5,3), ('Carla', 1, 1,5);
-- INSERT INTO HabilidadeFuncionario (IdFuncionario, IdHabilidade) VALUES (1,6),(2,4),(2,5),(3,4),(3,2),(3,1);