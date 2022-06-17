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
    cat VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome),
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
    nome VARCHAR(50) FOREIGN KEY REFERENCES categoria(nome)
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