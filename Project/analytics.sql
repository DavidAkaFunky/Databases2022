SELECT dia_semana, concelho, COUNT(*) as total
FROM vendas
WHERE '2007-01-01' <= CONCAT(CAST(ano AS VARCHAR), '-', CAST(mes AS VARCHAR), '-', CAST(dia_mes AS VARCHAR)) AS query_data AND CONCAT(CAST(ano AS VARCHAR), '-', CAST(mes AS VARCHAR), '-', CAST(dia_mes AS VARCHAR)) <= '2008-12-31'
GROUP BY CUBE (dia_semana, concelho);

SELECT concelho, cat, dia_semana, COUNT(*) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY CUBE (concelho, cat, dia_semana);