DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS categoria_simples CASCADE;
DROP TABLE IF EXISTS super_categoria CASCADE;
DROP TABLE IF EXISTS tem_outra CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS tem_categoria CASCADE;
DROP TABLE IF EXISTS ivm CASCADE;
DROP TABLE IF EXISTS ponto_de_retalho CASCADE;
DROP TABLE IF EXISTS instalada_em CASCADE;
DROP TABLE IF EXISTS prateleira CASCADE;
DROP TABLE IF EXISTS planograma CASCADE;
DROP TABLE IF EXISTS retalhista CASCADE;
DROP TABLE IF EXISTS responsavel_por CASCADE;
DROP TABLE IF EXISTS evento_reposicao CASCADE;

CREATE TABLE categoria(
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT "nome_cat_pk" PRIMARY KEY ("nome")
);

CREATE TABLE categoria_simples(
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT "nome_cat_simples_pk" PRIMARY KEY("nome"),
    CONSTRAINT "nome_cat_simples_fk" FOREIGN KEY("nome") REFERENCES categoria("nome")
);

CREATE TABLE super_categoria(
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT "nome_super_cat_pk" PRIMARY KEY("nome"),
    CONSTRAINT "nome_super_cat_fk" FOREIGN KEY("nome") REFERENCES categoria("nome")
);

CREATE TABLE tem_outra(
    "super_categoria" VARCHAR(50) NOT NULL,
    "categoria" VARCHAR(50) NOT NULL,
    CONSTRAINT "nome_super_cat_tem_outra_fk" FOREIGN KEY("super_categoria") REFERENCES super_categoria("nome"),
    CONSTRAINT "nome_cat_tem_outra_fk" FOREIGN KEY("categoria") REFERENCES categoria("nome")
);

CREATE TABLE produto(
    "ean" INT NOT NULL,
    "descr" VARCHAR(100) NOT NULL,
    CONSTRAINT "ean_produto_pk" PRIMARY KEY("ean")
);

CREATE TABLE tem_categoria(
    "ean" INT NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    CONSTRAINT "ean_produto_tem_categoria_fk" FOREIGN KEY("ean") REFERENCES produto("ean"),
    CONSTRAINT "nome_categoria_tem_categoria_fk" FOREIGN KEY("nome") REFERENCES categoria("nome")
);

CREATE TABLE ivm(
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL,
    CONSTRAINT "ivm_pk" PRIMARY KEY("num_serie", "fabricante")
);

CREATE TABLE ponto_de_retalho(
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    "distrito" VARCHAR(50) NOT NULL,
    "concelho" VARCHAR(50) NOT NULL,
    CONSTRAINT "nome_ponto_pk" PRIMARY KEY("nome")
);

CREATE TABLE instalada_em(
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL,
    "local" VARCHAR(50) NOT NULL,
    CONSTRAINT "num_serie_fabricante_ivm_instalada_em_fk" FOREIGN KEY("num_serie", "fabricante") REFERENCES ivm("num_serie", "fabricante"),
    CONSTRAINT "local_ponto_de_retalho_instala_em_fk" FOREIGN KEY("local") REFERENCES ponto_de_retalho("nome"),
    CONSTRAINT "instalada_em_pk" PRIMARY KEY ("num_serie", "fabricante")
);

CREATE TABLE prateleira(
    "nro" INT NOT NULL,
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL,
    "altura" REAL NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    CONSTRAINT "num_serie_fabricante_ivm_prateleira_fk" FOREIGN KEY("num_serie", "fabricante") REFERENCES ivm("num_serie", "fabricante"),
    CONSTRAINT "nome_categoria_prateleira_fk" FOREIGN KEY("nome") REFERENCES categoria("nome"),
    CONSTRAINT "prateleira_pk" PRIMARY KEY("nro", "num_serie", "fabricante")
);

CREATE TABLE planograma(
    "ean" INT NOT NULL,
    "nro" INT NOT NULL, 
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL,
    "faces" INT NOT NULL,
    "unidades" INT NOT NULL,
    "loc" VARCHAR(50) NOT NULL,
    CONSTRAINT "ean_produto_planograma_fk" FOREIGN KEY("ean") REFERENCES produto("ean"),
    CONSTRAINT "nro_num_serie_fabricante_prateleira_planograma_fk" FOREIGN KEY("nro", "num_serie", "fabricante") REFERENCES prateleira("nro", "num_serie", "fabricante"), 
    CONSTRAINT "planograma_pk" PRIMARY KEY ("ean", "nro", "num_serie", "fabricante")
);

CREATE TABLE retalhista(
    "tin" INT NOT NULL,
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT "retalhista_pk" PRIMARY KEY("tin")
);

CREATE TABLE responsavel_por(
    "nome_cat" VARCHAR(50) NOT NULL,
    "tin" INT NOT NULL,
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL,
    CONSTRAINT "nome_cat_responsavel_por_fk" FOREIGN KEY("nome_cat") REFERENCES categoria("nome"),
    CONSTRAINT "tin_retalhista_responsavel_por_fk" FOREIGN KEY("tin") REFERENCES retalhista("tin"),
    CONSTRAINT "num_serie_fabricante_ivm_responsavel_por_fk" FOREIGN KEY("num_serie", "fabricante") REFERENCES ivm("num_serie", "fabricante"),
    CONSTRAINT "responsavel_por_pk" PRIMARY KEY ("num_serie", "fabricante")
);

CREATE TABLE evento_reposicao(
    "ean" INT NOT NULL,
    "nro" INT NOT NULL,
    "num_serie" INT NOT NULL,
    "fabricante" VARCHAR(50) NOT NULL, 
    "instante" TIMESTAMP NOT NULL,
    "unidades" INT NOT NULL,
    "tin" INT NOT NULL,
    CONSTRAINT "planograma_evento_reposicao_fk" FOREIGN KEY("ean", "nro", "num_serie", "fabricante") REFERENCES planograma("ean", "nro", "num_serie", "fabricante"),
    CONSTRAINT "tin_retalhista_evento_reposicao_fk" FOREIGN KEY("tin") REFERENCES retalhista("tin"),
    CONSTRAINT "evento_reposicao_pk" PRIMARY KEY ("ean", "nro", "num_serie", "fabricante", "instante")
);