DROP TABLE categoria CASCADE;
DROP TABLE categoria_simples CASCADE;
DROP TABLE super_categoria CASCADE;
DROP TABLE tem_categoria CASCADE;
DROP TABLE produto CASCADE;
DROP TABLE tem_categoria CASCADE;
DROP TABLE ivm CASCADE;
DROP TABLE ponto_de_retalho CASCADE;
DROP TABLE instalada_em CASCADE;
DROP TABLE prateleira CASCADE;
DROP TABLE planograma CASCADE;
DROP TABLE retalhista CASCADE;
DROP TABLE responsavel_por CASCADE;
DROP TABLE evento_reposicao CASCADE;

CREATE TABLE categoria(
    nome VARCHAR(50) NOT NULL PRIMARY KEY
);

CREATE TABLE categoria_simples(
    nome VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES categoria(name)
);

CREATE TABLE super_categoria(
    nome VARCHAR(50) PRIMARY KEY FOREIGN KEY REFERENCES categoria(name)
);

CREATE TABLE tem_outra(
    super_categoria VARCHAR(50) FOREIGN KEY REFERENCES super_categoria(nome),
    categoria VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome)
);

CREATE TABLE produto(
    ean VARCHAR(13) PRIMARY KEY,
    descr VARCHAR(100)
);

CREATE TABLE tem_categoria(
    ean VARCHAR(13) FOREIGN KEY REFERENCES produto(ean),
    nome VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome)
);

CREATE TABLE ivm(
    num_serie INT,
    fabricante VARCHAR(50),
    CONSTRAINT ivm_pk PRIMARY KEY (num_serie, fabricante)
);

CREATE TABLE ponto_de_retalho(
    nome VARCHAR(50) PRIMARY KEY,
    distrito VARCHAR(50),
    concelho VARCHAR(50)
);

CREATE TABLE instalada_em(
    num_serie INT FOREIGN KEY REFERENCES ivm(num_serie),
    fabricante VARCHAR(50) FOREIGN KEY REFERENCES ivm(fabricante),
    local VARCHAR(50) FOREIGN KEY REFERENCES ponto_de_retalho(nome)
    CONSTRAINT instalada_em_pk PRIMARY KEY (num_serie, fabricante)
);

CREATE TABLE prateleira(
    nro INT,
    num_serie INT FOREIGN KEY REFERENCES ivm(num_serie),
    fabricante VARCHAR(50) FOREIGN KEY REFERENCES ivm(fabricante),
    altura REAL,
    nome VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome),
    CONSTRAINT prateleira_pk PRIMARY KEY (nro, num_serie, fabricante)
);

CREATE TABLE planograma(
    ean VARCHAR(13) FOREIGN KEY REFERENCES produto(ean),
    nro INT FOREIGN KEY REFERENCES prateleira(nro),
    num_serie INT FOREIGN KEY REFERENCES prateleira(num_serie),
    fabricante VARCHAR(50) FOREIGN KEY REFERENCES prateleira(fabricante),
    faces INT,
    unidades INT,
    loc VARCHAR(50),
    CONSTRAINT planograma_pk PRIMARY KEY (ean, nro, num_serie, fabricante)
);

CREATE TABLE retalhista(
    tin INT PRIMARY KEY,
    nome VARCHAR(50) UNIQUE;
);

CREATE TABLE responsavel_por(
    nome_cat VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome),
    tin INT FOREIGN KEY REFERENCES retalhista(tin),
    num_serie INT FOREIGN KEY REFERENCES ivm(num_serie),
    fabricante VARCHAR(50) FOREIGN KEY REFERENCES ivm(fabricante),
    CONSTRAINT responsavel_por_pk PRIMARY KEY (num_serie, fabricante)
);

CREATE TABLE evento_reposicao(
    ean VARCHAR(13) FOREIGN KEY REFERENCES planograma(ean),
    nro INT FOREIGN KEY REFERENCES planograma(nro),
    num_serie INT FOREIGN KEY REFERENCES planograma(num_serie),
    fabricante VARCHAR(50) FOREIGN KEY REFERENCES planograma(fabricante),
    instante TIMESTAMP,
    unidades INT,
    tin INT FOREIGN KEY REFERENCES retalhista(tin),
    CONSTRAINT evento_reposicao_pk PRIMARY KEY (ean, nro, num_serie, fabricante, instante)
);


INSERT INTO categoria values ("sandes");
INSERT INTO categoria values ("sandes de fiambre");
INSERT INTO categoria values ("sandes de queijo");
INSERT INTO categoria values ("bebidas");
INSERT INTO categoria values ("bebidas em garrafa");
INSERT INTO categoria values ("bebidas em lata");

INSERT INTO categoria_simples values("sandes de fiambre");
INSERT INTO categoria_simples values ("sandes de queijo");
INSERT INTO categoria_simples values("bebidas em garrafa");
INSERT INTO categoria_simples values("bebidas em lata");

INSERT INTO super_categoria values("sandes");
INSERT INTO super_categoria values("bebidas");

INSERT INTO tem_outra values("sandes","sandes de fiambre");
INSERT INTO tem_outra values("sandes","sandes de queijo");
INSERT INTO tem_outra values("bebidas","bebidas em garrafa");
INSERT INTO tem_outra values("bebidas","bebidas em lata");

INSERT INTO produto values("01","sandes de fiambre","sandes de friambre com manteiga");
INSERT INTO produto values("02","sandes de fiambre","sandes de friambre sem manteiga");
INSERT INTO produto values("02","sandes de queijo","sandes de friambre com manteiga");
INSERT INTO produto values("02","sandes de queijo","sandes de friambre sem manteiga");



