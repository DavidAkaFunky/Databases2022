INSERT INTO categoria VALUES ('Categoria1');
INSERT INTO categoria VALUES ('Categoria2');
INSERT INTO categoria VALUES ('Categoria3');
INSERT INTO categoria VALUES ('Categoria4');
INSERT INTO categoria VALUES ('Categoria5');
INSERT INTO categoria VALUES ('Categoria15');
INSERT INTO categoria VALUES ('Categoria16');
INSERT INTO categoria VALUES ('Categoria17');
INSERT INTO categoria VALUES ('Categoria18');
INSERT INTO categoria VALUES ('Categoria19');
INSERT INTO categoria VALUES ('Categoria6');
INSERT INTO categoria VALUES ('Categoria7');
INSERT INTO categoria VALUES ('Categoria8');
INSERT INTO categoria VALUES ('Categoria9');
INSERT INTO categoria VALUES ('Categoria10');
INSERT INTO categoria VALUES ('Categoria11');
INSERT INTO categoria VALUES ('Categoria12');
INSERT INTO categoria VALUES ('Categoria13');
INSERT INTO categoria VALUES ('Categoria14');
INSERT INTO categoria VALUES ('Categoria20');
INSERT INTO categoria VALUES ('Categoria21');

INSERT INTO categoria_simples VALUES ('Categoria1');
INSERT INTO categoria_simples VALUES ('Categoria2');
INSERT INTO categoria_simples VALUES ('Categoria3');
INSERT INTO categoria_simples VALUES ('Categoria4');
INSERT INTO categoria_simples VALUES ('Categoria5');
INSERT INTO categoria_simples VALUES ('Categoria15');
INSERT INTO categoria_simples VALUES ('Categoria16');
INSERT INTO categoria_simples VALUES ('Categoria17');
INSERT INTO categoria_simples VALUES ('Categoria18');
INSERT INTO categoria_simples VALUES ('Categoria19');

INSERT INTO super_categoria VALUES ('Categoria6');
INSERT INTO super_categoria VALUES ('Categoria7');
INSERT INTO super_categoria VALUES ('Categoria8');
INSERT INTO super_categoria VALUES ('Categoria9');
INSERT INTO super_categoria VALUES ('Categoria10');
INSERT INTO super_categoria VALUES ('Categoria11');
INSERT INTO super_categoria VALUES ('Categoria12');
INSERT INTO super_categoria VALUES ('Categoria13');
INSERT INTO super_categoria VALUES ('Categoria14');
INSERT INTO super_categoria VALUES ('Categoria20');
INSERT INTO super_categoria VALUES ('Categoria21');

INSERT INTO tem_outra VALUES ('Categoria6', 'Categoria1');
INSERT INTO tem_outra VALUES ('Categoria7', 'Categoria2');
INSERT INTO tem_outra VALUES ('Categoria8', 'Categoria3');
INSERT INTO tem_outra VALUES ('Categoria9', 'Categoria4');
INSERT INTO tem_outra VALUES ('Categoria10','Categoria5');
INSERT INTO tem_outra VALUES ('Categoria10','Categoria11');
INSERT INTO tem_outra VALUES ('Categoria11','Categoria12');
INSERT INTO tem_outra VALUES ('Categoria12','Categoria13');
INSERT INTO tem_outra VALUES ('Categoria13','Categoria14');
INSERT INTO tem_outra VALUES ('Categoria14','Categoria15');
INSERT INTO tem_outra VALUES ('Categoria20','Categoria16');
INSERT INTO tem_outra VALUES ('Categoria20','Categoria17');
INSERT INTO tem_outra VALUES ('Categoria21','Categoria18');
INSERT INTO tem_outra VALUES ('Categoria21','Categoria19');

INSERT INTO produto VALUES (1,'Produto1');
INSERT INTO produto VALUES (2,'Produto2');
INSERT INTO produto VALUES (3,'Produto3');
INSERT INTO produto VALUES (4,'Produto4');
INSERT INTO produto VALUES (5,'Produto5');
INSERT INTO produto VALUES (6,'Produto6');
INSERT INTO produto VALUES (7,'Produto7');
INSERT INTO produto VALUES (8,'Produto8');
INSERT INTO produto VALUES (9,'Produto9');
INSERT INTO produto VALUES (10,'Produto10');
INSERT INTO produto VALUES (11,'Produto11');
INSERT INTO produto VALUES (12,'Produto12');
INSERT INTO produto VALUES (13,'Produto13');
INSERT INTO produto VALUES (14,'Produto14');
INSERT INTO produto VALUES (15,'Produto15');
INSERT INTO produto VALUES (16,'Produto16');
INSERT INTO produto VALUES (17,'Produto17');
INSERT INTO produto VALUES (18,'Produto18');
INSERT INTO produto VALUES (19,'Produto19');

