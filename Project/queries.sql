/*Qual o nome do retalhista (ou retalhistas) responsaveis pela reposicao do maior numero de
categorias? */

SELECT retalhista.nome
FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
GROUP BY tin
HAVING COUNT(*) >= ALL
    (SELECT COUNT(*)
    FROM retalhista NATURAL JOIN evento_reposicao NATURAL JOIN responsavel_por
    GROUP BY tin);

/*Qual o nome do ou dos retalhistas que são responsáveis por todas as categorias simples?*/





/*Quais os produtos (ean) que nunca foram repostos?*/

SELECT produto.ean
FROM produto
WHERE produto.ean
NOT IN(
	SELECT evento_reposicao.ean
	FROM evento_reposicao
) 

/*Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?*/





