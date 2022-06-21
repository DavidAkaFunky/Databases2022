CREATE VIEW vendas(ean, cat, ano, trimestre, dia_mes, dia_semana, distrito, concelho, unidades) AS
    SELECT ean, nome AS cat, EXTRACT(YEAR from instante) AS ano, EXTRACT(QUARTER from instante) AS trimestre, EXTRACT(DAY from instante) AS dia_mes, EXTRACT(WEEKDAY from instante) AS dia_semana, distrito, concelho, unidades
    FROM (SELECT ean, nro, num_serie, fabricante, instante, unidades
          FROM evento_reposicao) AS evento_reposicao
    NATURAL JOIN tem_categoria
    NATURAL JOIN instalada_em
    NATURAL JOIN (SELECT nome AS local, distrito, concelho
                  FROM ponto_de_retalho) AS ponto_de_retalho;