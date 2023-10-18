-- Exercício 1:

DROP DATABASE caesb;
CREATE SCHEMA IF NOT EXISTS caesb DEFAULT CHARACTER SET utf8;
USE caesb;

CREATE TABLE IF NOT EXISTS TipoTarifa(
  idTipoTarifa INT NOT NULL,
  desctipotarifa VARCHAR (45) NOT NULL,
  PRIMARY KEY (idTipoTarifa)
) Engine = InnoDB;

CREATE TABLE IF NOT EXISTS UnidadeConsumo(
  idUnidadeConsumo INT NOT NULL,
  matricula VARCHAR(11) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  idTipoTarifa INT NOT NULL,
  PRIMARY KEY (idUnidadeConsumo),
  FOREIGN KEY (idTipoTarifa) REFERENCES TipoTarifa(idTipoTarifa)
) Engine = InnoDB;

CREATE TABLE IF NOT EXISTS Consumo(
  idConsumo INT NOT NULL,
  quantidade FLOAT NOT NULL,
  mes INT NOT NULL,
  ano INT NOT NULL,
  idUnidadeConsumo INT NOT NULL,
  PRIMARY KEY (idConsumo),
  FOREIGN KEY (idUnidadeConsumo) REFERENCES UnidadeConsumo(idUnidadeConsumo)
) ENGINE = InnoDB;

INSERT INTO TipoTarifa VALUES (1, 'Normal');
INSERT INTO TipoTarifa VALUES (2, 'Reduzida');

SELECT * FROM TipoTarifa;

INSERT INTO UnidadeConsumo VALUES (1, 1, 'Avenida Brasil', 1);
INSERT INTO UnidadeConsumo VALUES (2, 2, 'Avenida Argentina', 1);
INSERT INTO UnidadeConsumo VALUES (3, 3, 'Avenida Paraguai', 2);
INSERT INTO UnidadeConsumo VALUES (4, 4, 'Avenida Chile', 1);

SELECT * FROM UnidadeConsumo;

INSERT INTO Consumo VALUES (1, 30, 3, 2019, 1);
INSERT INTO Consumo VALUES (2, 39, 3, 2019, 2);
INSERT INTO Consumo VALUES (3, 50, 3, 2019, 3);
INSERT INTO Consumo VALUES (4, 30, 4, 2019, 4);

SELECT * FROM Consumo;

-- Resposta Exercício 1:

SELECT count(matricula) FROM UnidadeConsumo, TipoTarifa, Consumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
Consumo.ano = "2019" and
Consumo.mes = "3" and
Consumo.quantidade < 40 and
desctipotarifa = 'Normal';

-- Resposta Exercício 2:

SELECT UnidadeConsumo.matricula, UnidadeConsumo.endereco FROM UnidadeConsumo, TipoTarifa, Consumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
Consumo.ano = "2019" and
Consumo.mes = "3" and
Consumo.quantidade < 40 and
desctipotarifa = 'Normal';

-- Exercício 3:

CREATE TABLE IF NOT EXISTS ResponsavelUnidadeConsumo(
  idResponsavel INT NOT NULL,
  nomeResponsavel VARCHAR(100) NOT NULL,
  idadeResponsavel INT NOT NULL,
  idUnidadeConsumo INT NOT NULL,
  PRIMARY KEY (idResponsavel), 
  FOREIGN KEY (idUnidadeConsumo) REFERENCES UnidadeConsumo(idUnidadeConsumo)
) ENGINE = InnoDB;

INSERT INTO ResponsavelUnidadeConsumo VALUES (1, 'João Paulo', 25, 1);
INSERT INTO ResponsavelUnidadeConsumo VALUES (2, 'Joaõ Pimentel', 35, 2);
INSERT INTO ResponsavelUnidadeConsumo VALUES (3, 'Paulo Pimentel',36 ,3);
INSERT INTO ResponsavelUnidadeConsumo VALUES (4, 'João Pimentel', 40, 4);

SELECT * FROM ResponsavelUnidadeConsumo;

-- Resposta Exercício 3:

SELECT ResponsavelUnidadeConsumo.nomeResponsavel FROM ResponsavelUnidadeConsumo, UnidadeConsumo, TipoTarifa, Consumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
ResponsavelUnidadeConsumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
Consumo.ano = "2019" and
Consumo.mes = "3" and
Consumo.quantidade < 40 and
desctipotarifa = 'Normal';

-- Resposta Exercício 4:

SELECT idResponsavel AS IDENTIFICADOR,
nomeResponsavel AS NOME,
idadeResponsavel AS IDADE,
quantidade AS CONSUMO,
mes AS MÊS,
ano AS ANO
FROM UnidadeConsumo, TipoTarifa, Consumo, ResponsavelUnidadeConsumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
ResponsavelUnidadeConsumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
Consumo.ano = "2019" and
Consumo.mes = "3" and
Consumo.quantidade < 40 and
desctipotarifa = 'Normal';

-- Exercício 5:

SELECT idResponsavel AS IDENTIFICADOR,
nomeResponsavel AS NOME,
endereco AS ENDEREÇO,
idadeResponsavel AS IDADE,
quantidade AS CONSUMO,
mes AS MÊS,
ano AS ANO,
desctipotarifa AS TARIFA
FROM UnidadeConsumo, TipoTarifa, Consumo, ResponsavelUnidadeConsumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
ResponsavelUnidadeConsumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo;

SELECT AVG (quantidade) AS 'MÉDIA CONSUMO TOTAL' FROM Consumo;

SELECT AVG (quantidade) AS 'MÉDIA CONSUMO NORMAL' FROM Consumo, TipoTarifa, UnidadeConsumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
desctipotarifa = 'Normal';

SELECT AVG (quantidade) AS 'MÉDIA CONSUMO REDUZIDA' FROM Consumo, TipoTarifa, UnidadeConsumo
WHERE TipoTarifa.idTipoTarifa = UnidadeConsumo.idTipoTarifa and
Consumo.idUnidadeConsumo = UnidadeConsumo.idUnidadeConsumo and
desctipotarifa = 'Reduzida';
