CREATE SCHEMA IF NOT EXISTS bd_avaliacao_A1 
DEFAULT CHARACTER SET utf8;
USE bd_avaliacao_A1;
CREATE TABLE IF NOT EXISTS bd_avaliacao_A1(
id INT,
rg VARCHAR (20),
nome VARCHAR (100),
data_nascimento DATE,
titulação_id INT
) Engine = InnoDB;
SELECT * FROM bd_avaliacao_A1
