DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS categoria_simples CASCADE;
DROP TABLE IF EXISTS super_categoria CASCADE;
DROP TABLE IF EXISTS tem_categoria CASCADE;
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
    CONSTRAINT "nome_super_cat_tem_outra_fk" FOREIGN KEY("nome") REFERENCES super_categoria("nome"),
    CONSTRAINT "nome_cat_tem_outra_fk" FOREIGN KEY("nome") REFERENCES categoria("nome")
);

CREATE TABLE produto(
    "ean" VARCHAR(13) NOT NULL UNIQUE,
    "descr" VARCHAR(100) NOT NULL,
    CONSTRAINT "ean_produto_pk" PRIMARY KEY("ean")
);

CREATE TABLE tem_categoria(
    "ean" VARCHAR(13),
    CONSTRAINT "ean_produto_tem_categoria_fk" FOREIGN KEY("ean") REFERENCES produto("ean"),
    "nome" VARCHAR(50),
    CONSTRAINT "nome_categoria_tem_categoria_fk" FOREIGN KEY("nome") REFERENCES categoria("nome")
);

CREATE TABLE ivm(
    "num_serie" INT,
    "fabricante" VARCHAR(50),
    CONSTRAINT "ivm_pk" PRIMARY KEY("num_serie","fabricante")
);

CREATE TABLE ponto_de_retalho(
    "nome" VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT "nome_ponto_pk" PRIMARY KEY("nome"),
    "distrito" VARCHAR(50),
    "concelho" VARCHAR(50)
);

CREATE TABLE instalada_em(
    "num_serie" INT,
    CONSTRAINT "num_serie_ivm_instalada_em_fk" FOREIGN KEY("num_serie") REFERENCES ivm("num_serie"),
    "fabricante" VARCHAR(50),
    CONSTRAINT "fabricante_ivm_instala_em_fk" FOREIGN KEY("fabricante") REFERENCES ivm("fabricante"),
    local VARCHAR(50)
    CONSTRAINT "local_ponto_de_retalho_instala_em_fk" FOREIGN KEY(local) REFERENCES ponto_de_retalho("nome"),
    CONSTRAINT instalada_em_pk PRIMARY KEY ("num_serie", "fabricante")
);

CREATE TABLE prateleira(
    "nro" INT,
    "num_serie" INT,
    CONSTRAINT "num_serie_ivm_prateleira_fk" FOREIGN KEY("num_serie") REFERENCES ivm("num_serie"),
    "fabricante" VARCHAR(50),
    CONSTRAINT "fabricante_ivm_prateleira_fk" FOREIGN KEY("fabricante") REFERENCES ivm("fabricante"),
    "altura" REAL,
    "nome" VARCHAR(50),
    CONSTRAINT "nome_categoria_prateleira_fk" FOREIGN KEY("nome") REFERENCES categoria("nome"),
    CONSTRAINT "prateleira_pk" PRIMARY KEY("nro", "num_serie", "fabricante"),
);

CREATE TABLE planograma(
    "ean" VARCHAR(13),
    CONSTRAINT "ean_produto_planograma_fk" FOREIGN KEY("ean") REFERENCES produto("ean"),
    "nro" INT, 
    CONSTRAINT "nro_prateleira_planograma_fk" FOREIGN KEY("nro") REFERENCES prateleira("nro"),
    "num_serie" INT,
    CONSTRAINT "num_serie_prateleira_planograma_fk" FOREIGN KEY("num_serie") REFERENCES prateleira("num_serie"),
    "fabricante" VARCHAR(50),
    CONSTRAINT "frabircante_prateleira_planograma_fk" FOREIGN KEY("fabricante") REFERENCES prateleira("fabricante"), 
    "faces" INT,
    "unidades" INT,
    "loc" VARCHAR(50),
    CONSTRAINT "planograma_pk" PRIMARY KEY ("ean", "nro", "num_serie", "fabricante")
);

