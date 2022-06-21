/*Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
categorias? */

SELECT nome
FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
GROUP BY tin
HAVING COUNT(*) >= ALL
    (SELECT COUNT(*)
    FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
    GROUP BY tin);