/*tem_categoria(numero de produto, nome de categoria)*/
INSERT INTO tem_categoria VALUES (1,'Categoria1');
INSERT INTO tem_categoria VALUES (2,'Categoria2');
INSERT INTO tem_categoria VALUES (3,'Categoria17');
INSERT INTO tem_categoria VALUES (4,'Categoria17');
INSERT INTO tem_categoria VALUES (5,'Categoria20');
INSERT INTO tem_categoria VALUES (6,'Categoria18');
INSERT INTO tem_categoria VALUES (7,'Categoria18');
INSERT INTO tem_categoria VALUES (8,'Categoria19');
INSERT INTO tem_categoria VALUES (9,'Categoria19');
INSERT INTO tem_categoria VALUES (10,'Categoria21');
INSERT INTO tem_categoria VALUES (11, 'Categoria1');
INSERT INTO tem_categoria VALUES (12, 'Categoria1');
INSERT INTO tem_categoria VALUES (13, 'Categoria1');
INSERT INTO tem_categoria VALUES (14, 'Categoria2');
INSERT INTO tem_categoria VALUES (15, 'Categoria2');
INSERT INTO tem_categoria VALUES (16, 'Categoria2');
INSERT INTO tem_categoria VALUES (17, 'Categoria3');
INSERT INTO tem_categoria VALUES (18, 'Categoria4');
INSERT INTO tem_categoria VALUES (19, 'Categoria5');

INSERT INTO ivm VALUES (54321567, 'Fabricante1');
INSERT INTO ivm VALUES (54322657, 'Fabricante2');
INSERT INTO ivm VALUES (54323568, 'Fabricante3');
INSERT INTO ivm VALUES (54324555, 'Fabricante4');
INSERT INTO ivm VALUES (54325111, 'Fabricante5');
INSERT INTO ivm VALUES (54326124, 'Fabricante6');
INSERT INTO ivm VALUES (54327897, 'Fabricante7');
INSERT INTO ivm VALUES (54328111, 'Fabricante8');
INSERT INTO ivm VALUES (54329000, 'Fabricante9');
INSERT INTO ivm VALUES (54330121, 'Fabricante10');
INSERT INTO ivm VALUES (54331456, 'Fabricante11');
INSERT INTO ivm VALUES (54332111, 'Fabricante12');
INSERT INTO ivm VALUES (53253545, 'Fabricante13');
INSERT INTO ivm VALUES (12369420, 'Fabricante14');
INSERT INTO ivm VALUES (48565232, 'Fabricante15');
INSERT INTO ivm VALUES (12369420, 'Fabricante1');

INSERT INTO ponto_de_retalho VALUES ('PDR1', 'Distrito1', 'Concelho1');
INSERT INTO ponto_de_retalho VALUES ('PDR2', 'Distrito1', 'Concelho1');
INSERT INTO ponto_de_retalho VALUES ('PDR3', 'Distrito2', 'Concelho2');
INSERT INTO ponto_de_retalho VALUES ('PDR4', 'Distrito3', 'Concelho3');
INSERT INTO ponto_de_retalho VALUES ('PDR5', 'Distrito3', 'Concelho4');
INSERT INTO ponto_de_retalho VALUES ('PDR6', 'Distrito3', 'Concelho5');
INSERT INTO ponto_de_retalho VALUES ('PDR7', 'Distrito1', 'Concelho2');
INSERT INTO ponto_de_retalho VALUES ('PDR8', 'Distrito4', 'Concelho6');
INSERT INTO ponto_de_retalho VALUES ('PDR9', 'Distrito4', 'Concelho6');
INSERT INTO ponto_de_retalho VALUES ('PDR10', 'Distrito4', 'Concelho6');

