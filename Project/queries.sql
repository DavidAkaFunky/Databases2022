/*Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
categorias? */

SELECT name
FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
WHERE 