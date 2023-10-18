SHOW databases;
DROP DATABASE lojão;
CREATE SCHEMA IF NOT EXISTS lojão DEFAULT CHARACTER SET utf8;
USE lojão;
CREATE TABLE IF NOT EXISTS categorias (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (255) NOT NULL
) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS produtos(	
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
categoria_id INT NOT NULL,
nome VARCHAR (255) NOT NULL,
preço DECIMAL (10,2) NOT NULL
) ENGINE = InnoDB;
INSERT INTO categorias VALUES (1, 'Camisetas');
INSERT INTO categorias VALUES (2, 'Canecas');
SELECT * FROM categorias;
INSERT INTO produtos VALUES (null, 1, 'Camiseta Social', 45.00);
INSERT INTO produtos VALUES (null, 1, 'Camiseta Regata', 31.99);
INSERT INTO produtos VALUES (null, 2, 'Caneca Grande', 18.90);
SELECT * FROM produtos;
SELECT produtos .* FROM produtos
 INNER JOIN categorias ON produtos.categoria_id = categorias.id
 ORDER BY produtos.nome ASC;
SELECT p.nome AS produto_nome FROM produtos AS p;
SELECT c.nome AS categoria_nome FROM categorias AS c;