INSERT INTO instalada_em VALUES (54321567, 'Fabricante1', 'PDR1');
INSERT INTO instalada_em VALUES (54322657, 'Fabricante2', 'PDR2');
INSERT INTO instalada_em VALUES (54323568, 'Fabricante3', 'PDR2');
INSERT INTO instalada_em VALUES (54324555, 'Fabricante4', 'PDR3');
INSERT INTO instalada_em VALUES (54325111, 'Fabricante5', 'PDR4');
INSERT INTO instalada_em VALUES (54326124, 'Fabricante6', 'PDR5');
INSERT INTO instalada_em VALUES (54327897, 'Fabricante7', 'PDR6');
INSERT INTO instalada_em VALUES (54328111, 'Fabricante8', 'PDR7');
INSERT INTO instalada_em VALUES (54329000, 'Fabricante9', 'PDR1');
INSERT INTO instalada_em VALUES (54330121, 'Fabricante10', 'PDR2');
INSERT INTO instalada_em VALUES (54331456, 'Fabricante11', 'PDR3');
INSERT INTO instalada_em VALUES (54332111, 'Fabricante12', 'PDR4');
INSERT INTO instalada_em VALUES (53253545, 'Fabricante13', 'PDR8');
INSERT INTO instalada_em VALUES (12369420, 'Fabricante14', 'PDR9');
INSERT INTO instalada_em VALUES (48565232, 'Fabricante15', 'PDR10');
INSERT INTO instalada_em VALUES (12369420, 'Fabricante1', 'PDR10');

/*prateleira(numero de prateleira, numero de serie, fabricante,altura, nome)*/
INSERT INTO prateleira VALUES (01, 54321567, 'Fabricante1', 100, 'Categoria1');
INSERT INTO prateleira VALUES (02, 54322657, 'Fabricante2', 200, 'Categoria2');
INSERT INTO prateleira VALUES (03, 54321567, 'Fabricante1',  50, 'Categoria2');
INSERT INTO prateleira VALUES (04, 54321567, 'Fabricante1', 150, 'Categoria2');
INSERT INTO prateleira VALUES (05, 54321567, 'Fabricante1', 250, 'Categoria3');
INSERT INTO prateleira VALUES (01, 54322657, 'Fabricante2', 100, 'Categoria1');
INSERT INTO prateleira VALUES (04, 54322657, 'Fabricante2', 200, 'Categoria3');
INSERT INTO prateleira VALUES (03, 54322657, 'Fabricante2',  50, 'Categoria2');
INSERT INTO prateleira VALUES (01, 54323568, 'Fabricante3', 100, 'Categoria1');
INSERT INTO prateleira VALUES (02, 54323568, 'Fabricante3', 200, 'Categoria5');
INSERT INTO prateleira VALUES (02, 12369420, 'Fabricante1', 50, 'Categoria4');
INSERT INTO prateleira VALUES (01, 54324555, 'Fabricante4', 100, 'Categoria1');
INSERT INTO prateleira VALUES (02, 54324555, 'Fabricante4', 200, 'Categoria2');
INSERT INTO prateleira VALUES (03, 54324555, 'Fabricante4',  50, 'Categoria3');
INSERT INTO prateleira VALUES (01, 54325111, 'Fabricante5', 100, 'Categoria1');
INSERT INTO prateleira VALUES (02, 54325111, 'Fabricante5', 200, 'Categoria2');
INSERT INTO prateleira VALUES (03, 54325111, 'Fabricante5',  50, 'Categoria3');
INSERT INTO prateleira VALUES (05, 54326124, 'Fabricante6', 200, 'Categoria6');
INSERT INTO prateleira VALUES (05, 54327897, 'Fabricante7',  50, 'Categoria7');
INSERT INTO prateleira VALUES (01, 53253545, 'Fabricante13', 2, 'Categoria20');
INSERT INTO prateleira VALUES (02, 53253545, 'Fabricante13', 2, 'Categoria21'); 
INSERT INTO prateleira VALUES (01, 12369420, 'Fabricante14', 2, 'Categoria16');
INSERT INTO prateleira VALUES (02, 12369420, 'Fabricante14', 2, 'Categoria16');
INSERT INTO prateleira VALUES (04, 54326124, 'Fabricante6', 2, 'Categoria18');
INSERT INTO prateleira VALUES (04, 54324555, 'Fabricante4', 2, 'Categoria18');
INSERT INTO prateleira VALUES (01, 48565232, 'Fabricante15', 2, 'Categoria17');
INSERT INTO prateleira VALUES (02, 48565232, 'Fabricante15', 2, 'Categoria19');
INSERT INTO prateleira VALUES (04, 54323568, 'Fabricante3', 2, 'Categoria19');

