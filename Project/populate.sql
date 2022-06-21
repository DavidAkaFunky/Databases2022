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
 
INSERT INTO categoria VALUES ('sandes');
INSERT INTO categoria VALUES ('sandes de fiambre');
INSERT INTO categoria VALUES ('sandes de queijo');
INSERT INTO categoria VALUES ('bebidas');
INSERT INTO categoria VALUES ('bebidas em garrafa');
INSERT INTO categoria VALUES ('bebidas em lata');

INSERT INTO categoria_simples VALUES ('sandes de fiambre');
INSERT INTO categoria_simples VALUES ('sandes de queijo');
INSERT INTO categoria_simples VALUES ('bebidas em garrafa');
INSERT INTO categoria_simples VALUES ('bebidas em lata');

INSERT INTO super_categoria VALUES ('sandes');
INSERT INTO super_categoria VALUES ('bebidas');

INSERT INTO tem_outra VALUES ('sandes','sandes de fiambre');
INSERT INTO tem_outra VALUES ('sandes','sandes de queijo');
INSERT INTO tem_outra VALUES ('bebidas','bebidas em garrafa');
INSERT INTO tem_outra VALUES ('bebidas','bebidas em lata');

INSERT INTO produto VALUES (01,'sandes de fiambre com manteiga');
INSERT INTO produto VALUES (02,'sandes de fiambre sem manteiga');
INSERT INTO produto VALUES (03,'sandes de queijo com manteiga');
INSERT INTO produto VALUES (04,'sandes de queijo sem manteiga');
INSERT INTO produto VALUES (05,'sandes de atum');
INSERT INTO produto VALUES (06,'pleno');
INSERT INTO produto VALUES (07,'agua');
INSERT INTO produto VALUES (08,'coca-cola');
INSERT INTO produto VALUES (09,'lipton');
INSERT INTO produto VALUES (10,'compal');

INSERT INTO tem_categoria VALUES (01,'sandes de fiambre');
INSERT INTO tem_categoria VALUES (02,'sandes de fiambre');
INSERT INTO tem_categoria VALUES (03,'sandes de queijo');
INSERT INTO tem_categoria VALUES (04,'sandes de queijo');
INSERT INTO tem_categoria VALUES (05,'sandes');
INSERT INTO tem_categoria VALUES (06,'bebidas em garrafa');
INSERT INTO tem_categoria VALUES (07,'bebidas em garrafa');
INSERT INTO tem_categoria VALUES (08,'bebidas em lata');
INSERT INTO tem_categoria VALUES (09,'bebidas em lata');
INSERT INTO tem_categoria VALUES (10,'bebidas');

INSERT INTO ivm VALUES (53253545, 'IST');
INSERT INTO ivm VALUES (12369420, 'ISEL');
INSERT INTO ivm VALUES (48565232, 'ISCAL');

INSERT INTO ponto_de_retalho VALUES ('IST machine', 'Lisboa', 'Lisboa');
INSERT INTO ponto_de_retalho VALUES ('ISEL machine', 'Lisboa', 'Lisboa');
INSERT INTO ponto_de_retalho VALUES ('ISCAL machine', 'Lisboa', 'Lisboa');

INSERT INTO instalada_em VALUES (53253545, 'IST', 'IST machine');
INSERT INTO instalada_em VALUES (12369420, 'ISEL', 'ISEL machine');
INSERT INTO instalada_em VALUES (48565232, 'ISCAL', 'ISCAL machine');

INSERT INTO prateleira VALUES (01, 53253545, 'IST', 2, 'sandes');
INSERT INTO prateleira VALUES (02, 53253545, 'IST', 2, 'bebidas');
INSERT INTO prateleira VALUES (01, 12369420, 'ISEL', 2, 'sandes de fiambre');
INSERT INTO prateleira VALUES (02, 12369420, 'ISEL', 2, 'bebidas em garrafa');
INSERT INTO prateleira VALUES (01, 48565232, 'ISCAL', 2, 'sandes de queijo');
INSERT INTO prateleira VALUES (02, 48565232, 'ISCAL', 2, 'bebidas em lata');

INSERT INTO planograma VALUES (05, 01, 53253545, 'IST', 2, 10, 'IST');
INSERT INTO planograma VALUES (01, 01, 53253545, 'IST', 2, 10, 'IST');
INSERT INTO planograma VALUES (10, 02, 53253545, 'IST', 2, 10, 'IST');
INSERT INTO planograma VALUES (01, 01, 12369420, 'ISEL', 2, 10, 'ISEL');
INSERT INTO planograma VALUES (02, 01, 12369420, 'ISEL', 2, 10, 'ISEL');
INSERT INTO planograma VALUES (06, 02, 12369420, 'ISEL', 2, 10, 'ISEL');
INSERT INTO planograma VALUES (03, 01, 48565232, 'ISCAL', 2, 10, 'ISCAL');
INSERT INTO planograma VALUES (08, 02, 48565232, 'ISCAL', 2, 10, 'ISCAL');
INSERT INTO planograma VALUES (09, 02, 48565232, 'ISCAL', 2, 10, 'ISCAL');

INSERT INTO retalhista VALUES (001,'LIDL');
INSERT INTO retalhista VALUES (002,'Continente');
INSERT INTO retalhista VALUES (003,'Pingo Doce');

INSERT INTO responsavel_por VALUES ('sandes', 001, 53253545, 'IST');
/* INSERT INTO responsavel_por VALUES ('bebidas', 001, 53253545, 'IST'); */
INSERT INTO responsavel_por VALUES ('sandes de fiambre', 002, 12369420, 'ISEL');
/* INSERT INTO responsavel_por VALUES ('bebidas em garrafa', 002, 12369420, 'ISEL');*/
INSERT INTO responsavel_por VALUES ('sandes de queijo', 003, 48565232, 'ISCAL');
/* INSERT INTO responsavel_por VALUES ('bebidas em lata', 003, 48565232, 'ISCAL');*/

INSERT INTO evento_reposicao VALUES (05, 01, 53253545, 'IST', '2008-01-01 00:00:01', 5, 001);
INSERT INTO evento_reposicao VALUES (05, 01, 53253545, 'IST', '2008-02-05 21:00:31', 5, 003);