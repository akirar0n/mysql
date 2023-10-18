DROP DATABASE Projecao;
CREATE SCHEMA IF NOT EXISTS Projecao
DEFAULT CHARACTER SET utf8;
USE Projecao;	
CREATE TABLE IF NOT EXISTS Aluno(
	id INT NOT NULL,
	nome VARCHAR (255),
	email VARCHAR (255),
	data_nascimento DATETIME,
	PRIMARY KEY (id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Turma(
	id INT NOT NULL,
	inicio DATETIME,
	fim DATETIME,
	observacoes LONGTEXT,
	PRIMARY KEY (id)
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS AlunoTurma (
aluno_id INT NOT NULL,
turma_id INT NOT NULL,	
PRIMARY KEY (aluno_id, turma_id),
FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
FOREIGN KEY (turma_id) REFERENCES Turma(id)
) ENGINE = InnoDB;

INSERT INTO Aluno VALUES (1, 'Joao Paulo Pimentel', 'jpapim@gmail.com','1978-02-19');
INSERT INTO Aluno VALUES (2, 'Jose Paulo Pimentel', 'joseph@gmail.com','1988-07-13');
INSERT INTO Aluno VALUES (3, 'Anibal da Silva', 'anibal@gmail.com','1968-05-29');
SELECT * FROM Aluno;

INSERT INTO Turma VALUES (1, '2019-03-01', '2019-07-15', 'Turma de Banco de Dados I');
INSERT INTO Turma VALUES (2, '2019-04-01', '2019-07-22', 'Turma de Banco de Dados II');
SELECT * FROM Turma;

INSERT INTO AlunoTurma VALUES (1, 1);
INSERT INTO AlunoTurma VALUES (2, 1);
SELECT * FROM AlunoTurma;

CREATE TABLE IF NOT EXISTS Nota(
	id INT NOT NULL,
    aluno_id INT,
    turma_id INT,
    nota DECIMAL (4, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
) ENGINE = InnoDB;

INSERT INTO Nota VALUES(1,1,1,10);
INSERT INTO Nota VALUES(2,2,1,8);
INSERT INTO Nota VALUES(3,3,2,5);
SELECT * FROM Nota;

SELECT * FROM Nota AS n1
WHERE n1.nota > (
	SELECT AVG (n2.nota)
    FROM Nota AS n2
    WHERE n2.turma_id = n1.turma_id);
    
SELECT n1.*, (
	SELECT max(n2.nota)
    FROM Nota AS n2
    WHERE n2.turma_id = 1 
) AS maior_nota
FROM Nota AS n1
WHERE n1.turma_id = 1;