CREATE TABLE retalhista(
    "tin" INT,
    CONSTRAINT "retalhista_pk" PRIMARY KEY("tin"),
    "nome" VARCHAR(50) UNIQUE
);

CREATE TABLE responsavel_por(
    "nome_cat" VARCHAR(50),
    CONSTRAINT "nome_cat_responsavel_por_fk" FOREIGN KEY("nome_cat") REFERENCES categoria("nome"),
    "tin" INT,
    CONSTRAINT "tin_retalhista_responsavel_por_fk"FOREIGN KEY("tin") REFERENCES retalhista("tin"),
    "num_serie" INT,
    CONSTRAINT "num_serie_ivm_responsavel_por_fk" FOREIGN KEY("num_serie") REFERENCES ivm("num_serie"),
    "fabricante" VARCHAR(50),
    CONSTRAINT "fabricante_ivm_responsavel_por_fk" FOREIGN KEY("fabricante") REFERENCES ivm("fabricante"),
    CONSTRAINT "responsavel_por_pk" PRIMARY KEY ("num_serie", "fabricante")
);

CREATE TABLE evento_reposicao(
    "ean" VARCHAR(13), 
    CONSTRAINT "ean_planograma_evento_reposicao_fk" FOREIGN KEY("ean") REFERENCES planograma("ean"),
    "nro" INT,
    CONSTRAINT "nro_planograma_evento_reposicao_fk" FOREIGN KEY("nro") REFERENCES planograma("nro"),
    "num_serie" INT,
    CONSTRAINT "num_serie_planograma_evento_reposicao_fk" FOREIGN KEY("num_serie") REFERENCES planograma("num_serie"),
    "fabricante" VARCHAR(50), 
    CONSTRAINT "fabricante_planograma_evento_reposicao_fk"FOREIGN KEY("fabricante") REFERENCES planograma("fabricante"),
    "instante" TIMESTAMP,
    "unidades" INT,
    "tin" INT,
    CONSTRAINT "tin_retalhista_evento_reposicao_fk" FOREIGN KEY("tin") REFERENCES retalhista("tin"),
    CONSTRAINT "evento_reposicao_pk" PRIMARY KEY ("ean", "nro", "num_serie", "fabricante", "instante")
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

INSERT INTO produto values("01","sandes de friambre com manteiga");
INSERT INTO produto values("02","sandes de friambre sem manteiga");
INSERT INTO produto values("03","sandes de queijo com manteiga");
INSERT INTO produto values("04","sandes de queijo sem manteiga");
INSERT INTO produto values("05","sandes de atum");
INSERT INTO produto values("06","pleno");
INSERT INTO produto values("07","agua");
INSERT INTO produto values("08","coca-cola");
INSERT INTO produto values("09","lipton");
INSERT INTO produto values("10","compal");

INSERT INTO tem_categoria values("01","sandes de fiambre");
INSERT INTO tem_categoria values("02","sandes de fiambre");
INSERT INTO tem_categoria values("03","sandes de queijo");
INSERT INTO tem_categoria values("04","sandes de queijo");
INSERT INTO tem_categoria values("05","sandes");
INSERT INTO tem_categoria values("06","bebidas em garrafa");
INSERT INTO tem_categoria values("07","bebidas em garrafa");
INSERT INTO tem_categoria values("08","bebidas em lata");
INSERT INTO tem_categoria values("09","bebidas em lata");
INSERT INTO tem_categoria values("10","bebidas");

INSERT INTO ivm values("IVM01","IST");
INSERT INTO ivm values("IVM02","ISEL");
INSERT INTO ivm values("IVM03","ISCAL");

INSERT INTO ponto_de_retalho values("IST machine", "Lisboa", "Lisboa");
INSERT INTO ponto_de_retalho values("ISEL machine", "Lisboa", "Lisboa");
INSERT INTO ponto_de_retalho values("ISCAL machine", "Lisboa", "Lisboa");










