SHOW databases;
DROP DATABASE estudantes;
CREATE SCHEMA IF NOT EXISTS estudantes DEFAULT CHARACTER SET utf8;
USE estudantes;
CREATE TABLE IF NOT EXISTS alunos (
nome VARCHAR(255),
email VARCHAR(255),
altura DECIMAL(3,2),
notas DECIMAL(10,0),
aprovado TINYINT(1)
)
ENGINE = MyISAM;
SHOW TABLES;
INSERT INTO alunos (nome, email, altura, notas, aprovado) VALUES ('Maria', 'mary@gmail', '1.75', '6.5', '1');
INSERT INTO alunos (nome, email, altura, notas, aprovado) VALUES ('João', 'john@gmail','1.70', '7.0', '1');
INSERT INTO alunos (nome, email, altura, notas, aprovado) VALUES ('Roberto', 'berto@gmail','1.83', '5.0', '0');
INSERT INTO alunos (nome, email, altura, notas, aprovado) VALUES ('Claudia', 'claud@gmail','1.77', '9.0', '1');
INSERT INTO alunos (nome, email, altura, notas, aprovado) VALUES ('Pedro', 'pedrin@gmail','1.79', '4.5', '0');
SELECT * FROM alunos;
SELECT * FROM alunos WHERE altura >= 1.79;
SELECT * FROM alunos WHERE aprovado = 1;
SELECT * FROM alunos WHERE aprovado = 0;
SELECT * FROM alunos ORDER BY aprovado DESC;
SELECT AVG (altura) FROM alunos;
SELECT * FROM alunos WHERE altura > 1.7;
SELECT sum(altura) FROM alunos;
SELECT sum(altura) FROM alunos WHERE aprovado = 1;
SELECT max(altura) FROM alunos;
SELECT min(altura) FROM alunos;
ALTER TABLE alunos ADD notas INTEGER;
SELECT AVG (notas) FROM alunos;
