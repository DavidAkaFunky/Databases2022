/*Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
categorias? */

SELECT nome
FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
GROUP BY tin
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                        FROM retalhista 
                        NATURAL JOIN evento_reposicao
                        NATURAL JOIN responsavel_por
                        GROUP BY tin);

/*Qual o nome do ou dos retalhistas que são responsáveis por todas as categorias simples?*/

SELECT DISTINCT nome
FROM categoria_simples
NATURAL JOIN SELECT (ean, nome as nome_cat
             FROM tem_categoria)
NATURAL JOIN SELECT (nome_cat, tin
             FROM responsavel_por)
NATURAL JOIN retalhista;

/*Quais os produtos (ean) que nunca foram repostos?*/

SELECT ean
FROM produto
WHERE ean
NOT IN (SELECT ean
	  FROM evento_reposicao);

/*Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?*/

SELECT ean
FROM (SELECT ean, COUNT(tin) AS total
      FROM evento_reposicao
      GROUP BY ean)
WHERE total = 1;