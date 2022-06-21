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