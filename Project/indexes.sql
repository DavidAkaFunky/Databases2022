/*
SELECT T.nome, count(T.ean) 
FROM produto P, tem_categoria T 
WHERE p.cat = T.nome and P.desc like ‘A%’
GROUP BY T.nome
*/

/* Propomas a criação de um index do tipo hash para 'nome', pois na igualdade no WHERE toma vantagem do uso deste (tal como o GROUP BY) */
CREATE INDEX nome_index ON T USING hash

/* Por defeito, o ean já tem um index b tree, pois é a primary key da tabela P, assim sendo, não há necessidade de declarar um indice para este */

/* Propomos também a criação de um index do tipo hash para 'desc', pois melhoraria a velocidade de procura de descrições começadas por 'A' */
CREATE INDEX desc_index ON P USING hash