/*planograma(numero de produto, numero de prateleira, numero de serie, fabricante, faces, unidades, localizacao)*/
INSERT INTO planograma VALUES (1, 1, 54321567, 'Fabricante1', 2, 20, 'descr');
INSERT INTO planograma VALUES (2, 2, 54322657, 'Fabricante2', 2, 20, 'descr');
INSERT INTO planograma VALUES (4, 3, 54321567, 'Fabricante1', 2, 20, 'descr');
INSERT INTO planograma VALUES (5, 4, 54321567, 'Fabricante1', 2, 20, 'descr');
INSERT INTO planograma VALUES (7, 5, 54321567, 'Fabricante1', 2, 20, 'descr');
INSERT INTO planograma VALUES (1, 1, 54322657, 'Fabricante2', 2, 20, 'descr');
INSERT INTO planograma VALUES (7, 2, 54322657, 'Fabricante2', 2, 20, 'descr');
INSERT INTO planograma VALUES (4, 3, 54322657, 'Fabricante2', 2, 20, 'descr');
INSERT INTO planograma VALUES (1, 1, 54323568, 'Fabricante3', 2, 20, 'descr');
INSERT INTO planograma VALUES (9, 2, 54323568, 'Fabricante3', 2, 20, 'descr');
INSERT INTO planograma VALUES (8, 4, 54323568, 'Fabricante3', 2, 20, 'descr');
INSERT INTO planograma VALUES (1, 1, 54324555, 'Fabricante4', 2, 20, 'descr');
INSERT INTO planograma VALUES (4, 2, 54324555, 'Fabricante4', 2, 20, 'descr');
INSERT INTO planograma VALUES (7, 4, 54324555, 'Fabricante4', 2, 20, 'descr');
INSERT INTO planograma VALUES (1, 1, 54325111, 'Fabricante5', 2, 20, 'descr');
INSERT INTO planograma VALUES (5, 2, 54325111, 'Fabricante5', 2, 20, 'descr');
INSERT INTO planograma VALUES (7, 3, 54325111, 'Fabricante5', 2, 20, 'descr');
INSERT INTO planograma VALUES (6, 4, 54326124, 'Fabricante6', 2, 20, 'descr');
INSERT INTO planograma VALUES (7, 5, 54327897, 'Fabricante7', 2, 20, 'descr');
INSERT INTO planograma VALUES (5, 1, 53253545, 'Fabricante13', 2, 10, 'descr');
INSERT INTO planograma VALUES (1, 1, 53253545, 'Fabricante13', 2, 10, 'descr');
INSERT INTO planograma VALUES (10, 2, 53253545, 'Fabricante13', 2, 10, 'descr');
INSERT INTO planograma VALUES (1, 1, 12369420, 'Fabricante14', 2, 10, 'descr');
INSERT INTO planograma VALUES (2, 1, 12369420, 'Fabricante14', 2, 10, 'descr');
INSERT INTO planograma VALUES (6, 2, 12369420, 'Fabricante14', 2, 10, 'descr');
INSERT INTO planograma VALUES (3, 1, 48565232, 'Fabricante15', 2, 10, 'descr');
INSERT INTO planograma VALUES (4, 1, 48565232, 'Fabricante15', 2, 10, 'descr');
INSERT INTO planograma VALUES (8, 2, 48565232, 'Fabricante15', 2, 10, 'descr');
INSERT INTO planograma VALUES (9, 2, 48565232, 'Fabricante15', 2, 10, 'descr');
INSERT INTO planograma VALUES (14, 04, 54321567, 'Fabricante1', 2, 10, 'descr');
INSERT INTO planograma VALUES (18, 02, 12369420, 'Fabricante1', 2, 10, 'descr');


