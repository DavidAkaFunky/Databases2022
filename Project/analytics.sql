/* Analisar o número total de artigos vendidos num dado período (i.e. entre duas datas), por dia da semana, por concelho e no total. */

SELECT dia_semana, concelho, COUNT(*) as total
FROM vendas
WHERE '2007-01-01' <= CONCAT(CAST(ano AS VARCHAR), '-', CAST(mes AS VARCHAR), '-', CAST(dia_mes AS VARCHAR)) AS query_data AND CONCAT(CAST(ano AS VARCHAR), '-', CAST(mes AS VARCHAR), '-', CAST(dia_mes AS VARCHAR)) <= '2008-12-31'
GROUP BY CUBE (dia_semana, concelho);

/* Analisar o número total de artigos vendidos num dado distrito (i.e. “Lisboa”), por concelho, categoria, dia da semana e no total. */

SELECT concelho, cat, dia_semana, COUNT(*) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY CUBE (concelho, cat, dia_semana);