INSERT INTO retalhista VALUES (4, 'Retalhista1');
INSERT INTO retalhista VALUES (5, 'Retalhista2');
INSERT INTO retalhista VALUES (6, 'Retalhista3');
INSERT INTO retalhista VALUES (7, 'Retalhista4');
INSERT INTO retalhista VALUES (8, 'Retalhista5');
INSERT INTO retalhista VALUES (9, 'Retalhista6');
INSERT INTO retalhista VALUES (10, 'Retalhista7');
INSERT INTO retalhista VALUES (1, 'Retalhista8');
INSERT INTO retalhista VALUES (2, 'Retalhista9');
INSERT INTO retalhista VALUES (3, 'Retalhista10');
INSERT INTO retalhista VALUES (11, 'Retalhista11');
INSERT INTO retalhista VALUES (12, 'Retalhista12');
INSERT INTO retalhista VALUES (13, 'Retalhista13');
INSERT INTO retalhista VALUES (14, 'Retalhista14');
INSERT INTO retalhista VALUES (15, 'Retalhista15');

/*responsavel_por(nome da categoria, retalhista, numero de serie, fabricante)*/
INSERT INTO responsavel_por VALUES ('Categoria1', 4, 54321567, 'Fabricante1');
INSERT INTO responsavel_por VALUES ('Categoria17', 4, 48565232, 'Fabricante15');
INSERT INTO responsavel_por VALUES ('Categoria5', 8, 54325111, 'Fabricante5');
INSERT INTO responsavel_por VALUES ('Categoria7', 10, 54327897, 'Fabricante7');
INSERT INTO responsavel_por VALUES ('Categoria7', 11, 54328111, 'Fabricante8'); 
INSERT INTO responsavel_por VALUES ('Categoria2', 12, 54329000, 'Fabricante9');
INSERT INTO responsavel_por VALUES ('Categoria3', 13, 54330121, 'Fabricante10');
INSERT INTO responsavel_por VALUES ('Categoria4', 14, 54322657, 'Fabricante2');
INSERT INTO responsavel_por VALUES ('Categoria5', 15, 54332111, 'Fabricante12');
INSERT INTO responsavel_por VALUES ('Categoria21', 5, 53253545, 'Fabricante13');
INSERT INTO responsavel_por VALUES ('Categoria16', 2, 12369420, 'Fabricante14');
INSERT INTO responsavel_por VALUES ('Categoria18', 9, 54326124, 'Fabricante6');
INSERT INTO responsavel_por VALUES ('Categoria18', 9, 54324555, 'Fabricante4');
INSERT INTO responsavel_por VALUES ('Categoria19', 2, 54323568, 'Fabricante3');



/*evento_reposicao(numero produto, numero prateleira, numero de serie prateleira, numero de fabricante prateleira, instante, unidades, tin)*/
INSERT INTO evento_reposicao VALUES (1,  1, 54321567, 'Fabricante1', '2016-04-02 01:20:05', 5, 4);
INSERT INTO evento_reposicao VALUES (1,  1, 54321567, 'Fabricante1', '2016-04-09 01:21:05', 5, 4);
INSERT INTO evento_reposicao VALUES (2,  2, 54322657, 'Fabricante2', '2017-01-10 07:10:40', 5, 5);
INSERT INTO evento_reposicao VALUES (4,  1, 48565232, 'Fabricante15', '2014-02-10 07:10:40', 3, 4);
INSERT INTO evento_reposicao VALUES (14, 4, 54321567, 'Fabricante1', '2004-01-01 01:01:01', 1, 1);
INSERT INTO evento_reposicao VALUES (6,  4, 54326124, 'Fabricante6', '2004-01-01 01:01:01', 2, 6);
INSERT INTO evento_reposicao VALUES (10, 2, 53253545, 'Fabricante13', '2005-01-01 01:01:01', 6, 5);
INSERT INTO evento_reposicao VALUES (7,  4, 54324555, 'Fabricante4', '2002-05-02 01:01:01', 5, 9);
INSERT INTO evento_reposicao VALUES (8,  4, 54323568, 'Fabricante3', '2002-06-01 01:01:01', 5, 2);
INSERT INTO evento_reposicao VALUES (18, 02, 12369420, 'Fabricante1', '2002-01-04 01:01:01', 5, 14);

------------------The following queries will fail due to the existing ICs!-------------------

/*INSERT INTO categoria_simples VALUES ('Categoria6');
INSERT INTO super_categoria VALUES ('Categoria19');
INSERT INTO evento_reposicao VALUES (1, 1, 54321567, 'Fabricante1', '2016-04-02 01:20:05', 500, 4);
INSERT INTO evento_reposicao VALUES (07, 5, 54327897, 'Fabricante7', '2002-01-01 01:01:01', 5, 010);*/